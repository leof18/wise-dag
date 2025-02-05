
MERGE (iteration:IterationLevel {level: 0});

MATCH (concept:Concept {name: "Clinical finding"})
MATCH (iteration:IterationLevel {level: 0})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Morphologically abnormal structure"})
MATCH (iteration:IterationLevel {level: 0})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 0})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 0})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure"})
MATCH (iteration:IterationLevel {level: 0})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Observable entity"})
MATCH (iteration:IterationLevel {level: 0})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 0})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 0})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 1});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neurological finding"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Morphologically abnormal structure"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding by site"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disease"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Evaluation finding"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Observable entity"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Health-related behavior finding"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 1})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 2});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neurological finding"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Morphologically abnormal structure"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding by site"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Evaluation finding"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Observable entity"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Health-related behavior finding"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder by body site"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 2})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 3});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neurological finding"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Morphologically abnormal structure"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding by site"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Evaluation finding"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Observable entity"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Regimes and therapies"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Health-related behavior finding"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder by body site"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 3})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 4});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neurological finding"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Morphologically abnormal structure"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "General finding of soft tissue"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder by body site"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiovascular finding"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Evaluation finding"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Observable entity"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of brain"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Regimes and therapies"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Health-related behavior finding"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysfunction of urinary bladder"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Spasticity"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 4})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 5});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neurological finding"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Morphologically abnormal structure"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "General finding of soft tissue"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of body system"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiovascular finding"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of soft tissue"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Evaluation finding"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Observable entity"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of brain"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Regimes and therapies"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Health-related behavior finding"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammation of specific body structures or tissue"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysfunction of urinary bladder"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Spasticity"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pulmonary embolism"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 5})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 6});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neurological finding"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Morphologically abnormal structure"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "General finding of soft tissue"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of endocrine system"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysphagia"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of cardiovascular system"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of soft tissue"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Evaluation finding"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Observable entity"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of brain"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Regimes and therapies"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Health-related behavior finding"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammation of specific body structures or tissue"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sickling disorder due to hemoglobin S"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysfunction of urinary bladder"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiovascular finding"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Spasticity"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of autonomic nervous system"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pulmonary embolism"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Fracture of bone"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 6})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 7});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neurological finding"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Morphologically abnormal structure"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "General finding of soft tissue"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of endocrine system"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysphagia"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiovascular finding"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypertensive disorder"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Low blood pressure"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of soft tissue"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Heart disease"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Evaluation finding"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Observable entity"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Transient cerebral ischemia"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of brain"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Moyamoya disease"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Regimes and therapies"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Health-related behavior finding"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral venous sinus thrombosis"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammation of specific body structures or tissue"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sickling disorder due to hemoglobin S"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysfunction of urinary bladder"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Thrombosis"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Spasticity"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of autonomic nervous system"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pulmonary embolism"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular disorder"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Fracture of bone"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 7})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 8});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neurological finding"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Morphologically abnormal structure"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "General finding of soft tissue"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of endocrine system"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysphagia"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiovascular finding"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypertensive disorder"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Low blood pressure"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of soft tissue"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Heart disease"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Evaluation finding"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Observable entity"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Transient cerebral ischemia"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Delirium"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Seizure"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Encephalitis"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Moyamoya disease"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Regimes and therapies"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Health-related behavior finding"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion of brain"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral venous sinus thrombosis"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral atrophy"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammation of specific body structures or tissue"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sickling disorder due to hemoglobin S"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysfunction of urinary bladder"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Thrombosis"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Spasticity"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of autonomic nervous system"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pulmonary embolism"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular disorder"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Enlarged perivascular spaces"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Fracture of bone"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Loss of brain structural integrity"})
MATCH (iteration:IterationLevel {level: 8})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 9});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neurological finding"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Morphologically abnormal structure"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "General finding of soft tissue"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of endocrine system"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysphagia"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiovascular finding"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypertensive disorder"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Low blood pressure"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of soft tissue"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Evaluation finding"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Myocardial infarction"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Observable entity"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Transient cerebral ischemia"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Delirium"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Seizure"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Encephalitis"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Moyamoya disease"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Regimes and therapies"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of cardiac function"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Health-related behavior finding"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion of brain"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Takotsubo cardiomyopathy"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patent foramen ovale"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral venous sinus thrombosis"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral atrophy"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammation of specific body structures or tissue"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sickling disorder due to hemoglobin S"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysfunction of urinary bladder"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Thrombosis"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Acute infective endocarditis"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Spasticity"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of autonomic nervous system"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pulmonary embolism"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Endocarditis"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular disorder"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac arrhythmia"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Enlarged perivascular spaces"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Fracture of bone"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Loss of brain structural integrity"})
MATCH (iteration:IterationLevel {level: 9})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 10});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neurological finding"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Morphologically abnormal structure"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "General finding of soft tissue"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of endocrine system"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysphagia"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac arrhythmia"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac finding"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypertensive disorder"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Low blood pressure"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of soft tissue"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Evaluation finding"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Myocardial infarction"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Observable entity"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Transient cerebral ischemia"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Delirium"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Seizure"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Encephalitis"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Moyamoya disease"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Regimes and therapies"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of cardiac function"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Health-related behavior finding"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion of brain"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Takotsubo cardiomyopathy"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patent foramen ovale"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral venous sinus thrombosis"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Thrombosis"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral atrophy"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammation of specific body structures or tissue"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sickling disorder due to hemoglobin S"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysfunction of urinary bladder"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased collateral circulation"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Acute infective endocarditis"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Spasticity"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased cardiac stroke volume"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of autonomic nervous system"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pulmonary embolism"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Endocarditis"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular disorder"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Enlarged perivascular spaces"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Fracture of bone"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Loss of brain structural integrity"})
MATCH (iteration:IterationLevel {level: 10})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 11});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neurological finding"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Morphologically abnormal structure"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "General finding of soft tissue"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of endocrine system"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysphagia"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac arrhythmia"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac finding"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypertensive disorder"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Low blood pressure"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of soft tissue"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Measurement finding"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Myocardial infarction"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Observable entity"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Transient cerebral ischemia"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Delirium"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Seizure"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Encephalitis"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Moyamoya disease"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Regimes and therapies"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of cardiac function"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Health-related behavior finding"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion of brain"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Takotsubo cardiomyopathy"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patent foramen ovale"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral venous sinus thrombosis"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Thrombosis"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral atrophy"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Genetic predisposition"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammation of specific body structures or tissue"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sickling disorder due to hemoglobin S"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysfunction of urinary bladder"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Leuko-araiosis"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased collateral circulation"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "DNA damage"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypercoagulability state"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Acute infective endocarditis"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Spasticity"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased cardiac stroke volume"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of autonomic nervous system"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pulmonary embolism"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Endocarditis"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular disorder"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Enlarged perivascular spaces"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Fracture of bone"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Loss of brain structural integrity"})
MATCH (iteration:IterationLevel {level: 11})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 12});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neurological finding"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Morphologically abnormal structure"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "General finding of soft tissue"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of endocrine system"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysphagia"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac arrhythmia"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac finding"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypertensive disorder"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Low blood pressure"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of soft tissue"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Measurement finding"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Myocardial infarction"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Risk of cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Transient cerebral ischemia"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Delirium"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Seizure"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Encephalitis"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Moyamoya disease"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Regimes and therapies"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of cardiac function"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Health-related behavior finding"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion of brain"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Takotsubo cardiomyopathy"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood-brain barrier"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patent foramen ovale"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion size"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral venous sinus thrombosis"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Thrombosis"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral atrophy"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Genetic predisposition"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammation of specific body structures or tissue"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Glomerular filtration rate"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sickling disorder due to hemoglobin S"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysfunction of urinary bladder"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Leuko-araiosis"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Quality of life satisfaction"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Postprocedural recovery status"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased collateral circulation"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "DNA damage"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypercoagulability state"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Acute infective endocarditis"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Age factor"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Spasticity"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased cardiac stroke volume"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of autonomic nervous system"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pulmonary embolism"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Endocarditis"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular disorder"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Enlarged perivascular spaces"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Fracture of bone"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Loss of brain structural integrity"})
MATCH (iteration:IterationLevel {level: 12})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 13});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neuronal survival"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Morphologically abnormal structure"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "General finding of soft tissue"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sympathetic activation"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of endocrine system"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysphagia"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac arrhythmia"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac finding"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypertensive disorder"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Low blood pressure"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of soft tissue"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Measurement finding"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Myocardial infarction"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Risk of cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Transient cerebral ischemia"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Delirium"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Seizure"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Encephalitis"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Moyamoya disease"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Regimes and therapies"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of cardiac function"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Health-related behavior finding"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion of brain"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Takotsubo cardiomyopathy"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood-brain barrier"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patent foramen ovale"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion size"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral venous sinus thrombosis"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pain"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Thrombosis"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral atrophy"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Genetic predisposition"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammation of specific body structures or tissue"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Glomerular filtration rate"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sickling disorder due to hemoglobin S"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysfunction of urinary bladder"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Leuko-araiosis"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Quality of life satisfaction"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Postprocedural recovery status"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased collateral circulation"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "DNA damage"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypercoagulability state"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Acute infective endocarditis"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Age factor"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Spasticity"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased cardiac stroke volume"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of autonomic nervous system"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Paralysis"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pulmonary embolism"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Aphasia"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Endocarditis"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular disorder"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Enlarged perivascular spaces"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Fracture of bone"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Loss of brain structural integrity"})
MATCH (iteration:IterationLevel {level: 13})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 14});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neuronal survival"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Growth alteration"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "General finding of soft tissue"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sympathetic activation"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of endocrine system"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysphagia"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac arrhythmia"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac finding"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypertensive disorder"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Low blood pressure"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of soft tissue"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Measurement finding"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Myocardial infarction"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Risk of cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Transient cerebral ischemia"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Delirium"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Seizure"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Encephalitis"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Moyamoya disease"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Regimes and therapies"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of cardiac function"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Health-related behavior finding"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion of brain"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Takotsubo cardiomyopathy"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood-brain barrier"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patent foramen ovale"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion size"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral venous sinus thrombosis"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular sclerosis"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pain"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Thrombosis"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral atrophy"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Genetic predisposition"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Complete obstruction"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammation of specific body structures or tissue"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Glomerular filtration rate"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sickling disorder due to hemoglobin S"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stenosis"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysfunction of urinary bladder"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Leuko-araiosis"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Quality of life satisfaction"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Postprocedural recovery status"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased collateral circulation"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "DNA damage"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypercoagulability state"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Acute infective endocarditis"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Age factor"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Spasticity"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased cardiac stroke volume"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of autonomic nervous system"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Paralysis"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pulmonary embolism"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Aphasia"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Endocarditis"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular disorder"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Enlarged perivascular spaces"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Fracture of bone"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Loss of brain structural integrity"})
MATCH (iteration:IterationLevel {level: 14})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 15});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neuronal survival"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Growth alteration"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "General finding of soft tissue"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sympathetic activation"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of endocrine system"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysphagia"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac arrhythmia"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac finding"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypertensive disorder"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Low blood pressure"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of soft tissue"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Measurement finding"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Myocardial infarction"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Risk of cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Transient cerebral ischemia"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Delirium"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Seizure"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Encephalitis"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Moyamoya disease"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Care regime"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of cardiac function"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Health-related behavior finding"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion of brain"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Takotsubo cardiomyopathy"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood-brain barrier"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patent foramen ovale"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion size"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral venous sinus thrombosis"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular sclerosis"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cognitive skills training"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pain"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Thrombosis"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral atrophy"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Continuous positive airway pressure ventilation treatment"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Genetic predisposition"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Complete obstruction"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammation of specific body structures or tissue"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Glomerular filtration rate"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sickling disorder due to hemoglobin S"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stenosis"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysfunction of urinary bladder"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Leuko-araiosis"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Quality of life satisfaction"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Postprocedural recovery status"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased collateral circulation"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "DNA damage"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypercoagulability state"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Acute infective endocarditis"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Age factor"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Psychotherapy"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Spasticity"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased cardiac stroke volume"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of autonomic nervous system"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Paralysis"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pulmonary embolism"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Aphasia"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Endocarditis"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular disorder"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Smoking cessation therapy"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Enlarged perivascular spaces"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Fracture of bone"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Loss of brain structural integrity"})
MATCH (iteration:IterationLevel {level: 15})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 16});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neuronal survival"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Growth alteration"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "General finding of soft tissue"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sympathetic activation"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of endocrine system"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysphagia"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac arrhythmia"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac finding"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypertensive disorder"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Low blood pressure"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of soft tissue"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Measurement finding"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Myocardial infarction"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Risk of cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Transient cerebral ischemia"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Delirium"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Seizure"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Encephalitis"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Moyamoya disease"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Care regime"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of cardiac function"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activity exercise pattern"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion of brain"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Takotsubo cardiomyopathy"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood-brain barrier"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patent foramen ovale"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Current drinker"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion size"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral venous sinus thrombosis"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular sclerosis"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cognitive skills training"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pain"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Thrombosis"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral atrophy"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Continuous positive airway pressure ventilation treatment"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Genetic predisposition"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Complete obstruction"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammation of specific body structures or tissue"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Passive smoker"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Glomerular filtration rate"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sickling disorder due to hemoglobin S"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stenosis"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysfunction of urinary bladder"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Leuko-araiosis"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Quality of life satisfaction"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Postprocedural recovery status"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased collateral circulation"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "DNA damage"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypercoagulability state"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Smoker"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Acute infective endocarditis"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Age factor"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Psychotherapy"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Spasticity"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased cardiac stroke volume"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of autonomic nervous system"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Paralysis"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pulmonary embolism"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Aphasia"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Endocarditis"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular disorder"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased alcohol consumption"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Smoking cessation therapy"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Enlarged perivascular spaces"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Fracture of bone"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Loss of brain structural integrity"})
MATCH (iteration:IterationLevel {level: 16})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 17});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neuronal survival"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Growth alteration"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cachexia"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sympathetic activation"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of endocrine system"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysphagia"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac arrhythmia"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac finding"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypertensive disorder"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Low blood pressure"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of soft tissue"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Measurement finding"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Myocardial infarction"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Risk of cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Transient cerebral ischemia"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Delirium"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Seizure"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Encephalitis"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Moyamoya disease"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Care regime"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of cardiac function"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activity exercise pattern"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion of brain"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Takotsubo cardiomyopathy"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood-brain barrier"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patent foramen ovale"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Current drinker"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion size"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral venous sinus thrombosis"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular sclerosis"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cognitive skills training"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pain"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Thrombosis"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral atrophy"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Continuous positive airway pressure ventilation treatment"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Genetic predisposition"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Complete obstruction"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammation of specific body structures or tissue"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Passive smoker"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Glomerular filtration rate"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sickling disorder due to hemoglobin S"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stenosis"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysfunction of urinary bladder"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Leuko-araiosis"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Quality of life satisfaction"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Postprocedural recovery status"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased collateral circulation"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "DNA damage"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypercoagulability state"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Smoker"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Acute infective endocarditis"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Age factor"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Psychotherapy"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Spasticity"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased cardiac stroke volume"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of autonomic nervous system"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Paralysis"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pulmonary embolism"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Aphasia"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Endocarditis"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular disorder"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased alcohol consumption"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Smoking cessation therapy"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Enlarged perivascular spaces"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Fracture of bone"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Loss of brain structural integrity"})
MATCH (iteration:IterationLevel {level: 17})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 18});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neuronal survival"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Growth alteration"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Substance"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cachexia"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sympathetic activation"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of endocrine system"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysphagia"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac arrhythmia"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of cardiac function"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypertensive disorder"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Low blood pressure"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of soft tissue"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Heart disease"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Measurement finding"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Myocardial infarction"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Risk of cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Transient cerebral ischemia"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Delirium"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Seizure"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Encephalitis"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Moyamoya disease"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Care regime"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activity exercise pattern"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion of brain"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Takotsubo cardiomyopathy"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood-brain barrier"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patent foramen ovale"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Current drinker"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion size"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral venous sinus thrombosis"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular sclerosis"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cognitive skills training"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pain"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Thrombosis"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral atrophy"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Continuous positive airway pressure ventilation treatment"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Genetic predisposition"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Complete obstruction"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammation of specific body structures or tissue"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Passive smoker"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Glomerular filtration rate"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sickling disorder due to hemoglobin S"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stenosis"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysfunction of urinary bladder"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Leuko-araiosis"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Quality of life satisfaction"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Postprocedural recovery status"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased collateral circulation"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "DNA damage"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypercoagulability state"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Smoker"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Acute infective endocarditis"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Age factor"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Psychotherapy"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Spasticity"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased cardiac stroke volume"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of autonomic nervous system"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Paralysis"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pulmonary embolism"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Aphasia"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Endocarditis"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular disorder"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased alcohol consumption"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Smoking cessation therapy"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac remodeling"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Enlarged perivascular spaces"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Fracture of bone"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Loss of brain structural integrity"})
MATCH (iteration:IterationLevel {level: 18})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 19});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neuronal survival"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Growth alteration"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Biological substance"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cachexia"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sympathetic activation"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of endocrine system"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysphagia"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac arrhythmia"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of cardiac function"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypertensive disorder"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Low blood pressure"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of soft tissue"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Heart disease"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Measurement finding"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Myocardial infarction"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Risk of cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Transient cerebral ischemia"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Delirium"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Seizure"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Encephalitis"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Moyamoya disease"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Care regime"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activity exercise pattern"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion of brain"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Takotsubo cardiomyopathy"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood-brain barrier"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patent foramen ovale"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Current drinker"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion size"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Nutritional disorder"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral venous sinus thrombosis"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular sclerosis"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of lesion"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cognitive skills training"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pain"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activities of daily living assessment"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of glucose metabolism"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Thrombosis"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Admission to stroke unit"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "FH: Cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cerebral atrophy"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patient position finding"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dyslipidemia"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Antidiabetic agent"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Continuous positive airway pressure ventilation treatment"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Genetic predisposition"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased body mass index"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Complete obstruction"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Body temperature above reference range"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammation of specific body structures or tissue"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sequelae of neurological disorders"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure involving urinary catheter"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Passive smoker"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "N-terminal pro-B-type natriuretic peptide"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Preventive procedure"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding related to ability to mobilize"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Glomerular filtration rate"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sickling disorder due to hemoglobin S"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stenosis"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysfunction of urinary bladder"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Weight loss"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Leuko-araiosis"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Quality of life satisfaction"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Postprocedural recovery status"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Uses oral contraception"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Stress"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Education and/or schooling finding"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased collateral circulation"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "DNA damage"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypercoagulability state"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Smoker"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pregnancy"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood glucose management"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Acute infective endocarditis"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Death"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social isolation"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Age factor"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Psychotherapy"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Spasticity"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Obesity"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Increased cardiac stroke volume"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of autonomic nervous system"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Metabolic syndrome X"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Paralysis"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Depressive disorder"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Pulmonary embolism"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Aphasia"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Endocarditis"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Male"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Malignant neoplastic disease"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Impaired cognition"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Vascular disorder"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Physical fitness state"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased alcohol consumption"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Smoking cessation therapy"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac remodeling"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Finding of renal function"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Enlarged perivascular spaces"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Fracture of bone"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Production of reactive oxygen species"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Loss of brain structural integrity"})
MATCH (iteration:IterationLevel {level: 19})
MERGE (concept)-[:PART_OF]->(iteration);

