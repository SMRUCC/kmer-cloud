require(GCModeller);
require(umap);

imports "geneExpression" from "phenotype_kit";

let box_matrix = relative_work("../data/box_matrix.csv");
let cloud_points = relative_work("../data/kmer_cloud.csv");
let data = load.expr(box_matrix);
let cloud = umap(data, dimension = 9, numberOfNeighbors = 64);
cloud = as.data.frame(cloud$umap, labels = cloud$labels);

write.csv(cloud, file = cloud_points);