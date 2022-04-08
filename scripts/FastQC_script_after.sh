#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J FastQC_before
#SBATCH --mail-type=ALL
#SBATCH --mail-user inna.fryckstedt@gmail.com

# Load modules
module load bioinfo-tools
module load FastQC

# Your commands
cd $HOME/Genome_analysis_project/intermediate
fastqc -o $HOME/Genome_analysis_project/results/preprocessing/fastqc_trimmed -f fastq -d $HOME/Genome_analysis_project/intermediate \
/home/innaf/Genome_analysis_project/results/preprocessing/trimmomatic_results/output_forward_unpaired.fq.gz \
/home/innaf/Genome_analysis_project/results/preprocessing/trimmomatic_results/output_reverse_unpaired.fq.gz



