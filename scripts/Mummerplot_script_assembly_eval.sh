#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J Mummer
#SBATCH --mail-type=ALL
#SBATCH --mail-user inna.fryckstedt@gmail.com

# Load modules
module load bioinfo-tools
module load MUMmer

# Run mummer

mummer -mum -b -c /home/innaf/Genome_analysis_project/data/reference_genome/ncbi-genomes-2022-04-08/GCF_009734005.1_ASM973400v2_genomic.fna \
/home/innaf/Genome_analysis_project/results/assembly/genome_assembly_canu.contigs.fasta > /home/innaf/Genome_analysis_project/results/assembly_eval_mummerplot/ref_genome_assembly_subplots.mums

mummerplot --png -p ref_genome_assembly_subplots -R /home/innaf/Genome_analysis_project/data/reference_genome/ncbi-genomes-2022-04-08/GCF_009734005.1_ASM973400v2_genomic.fna \
-Q /home/innaf/Genome_analysis_project/results/assembly/genome_assembly_canu.contigs.fasta /home/innaf/Genome_analysis_project/results/assembly_eval_mummerplot/ref_genome_assembly_subplots.mums 
