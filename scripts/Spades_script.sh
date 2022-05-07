#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 10:00:00
#SBATCH -J Spades_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user inna.fryckstedt@gmail.com

#load modules
module load bioinfo-tools
module load spades

#commands
spades.py -k 55 -1 /home/innaf/Genome_analysis_project/results/preprocessing/trimmomatic_results/output_forward_paired_2.fq.gz \
-2 /home/innaf/Genome_analysis_project/results/preprocessing/trimmomatic_results/output_reverse_paired_2.fq.gz \
--nanopore /home/innaf/Genome_analysis_project/data/raw_data/genomics_raw_data/Nanopore/E745_all.fasta.gz \
-o /proj/uppmax2022-2-10/nobackup/innaf/Genome_analysis_project

