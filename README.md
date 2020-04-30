<h1 align="center"> Deep Learning for E.coli using Undirected Graphs </h1> 
  
***

Here we outline how to transform a data collection of genes (observed in expirements) as well as a gene corpus, into an undirected graph rerepresentation, then drop edges and predict them back using a self-supervised algorithm. This is synonymous to learning how well your model has learned the underlying features in your data. 

***

<h2 align="center"> Deployment Instructions </h2>

### 1. Utilize Ensemble to transform genes into Undirected Graph

Transform input data (`modi_data.txt` and `Modi_expression_rma.txt`) into MxN data matrix, with genes in rows, expirements in columns.

Step 1. `parse_modi.R in ./src on the above datasets`

### 2. 

