# R script for running Deseq
library(DESeq2)

# Creating Deseq data set
datadir <- "/home/innaf/Genome_analysis_project/results/htseq/"
sample <- c('BH1_htseq', 'BH2_htseq', 'BH3_htseq', 'Se1_htseq', 'Se2_htseq', 'Se3_htseq')
fileName <- c('BH1_htseq.txt', 'BH2_htseq.txt', 'BH3_htseq.txt', 'Se1_htseq.txt', 'Se2_htseq.txt', 'Se3_htseq.txt')
type <- c('BH', 'BH', 'BH', 'Se', 'Se', 'Se')
phdata <- data.frame(sample, fileName, type)
#phdata <- data.frame(fname=list.files(path=datadir, pattern= "*htseq.txt"),stringsAsFactors=FALSE)
#phdata <- phdata %>% transmute(sample=substr(fname,1,3),fname)
#phdata <- phdata %>% mutate(trt=as.factor(substr(sample,1,2)), repl=substr(sample,3,3))
dds <- DESeqDataSetFromHTSeqCount(sampleTable=phdata,directory=datadir,design=~ type)

#dds <- estimateSizeFactors(dds)
#dds<-estimateDispersions(dds)

# Doing the expression analysis
ddsDE<-DESeq(dds)
myres<-results(ddsDE)
write.csv(as.data.frame(myres), file="/home/innaf/Genome_analysis_project/results/Deseq/Deseq_analysis_table.csv")

# Ploting and saving to file
png(file="/home/innaf/Genome_analysis_project/results/Deseq/Deseq_plot.png")
plot(myres$log2FoldChange,-log10(myres$pvalue),pch=19,cex=0.3,xlab="Log2 FC",ylab="-log10(P-value)",col=ifelse(myres$pvalue<0.05&abs(myres$log2FoldChange)>1,"red","black"))
dev.off()

# Saving filtered and ordered subset of the expression analysis
res_p0.05_FC1<-subset(myres,pvalue<0.05&abs(log2FoldChange)>1)
res_p0.05_FC1_ordered <- res_p0.05_FC1[order(res_p0.05_FC1$log2FoldChange),]
write.csv(as.data.frame(res_p0.05_FC1_ordered), file="/home/innaf/Genome_analysis_project/results/Deseq/res_p0.05_FC1_ordered.csv")
