# Read Modi expression from csv file
modi_expr <- read.csv(file = 'data/Modi/Modi_expression_rma.txt', sep='\t')

# Select Modi data matrix
modi_data <- modi_expr %>% select(4:ncol(modi_expr))

# Write Modi data matrix to csv file
write.csv(modi_data, file = 'data/Modi/modi_data.csv', row.names = FALSE)

# Select Modi genes
modi_genes <- modi_expr %>% select(1)
modi_genes <- t(modi_genes) # transpose it to match the order of modi_data

# Write Modi genes to csv file
write.csv(modi_genes , file = 'data/Modi/modi_genes.csv', row.names = FALSE)

# net <- ensemble_model(data = modi_data, gene_names = modi_genes, clean_data = TRUE)
net <- ensemble_model(data = modi_data, gene_names = modi_genes, clean_data = TRUE)

# Save DataFrame of edge list to csv file
write.csv(consensus_net,"modi_edgelist.csv", row.names = FALSE)
