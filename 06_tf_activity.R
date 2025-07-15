library(Seurat)
library(DoRothEA)

#load processed snRNA-seq data
ad <- readRDS("results/seurat_processed.rds")

#obtain human TF regulons (high confidence)
data("dorothea_hs", package = "DoRothEA")
regulons <- dorothea_hs %>% filter(confidence %in% c("A", "B"))

#add TF activity scores
ad <- AddRegulonActivity(ad, regulons)

#fetch for AD-specific TF activity changes
Idents(ad) <- "disease"
de_tfs <- FindMarkers(ad, ident.1 = "AD", assay = "dorothea")
write.csv(de_tfs, "results/dysregulated_tfs.csv")


