#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J funcitonal_annotation
#SBATCH --mail-type=ALL
#SBATCH --mail-user inna.fryckstedt@gmail.com

# Load modules
module load bioinfo-tools
module load prokka

# Run quast on genome assembly
prokka --outdir /home/innaf/Genome_analysis_project/results/annotation --prefix annotation /home/innaf/Genome_analysis_project/results/assembly/genome_assembly_canu.contigs.fasta
