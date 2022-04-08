#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J assembly_eval_quast
#SBATCH --mail-type=ALL
#SBATCH --mail-user inna.fryckstedt@gmail.com

# Load modules
module load bioinfo-tools
module load quast

# Run quast on genome assembly
quast.py -o ~/Genome_analysis_project/results/assembly_eval_quast -r /home/innaf/Genome_analysis_project/data/reference_genome/ncbi-genomes-2022-04-08/GCF_009734005.1_ASM973400v2_genomic.fna /home/innaf/Genome_analysis_project/results/assembly/genome_assembly_canu.contigs.fasta

