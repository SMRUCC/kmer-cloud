require(GCModeller);

imports "geneExpression" from "phenotype_kit";

let data_dir = relative_work("../data/kmer_matrix");
let box_matrix = relative_work("../data/box_matrix.csv");
let load_kmers = list.files(data_dir, pattern = "*.csv");

print(basename(load_kmers));

load_kmers = as.list(load_kmers, names = basename(load_kmers)) 
|> tqdm 
|> sapply(file -> load.expr(file))
|> geneExpression::joinFeatures()
;

write.expr_matrix(load_kmers, 
    file = box_matrix, 
    id = "gene_context"
);