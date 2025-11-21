require(GCModeller);

imports "geneExpression" from "phenotype_kit";

let data_dir = relative_work("../../data/kmer_matrix");
let box_matrix = relative_work("./two-component-system.csv");
let load_kmers = list.files(data_dir, pattern = "*.csv");

print(basename(load_kmers));

load_kmers = as.list(load_kmers, names = basename(load_kmers)) 
|> tqdm 
|> sapply(file -> load.expr(file) |> geneExpression::filter(instr="two-component system"))
|> geneExpression::joinFeatures(strict=FALSE)
;

write.expr_matrix(load_kmers, 
    file = box_matrix, 
    id = "gene_context"
);