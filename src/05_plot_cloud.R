let cloud_points = ?"--matrix" || stop("umap embedding data matrix must be provided!");
let saveRplot = ?"--save" || file.path(dirname(cloud_points), `${basename(cloud_points)}.png`);
let cloud_data = read.csv(cloud_points, row.names = 1, check.names = FALSE);
let tags = rownames(cloud_data) |> sapply(str -> .Internal::first(strsplit(str, " ",fixed =TRUE)));

cloud_data[,"species"] = tags;

bitmap(file = saveRplot) {
    plot(as.double(cloud_data$dimension_1), as.double(cloud_data$dimension_2), 
        class = cloud_data[,"species"], 
        colors = "paper", 
        fill = "white"
    );
}