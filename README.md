<h1 align="center"> Deep Learning for E.coli using Undirected Graphs </h1> 
  
***

Here we outline how to transform a data collection of genes (observed in expirements) as well as a gene corpus, into an undirected graph rerepresentation, then drop edges and predict them back using a self-supervised algorithm. This is synonymous to learning how well your model has learned the underlying features in your data. 

***

<h2 align="center"> Deployment Instructions </h2>

### 1. Utilize Ensemble to transform genes into Undirected Graph

*Transform input data (`modi_data.txt` and `Modi_expression_rma.txt`) into MxN data matrix, with genes in rows, expirements in columns.*

Utilize `parse_modi.R in ./src on the above datasets` and export the newly-made dataframe to a .csv file:

```
modi_data <- modi_expr %>% select(4:ncol(modi_expr))

# Write Modi data matrix to csv file
write.csv(modi_data, file = 'data/Modi/modi_data.csv', row.names = FALSE)

# Select Modi genes
modi_genes <- modi_expr %>% select(1)
modi_genes <- t(modi_genes) # transpose it to match the order of modi_data

# Write Modi genes to csv file
write.csv(modi_genes , file = 'data/Modi/modi_genes.csv', row.names = FALSE)

net <- ensemble_model(data = modi_data, gene_names = modi_genes, clean_data = TRUE)

# Save DataFrame of edge list to csv file
write.csv(consensus_net,"modi_edgelist.csv", row.names = FALSE)
```

### 2. Embed Nodes (node2vec), drop edges, and predict them back using a Binary Classifier:

Follow steps in the .ipynb located [here](https://github.com/atlascu/E.Coli_Undirected_Graph_Deep_Learning/blob/master/src/Link_Predicting.ipynb) to do these steps. 

![E.coli Undirected Graph Representation](https://github.com/atlascu/E.Coli_Undirected_Graph_Deep_Learning/blob/master/data/images/E.coli%20undirected%20graph.png)
<h4 align="center"> E.coli Undirected Graph Representation </h4>

![AUC results](https://github.com/atlascu/E.Coli_Undirected_Graph_Deep_Learning/blob/master/data/images/Screenshot_4.png)
<h4 align="center"> AUC (area under curve) results using various binary operators </h4>

<p align="center">
  <img width="460" height="300" src="https://github.com/atlascu/E.Coli_Undirected_Graph_Deep_Learning/blob/master/data/images/Screenshot_4.png">
</p>
