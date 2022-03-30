#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J Trimmomatic
#SBATCH --mail-type=ALL
#SBATCH --mail-user inna.fryckstedt@gmail.com
#SBATCH --reservation=uppmax2022-2-5_2

# Load modules
module load bioinfo-tools
module load trimmomatic

# Your commands
cd $HOME/Genome_analysis_project/intermediate
trimmomatic PE $HOME/Genome_analysis_project/data/raw_data/genomics_raw_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz \
$HOME/Genome_analysis_project/data/raw_data/genomics_raw_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz \
$HOME/Genomics_analysis_project/results/preprocessing/trimmomatic_results/trimmomatic_output_unpaired_1 $HOME/Genomics_analysis_project/results/preprocessing/trimmomatic_results/trimmomatic_output_paired_1 \
$HOME/Genomics_analysis_project/results/preprocessing/trimmomatic_results/trimmomatic_output_unpaired_2 $HOME/Genomics_analysis_project/results/preprocessing/trimmomatic_results/trimmomatic_output_paired_2 \
ILLUMINACLIP:TruSeq3-PE.fa TRAILING:20
