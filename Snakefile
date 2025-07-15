rule all:
  input:
    "results/tf_motif_correlation.pdf"

rule download_seaad:
  output:
    "data/seaad/metadata.csv"
  script:
    "01_download_seaad.py"

rule process_rna:
  input:
    "data/seaad/metadata.csv"
  output:
    "results/seurat_processed.rds"
  script:
    "04_process_rna.R"


## snakemake --cores 4 --use-conda
