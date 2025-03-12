import React from "react";
import logo from '../../assets/logo.png';
import wiseDagDiagram from '../../assets/wiseDagDiagram.png'; // Add your DAG visualization image

const AboutUs = () => {
  return (
    <div className="about-us">
      <h1>About WISE-DAG</h1>
      <p>
        WISE-DAG (<strong>Wisdom of Stroke Experts translated into Directed Acyclic Graphs</strong>) 
        is a research initiative that focuses on structuring expert knowledge in stroke 
        treatment and decision-making into a user-friendly, interactive <strong>Directed Acyclic Graph (DAG)</strong>.
      </p>
      <p>
        This project is part of <strong>Charité’s Stroke Research Program</strong> and aims to 
        improve clinical decision-making by aggregating expert opinions and research 
        findings into a structured format. Through this approach, clinicians can 
        visualize treatment pathways, understand complex dependencies, and enhance 
        patient care strategies.
      </p>
      <p>
        Our team is working on a modern frontend to present WISE-DAG effectively, 
        ensuring an intuitive interface where users can explore different 
        granularity levels, expand nodes dynamically, and interact with medical 
        decision pathways.
      </p>

      {/* Visual Representation */}
      <div className="diagram-container">
        <h2>Visual Representation of WISE-DAG</h2>
        <img src={wiseDagDiagram} alt="WISE-DAG Diagram" className="wise-dag-image" />
        <p className="diagram-caption">An example of how WISE-DAG structures expert knowledge into a directed acyclic graph.</p>
      </div>

      <p>
        Learn more about the project at {" "}
        <a 
          href="https://schlaganfallcentrum.charite.de/en/research/selected_projects/wise_dag" 
          target="_blank" 
          rel="noopener noreferrer"
        >
          Charité's WISE-DAG Page
        </a>.
      </p>
    </div>
  );
};

export default AboutUs;
