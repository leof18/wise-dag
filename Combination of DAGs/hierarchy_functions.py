import numpy as np
import networkx as nx
from itertools import combinations
from transformers import AutoTokenizer, AutoModel
import torch
from sklearn.manifold import TSNE
import plotly.graph_objects as go


def get_unique_coded_terms(dag_df):
    """
    Takes the DAG dataframe and returns a set of all unique codes in the Exposure and Outcome columns. 

    Args:
        dag_df (pandas.DataFrame): Standardized DAG dataframe.

    Returns:
        set[str]: A set of all the unique terms.
    """    

    # Only select coded terms (terms that were not coded still have their original name instead of a code)
    filtered_dag_df =  dag_df[dag_df.Exposure.str.isdigit() & dag_df.Outcome.str.isdigit()]

    set_of_terms = set(filtered_dag_df['Exposure']).union(set(filtered_dag_df['Outcome'])) 

    return set_of_terms


def analyze_snomed_hierarchy(concept_ancestor_df, my_terms):
    """
    Analyze the hierarchy of terms and return summary statistics.

    Args:
        concept_ancestor_df (pd.DataFrame): DataFrame with columns ['ancestor_concept_id', 'descendant_concept_id', 'max_levels_of_separation'].
        my_terms (set): Set of terms to analyze.

    Returns:
        dict: A dictionary with the following keys:
            - 'root_term_count': Number of root terms and total terms.
            - 'average_children_per_root': Average number of child nodes for root terms.
            - 'example_root_with_children': Example root term with its child nodes.
    """
    # Filter ancestors and descendants based on my_terms
    filtered_ancestors = concept_ancestor_df[
        concept_ancestor_df['ancestor_concept_id'].isin(my_terms) & 
        concept_ancestor_df['descendant_concept_id'].isin(my_terms)
    ]

    # Remove self-references
    filtered_ancestors = filtered_ancestors[filtered_ancestors.max_levels_of_separation > 0]

    # Identify root terms (terms with no ancestors in the dataset)
    descendants_terms = set(filtered_ancestors['descendant_concept_id'])
    root_terms = my_terms - descendants_terms

    # Calculate statistics
    total_terms = len(my_terms)
    num_root_terms = len(root_terms)

    # Build the hierarchy for root terms
    def build_hierarchy(term, level):
        direct_descendants = filtered_ancestors[
            (filtered_ancestors['ancestor_concept_id'] == term) & 
            (filtered_ancestors['max_levels_of_separation'] == level)
        ]['descendant_concept_id'].tolist()
        return direct_descendants

    # Collect child counts for each root
    child_counts = {}
    example_root_with_children = None
    for root in root_terms:
        children = build_hierarchy(root, 1)
        child_counts[root] = len(children)
        if example_root_with_children is None and children:
            example_root_with_children = {'root': root, 'children': children}

    # Average number of child nodes per root
    avg_children_per_root = (
        sum(child_counts.values()) / num_root_terms if num_root_terms > 0 else 0
    )

    # Return the results
    return {
        'root_term_count': f'{num_root_terms} out of {total_terms} terms are root nodes',
        'average_children_per_root': np.round(avg_children_per_root,2),
        'example_root_with_children': example_root_with_children,
    }


