#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J BWA_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user inna.fryckstedt@gmail.com

# Load modules
module load bioinfo-tools
module load bwa
module load samtools


# Create bwa index
bwa index /home/innaf/Genome_analysis_project/results/assembly/genome_assembly_canu.contigs.fasta

# Perform bwa alignment on BH

bwa mem /home/innaf/Genome_analysis_project/results/assembly/genome_assembly_canu.contigs.fasta \
/proj/genomeanalysis2022/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797969_pass_1.fastq.gz /proj/genomeanalysis2022/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797969_pass_2.fastq.gz \
| samtools sort -o /proj/uppmax2022-2-10/nobackup/innaf/Genome_analysis_project/Serum_aln/bwa_aligned_ERR1797969.bam 

bwa mem /home/innaf/Genome_analysis_project/results/assembly/genome_assembly_canu.contigs.fasta \
/proj/genomeanalysis2022/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797970_pass_1.fastq.gz /proj/genomeanalysis2022/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797970_pass_2.fastq.gz \
| samtools sort -o /proj/uppmax2022-2-10/nobackup/innaf/Genome_analysis_project/Serum_aln/bwa_aligned_ERR1797970.bam

bwa mem /home/innaf/Genome_analysis_project/results/assembly/genome_assembly_canu.contigs.fasta \
/proj/genomeanalysis2022/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797971_pass_1.fastq.gz /proj/genomeanalysis2022/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797971_pass_2.fastq.gz \
| samtools sort -o /proj/uppmax2022-2-10/nobackup/innaf/Genome_analysis_project/Serum_aln/bwa_aligned_ERR1797971.bam
