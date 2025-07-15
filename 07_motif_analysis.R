library(chromVAR)
library(JASPAR2024)
library(BSgenome.Hsapiens.UCSC.hg38)

#load ATAC data and get differential peaks
atac <- readRDS("results/signac_processed.rds")
da_peaks <- FindMarkers(atac, ident.1 = "AD", test.use = "LR")

#obtain sequences around peaks
peak_sequences <- getSeq(
  BSgenome.Hsapiens.UCSC.hg38,
  StringToGRanges(rownames(da_peaks))
)

#scan for TF motifs
pfm <- getMatrixSet(JASPAR2024, opts = list(species = "Homo sapiens"))
motif_ix <- matchMotifs(pfm, peak_sequences, genome = "hg38")
motif_matches <- motifMatches(motif_ix)

write.csv(colSums(motif_matches), "results/enriched_motifs.csv")
