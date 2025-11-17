require(GCModeller);

imports "kmers" from "seqtoolkit";
imports "FastQ" from "rnaseq";
imports "geneExpression" from "phenotype_kit";
imports "bioseq.fasta" from "seqtoolkit";

let tss_upstream = relative_work("../data/tss_upstream");
let export_dir = relative_work("../data/kmer_matrix");

for(let box_file in tqdm(list.files(tss_upstream, pattern = "*.fasta"))) {
    let box_data = read.fasta(box_file);
    let data = kmers_matrix(box_data, k = 5);

    write.expr_matrix(data, 
        file = file.path(export_dir, `${basename(box_file)}.csv`), 
        id = "gene_context"
    );
}
