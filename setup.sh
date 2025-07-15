conda create -n ad_tf python=3.8 r=4.1 -y
conda activate ad_tf

pip install snakemake pybedtools requests

Rscript -e "
install.packages(c('Seurat', 'Signac', 'tidyverse', 'BiocManager'))
BiocManager::install(c('JASPAR2024', 'chromVAR', 'BSgenome.Hsapiens.UCSC.hg38', 'DoRothEA', 'GEOquery'))
"
