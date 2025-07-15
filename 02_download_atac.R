library(GEOquery)
library(rtracklayer)

#ATAC-seq peaks (GSE174367)
getGEOSuppFiles("GSE174367", baseDir = "data/atac")
untar("data/atac/GSE174367/GSE174367_RAW.tar", exdir = "data/atac/peaks")

#convert to BED format
peaks <- import("data/atac/peaks/GSM5319409_AD1_peaks.narrowPeak")
export(peaks, "data/atac/merged_peaks.bed", format = "BED")


# other datasets individualized:
# - Bulk RNA	GSE1297	Temporal cortex transcriptomes
# - Bulk RNA	GSE5281	Multi-region transcriptomes
# - Bulk RNA	GSE15222	Large-cohort cortex transcriptomes
# - miRNA	GSE150693	AD-associated miRNA profiles
# - Methylation	GSE80970	Genome-wide methylation in AD brains
# - Exercise	GSE120910	Transcriptional response to exercise
