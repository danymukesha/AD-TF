library(Signac)
library(EnsDb.Hsapiens.v86)

# chromatin assay
fragments <- CreateFragmentObject("data/atac/fragments.tsv.gz")
peaks <- read.table("data/atac/merged_peaks.bed")
chrom_assay <- CreateChromatinAssay(
  counts = peaks,
  fragments = fragments,
  genome = "hg38"
)

# elaborate Signac object
atac <- CreateSeuratObject(counts = chrom_assay, assay = "ATAC")
atac <- RunTFIDF(atac)
atac <- FindTopFeatures(atac, min.cutoff = 5)
atac <- RunSVD(atac)

saveRDS(atac, "results/signac_processed.rds")
