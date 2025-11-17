let cloud_points = relative_work("../data/kmer_cloud.csv");
let cloud_data = read.csv(cloud_points, row.names = 1, check.names = FALSE);
let tags = rownames(cloud_data) |> sapply(str -> .Internal::first(strsplit(str, "|",fixed =TRUE)));

cloud_data[,"species"] = tags;

bitmap(file = relative_work("../Rplot/kmers-cloud.png")) {
    plot(as.double(cloud_data$dimension_1), as.double(cloud_data$dimension_2), 
        class = cloud_data[,"species"], 
        colors = "paper", 
        fill = "white"
    );
}