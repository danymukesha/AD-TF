library(ggplot2)

#load TF activity and motif results
de_tfs <- read.csv("results/dysregulated_tfs.csv")
motifs <- read.csv("results/enriched_motifs.csv")

merged <- merge(de_tfs, motifs, by.x = "gene", by.y = "row.names")

ggplot(merged, aes(x = avg_log2FC, y = colSums.motif_matches.)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "TF Activity (log2FC AD/Control)", y = "Motif Enrichment Score") +
  theme_minimal()
ggsave("results/tf_motif_correlation.pdf")