def create_SNOMED_CT_graph_based_on_terms(my_terms, concept_df, concept_relationship_df, selected_relationship_ids):
    """
    Creates a pruned SNOMED CT hierarchy graph based on the given terms.

    This function builds a directed graph representing the SNOMED CT hierarchy using 
    specified relationships and prunes the graph to include only the relevant nodes 
    (ancestors, descendants, and the terms themselves) of the provided terms.

    Args:
        my_terms (set): A set of concept IDs to include in the graph.
        concept_df (pd.DataFrame): A DataFrame containing SNOMED concepts, 
            typically with at least the columns 'concept_id' and 'vocabulary_id'. 
            Only rows where 'vocabulary_id' equals 'SNOMED' are considered.
        concept_relationship_df (pd.DataFrame): A DataFrame containing concept relationships, 
            typically with at least the columns 'concept_id_1', 'concept_id_2', and 'relationship_id'.
        selected_relationship_ids (list): A list of relationship IDs to include when building the graph.

    Returns:
        networkx.DiGraph: A pruned directed graph containing relevant SNOMED CT terms 
        and their relationships. Each edge has an attribute `relationship_type` that 
        indicates the type of relationship between nodes.

    Prints:
        - Number of nodes and edges in the resulting graph.
        - A warning if any of the input terms are missing from the resulting graph.
    """

    snomed_concepts = concept_df[concept_df['vocabulary_id'] == 'SNOMED']
    snomed_relationships = concept_relationship_df[
        (concept_relationship_df['concept_id_1'].isin(snomed_concepts['concept_id'])) &
        (concept_relationship_df['concept_id_2'].isin(snomed_concepts['concept_id'])) & 
        (concept_relationship_df['relationship_id'].isin(selected_relationship_ids))
    ]

    # Create graph of SNOMED CT hierarchy
    G = nx.DiGraph()
    edges_with_attributes = zip(
        snomed_relationships['concept_id_1'],
        snomed_relationships['concept_id_2'],
        snomed_relationships['relationship_id']
    )
    G.add_edges_from((u, v, {'relationship_type': r}) for u, v, r in edges_with_attributes)

    # Prune graph to only contain necessary nodes (parents of the terms)
    all_ancestors = {node: nx.ancestors(G, node) for node in my_terms}
    relevant_nodes = set(my_terms).union(*all_ancestors.values())
    pruned_graph = G.subgraph(relevant_nodes).copy()

    # Checks
    print(f"Number of nodes in graph of relevant SNOMED CT terms: {pruned_graph.number_of_nodes()}")
    print(f"Number of edges in graph of relevant SNOMED CT terms: {pruned_graph.number_of_edges()}")

    missing_terms = [term for term in my_terms if term not in pruned_graph]
    if missing_terms:
        print(f"Warning: These terms are missing from the graph: {missing_terms}")
    else:
        print("All terms are present in the graph.")

    return pruned_graph


def find_lca_and_distance(pruned_graph, term1, term2):
    """
    Finds the least common ancestor (LCA) and the total distance between two terms in a directed graph. 
    The LCA is determined as the common ancestor with the smallest combined distance to the two terms.

    Args:
        pruned_graph (networkx.DiGraph): A pruned directed graph containing nodes and edges representing 
            hierarchical relationships.
        term1 (int): The first term (node) for which to find the LCA.
        term2 (int): The second term (node) for which to find the LCA.

    Returns:
        tuple: A tuple containing:
            - lca (int): The least common ancestor of the two terms.
            - total_distance (int): The total shortest-path distance from the LCA to both terms.

    Raises:
        ValueError: If one or both terms are not present in the graph or if no common ancestor exists.

    """
    if term1 not in pruned_graph or term2 not in pruned_graph:
        raise ValueError(f"One or both terms ({term1}, {term2}) are not in the pruned graph.")
    
    # Find ancestors of both terms, including the terms themselves
    ancestors1 = nx.ancestors(pruned_graph, term1) | {term1}
    ancestors2 = nx.ancestors(pruned_graph, term2) | {term2}
    
    # Find common ancestors
    common_ancestors = ancestors1 & ancestors2
    if not common_ancestors:
        raise ValueError(f"No common ancestors found for terms {term1} and {term2}.")
    
    # Precompute distances from all common ancestors to both terms
    distances_to_term1 = {
        ancestor: nx.shortest_path_length(pruned_graph, ancestor, term1)
        for ancestor in common_ancestors
    }
    distances_to_term2 = {
        ancestor: nx.shortest_path_length(pruned_graph, ancestor, term2)
        for ancestor in common_ancestors
    }

    # Find the least common ancestor with the smallest combined distance
    lca = min(
        common_ancestors,
        key=lambda ancestor: distances_to_term1[ancestor] + distances_to_term2[ancestor]
    )
    total_distance = distances_to_term1[lca] + distances_to_term2[lca]
    
    return lca, total_distance


def compute_lcas_and_distances(my_terms, pruned_graph):
    """
    Computes the least common ancestors (LCAs) and distances for all pairs of terms.

    Args:
        my_terms (set): A set of terms (nodes) for which to compute LCAs and distances.
        pruned_graph (networkx.DiGraph): A pruned directed graph containing nodes and edges 
            representing hierarchical relationships.

    Returns:
        tuple: A tuple containing:
            - lcas (dict): A dictionary where the keys are frozensets of term pairs and 
              the values are their least common ancestors.
            - distances (dict): A dictionary where the keys are frozensets of term pairs and 
              the values are the total shortest-path distances to their LCA.

    Notes:
        - The function computes LCAs and distances for all unique pairs of terms in `my_terms`.
        - Uses the `find_lca_and_distance` function to compute results for individual pairs.
    """

    lcas = {}
    distances = {}
    
    # Compute LCA and distance for each pair of terms
    for term1, term2 in combinations(my_terms, 2):
        lca, distance = find_lca_and_distance(pruned_graph, term1, term2)
        lcas[frozenset((term1, term2))] = lca
        distances[frozenset((term1, term2))] = distance

    return lcas, distances


