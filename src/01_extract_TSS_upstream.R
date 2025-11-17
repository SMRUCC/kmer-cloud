require(GCModeller);

imports "GenBank" from "seqtoolkit";
imports "genomics_context" from "seqtoolkit";
imports "annotation.genomics" from "seqtoolkit";
imports "bioseq.fasta" from "seqtoolkit";

let genbank_repo = "D:\\datapool\\regprecise_genbank\\genomes";
let export_dir = relative_work("../data/tss_upstream");
let extract_TSS_upstream = function(gbfile, len) {
    let gb = read.genbank(gbfile);
    let genes = gb |> genes_features();
    let reg_box = gb |> TSS_upstream(genes, upstream_len = len);
    let export_save = file.path(export_dir, `${basename(gbfile)}.fasta`);

    write.fasta(reg_box, file = export_save);
}

for(let gb_asm in tqdm(list.files(genbank_repo, pattern = "*.gbff"))) {
    try({
        gb_asm |> extract_TSS_upstream(len = 150);
    });
}