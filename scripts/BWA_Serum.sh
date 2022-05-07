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

# Perform bwa mem alignment on BH
#cd /home/innaf/Genome_analysis_project/data/raw_data/transcriptomics_raw_data/RNA-Seq_Serum
#for i in trim_paired*
#do
#bwa aln /home/innaf/Genome_analysis_project/results/assembly/genome_assembly_canu.contigs.fasta $i > /proj/uppmax2022-2-10/nobackup/innaf/Genome_analysis_project/Serum_aln/${i}.sai
#done

for i in {69..71}
do 
	bwa sampe /home/innaf/Genome_analysis_project/results/assembly/genome_assembly_canu.contigs.fasta \
	/proj/uppmax2022-2-10/nobackup/innaf/Genome_analysis_project/Serum_aln/trim_paired_ERR17979${i}* \
	/home/innaf/Genome_analysis_project/data/raw_data/transcriptomics_raw_data/RNA-Seq_Serum/trim_paired_ERR17979${i}* \
	| samtools sort -o /proj/uppmax2022-2-10/nobackup/innaf/Genome_analysis_project/Serum_aln/bwa_aligned_ERR17979${i}.bam
done
