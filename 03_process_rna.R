library(Seurat)
library(dplyr)

# load SEA-AD data (I should later replace with actual count matrix path)
counts <- Read10X("data/seaad/counts_matrix/")
meta <- read.csv("data/seaad/metadata.csv")

# elaborate seurat obj.
ad <- CreateSeuratObject(counts = counts, meta.data = meta)
ad <- NormalizeData(ad)
ad <- FindVariableFeatures(ad)
ad <- ScaleData(ad)

# cell-type annotation (simplified)
ad <- RunPCA(ad)
ad <- RunUMAP(ad, dims = 1:20)
ad <- FindNeighbors(ad, dims = 1:20)
ad <- FindClusters(ad, resolution = 0.5)

saveRDS(ad, "results/seurat_processed.rds")