def graph_distance_matrix_in_3d(distance_matrix, terms, title="3D Distance Matrix Visualization"):
    """
    Visualize a distance matrix in 3D using t-SNE and Plotly.

    Args:
        distance_matrix (pd.DataFrame): A symmetric distance matrix (shape: [n_terms, n_terms]).
        terms (list): A list of terms corresponding to the rows/columns of the distance matrix.
        title (str): Title of the plot. Defaults to "3D Distance Matrix Visualization".

    Returns:
        None: Displays a 3D scatter plot of the terms based on the distance matrix.
    """
    # Ensure distance matrix is symmetric
    assert np.allclose(distance_matrix.values, distance_matrix.values.T), "Distance matrix must be symmetric."
    
    # Convert distance matrix to a NumPy array
    distance_array = distance_matrix.values

    # Perform t-SNE on the distance matrix
    tsne = TSNE(n_components=3, metric="precomputed", init='random', random_state=42)
    reduced_points = tsne.fit_transform(distance_array)

    # Extract coordinates for the plot
    x = reduced_points[:, 0]
    y = reduced_points[:, 1]
    z = reduced_points[:, 2]

    # Create a 3D scatter plot
    fig = go.Figure()

    fig.add_trace(go.Scatter3d(
        x=x,
        y=y,
        z=z,
        mode='markers+text',
        marker=dict(
            size=5,
            opacity=0.8
        ),
        text=terms,
        textposition="top center"
    ))

    # Update layout
    fig.update_layout(
        title=title,
        scene=dict(
            xaxis_title="t-SNE Dimension 1",
            yaxis_title="t-SNE Dimension 2",
            zaxis_title="t-SNE Dimension 3"
        ),
        margin=dict(l=0, r=0, b=0, t=40)
    )

    fig.show()


def get_embeddings(terms, model_name):
    """
    Generate embeddings for a list of terms using a specified model.

    Args:
        terms (list): A list of strings for which embeddings will be generated.
        model_name (str): The name of the pre-trained model.

    Returns:
        dict, list, np.ndarray: A dictionary of term-to-embedding mappings,
                                 a list of terms,
                                 and a NumPy matrix of embeddings.
    """
    # Load the tokenizer and model
    tokenizer = AutoTokenizer.from_pretrained(model_name)
    model = AutoModel.from_pretrained(model_name)

    # Generate embeddings for the terms
    embeddings = {}
    for term in terms:
        inputs = tokenizer(term, return_tensors="pt", padding=True, truncation=True)
        with torch.no_grad():
            outputs = model(**inputs)
        # Extract [CLS] token embedding
        cls_embedding = outputs.last_hidden_state[:, 0, :].squeeze(0)
        embeddings[term] = cls_embedding

    embedding_name = list(embeddings.keys())
    embedding_matrix = torch.stack(list(embeddings.values())).numpy()

    return embeddings, embedding_name, embedding_matrix


def graph_reduced_in_3d(embedding_matrix, term_labels, title="3D Term Visualization"):
    """
    Perform 3D t-SNE reduction and plot a 3D scatter plot of embeddings.

    Args:
        embedding_matrix (numpy.ndarray): The matrix of embeddings to reduce (shape: [n_samples, n_features]).
        term_labels (list): A list of labels corresponding to the embeddings.
        title (str): The title for the plot. Defaults to "3D Term Visualization".

    Returns:
        None: Displays the 3D scatter plot.
    """
    # Perform 3D t-SNE
    tsne = TSNE(n_components=3, random_state=42)
    reduced_embeddings = tsne.fit_transform(embedding_matrix)

    # Extract coordinates
    x = reduced_embeddings[:, 0]
    y = reduced_embeddings[:, 1]
    z = reduced_embeddings[:, 2]

    # Create a 3D scatter plot
    fig = go.Figure()

    fig.add_trace(go.Scatter3d(
        x=x,
        y=y,
        z=z,
        mode='markers+text',
        marker=dict(
            size=5,
            opacity=0.8
        ),
        text=term_labels,
        textposition="top center"
    ))

    # Update layout
    fig.update_layout(
        title=title,
        scene=dict(
            xaxis_title="t-SNE Dimension 1",
            yaxis_title="t-SNE Dimension 2",
            zaxis_title="t-SNE Dimension 3"
        ),
        margin=dict(l=0, r=0, b=0, t=40)
    )

    fig.show()