require(GCModeller);
require(umap);

imports "geneExpression" from "phenotype_kit";

let box_matrix = ?"--box-matrix" || stop("box matrix data of the k-mers must be provided!");
let cloud_points = ?"--save" || file.path(dirname(box_matrix), `${basename(box_matrix)}_umap.csv`);
let data = load.expr(box_matrix);
let cloud = umap(data, dimension = 9, numberOfNeighbors = 64);
cloud = as.data.frame(cloud$umap, labels = cloud$labels);

write.csv(cloud, file = cloud_points);