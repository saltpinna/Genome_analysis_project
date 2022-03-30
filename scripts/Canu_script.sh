#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J Canu_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user inna.fryckstedt@gmail.com
#SBATCH --reservation=uppmax2022-2-5_2

# Load modules
module load bioinfo-tools
module load canu

# Your commands
cd $HOME/Genome_analysis_project/intermediate
canu -p genome_assembly_canu -d $HOME/results/assembly genomeSize=2.7m -pacbio $HOME/Genome_analysis_project/data/raw_data/genomics_raw_data/PacBio/*



