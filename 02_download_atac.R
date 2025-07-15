library(GEOquery)
library(rtracklayer)

#ATAC-seq peaks (GSE174367)
getGEOSuppFiles("GSE174367", baseDir = "data/atac")
untar("data/atac/GSE174367/GSE174367_RAW.tar", exdir = "data/atac/peaks")

#convert to BED format
peaks <- import("data/atac/peaks/GSM5319409_AD1_peaks.narrowPeak")
export(peaks, "data/atac/merged_peaks.bed", format = "BED")
