#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J Trimmomatic
#SBATCH --mail-type=ALL
#SBATCH --mail-user inna.fryckstedt@gmail.com


# Load modules
module load bioinfo-tools
module load trimmomatic

# Commands
trimmomatic PE \
/home/innaf/Genome_analysis_project/data/raw_data/genomics_raw_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz \
/home/innaf/Genome_analysis_project/data/raw_data/genomics_raw_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz \
/home/innaf/Genome_analysis_project/results/preprocessing/trimmomatic_results/output_forward_paired.fq.gz \
/home/innaf/Genome_analysis_project/results/preprocessing/trimmomatic_results/output_forward_unpaired.fq.gz \
/home/innaf/Genome_analysis_project/results/preprocessing/trimmomatic_results/output_reverse_paired.fq.gz \
/home/innaf/Genome_analysis_project/results/preprocessing/trimmomatic_results/output_reverse_unpaired.fq.gz \
ILLUMINACLIP:/sw/apps/bioinfo/trimmomatic/0.36/rackham/adapters/TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:36 TRAILING:36 MINLEN:36
