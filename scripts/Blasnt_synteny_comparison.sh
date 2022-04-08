#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J blastn_synteny
#SBATCH --mail-type=ALL
#SBATCH --mail-user inna.fryckstedt@gmail.com

# Load modules
module load bioinfo-tools
module load blast

# Run quast on genome assembly
blastn -outfmt 6 -subject /home/innaf/Genome_analysis_project/data/reference_genome/ncbi-genomes-2022-04-08/GCF_009734005.1_ASM973400v2_genomic.fna \
-query /home/innaf/Genome_analysis_project/results/assembly/genome_assembly_canu.contigs.fasta -out /home/innaf/Genome_analysis_project/results/synteny_comparison/synteny_comparison.tab

