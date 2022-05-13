#Loading data
bh_data <- read.table("/home/innaf/Genome_analysis_project/results/htseq/BH_htseq_count.txt")
se_data <- read.table("/home/innaf/Genome_analysis_project/results/htseq/Serum_htseq_count.txt")

#Splitting data into replicates and plot
geneID <- c(1:3126)
bh1 <- bh_data[c(1:3126),c(2)]
bh2 <- bh_data[c(1:3126),c(3)]
bh3 <- bh_data[c(1:3126),c(4)]
s1 <- se_data[c(1:3126),c(2)]
s2 <- se_data[c(1:3126),c(3)]
s3 <- se_data[c(1:3126),c(4)]
png("htseq_distribution.png")
plot(geneID, bh1, xlab="GeneID", ylab="Counts",
     main="Distribution of counts for BH (green) and Serum (red)", col="green")
points(geneID, bh2, col="green")
points(geneID, bh3, col="green")
points(geneID, s1, col="red")
points(geneID, s2, col="red")
points(geneID, s3, col="red")
dev.off()