MERGE (iteration:IterationLevel {level: 20});

MATCH (concept:Concept {name: "Immune system finding"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Neuronal survival"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Growth alteration"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time to therapy"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Endothelial microvesicles"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cachexia"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Time until diagnosis"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sympathetic activation"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social context"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Urinary incontinence"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Kidney disease"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of endocrine system"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Inflammatory disorder"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Leukocyte-derived microvesicles"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dysphagia"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Cardiac arrhythmia"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Sleep disorder"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of cardiac function"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Hypertensive disorder"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Low blood pressure"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disorder of soft tissue"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Heart disease"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Assessment using assessment scale"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Introduction procedure"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Functionally dependent"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Prediabetes"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Measurement finding"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Bleeding"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Central nervous system complication"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Surgical procedure"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Myocardial infarction"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Infectious disease"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Risk of cardiovascular disease"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Transient cerebral ischemia"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Delirium"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Seizure"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Encephalitis"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Moyamoya disease"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Troponin"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Care regime"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Able to cope"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Dietary finding"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Removal"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Activity exercise pattern"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion of brain"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Takotsubo cardiomyopathy"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Disability"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Falls"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Social worker involved"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Blood-brain barrier"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Patent foramen ovale"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Decreased vascular flow"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Current drinker"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Congenital malformation"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Procedure with a clinical finding focus"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);

MATCH (concept:Concept {name: "Lesion size"})
MATCH (iteration:IterationLevel {level: 20})
MERGE (concept)-[:PART_OF]->(iteration);
