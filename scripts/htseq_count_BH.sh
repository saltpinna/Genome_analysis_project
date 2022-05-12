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
module load htseq

htseq-count -f bam -r pos -i ID -t CDS \
/proj/uppmax2022-2-10/nobackup/innaf/Genome_analysis_project/BH_aln/bwa_aligned_ERR1797972.bam /proj/uppmax2022-2-10/nobackup/innaf/Genome_analysis_project/BH_aln/bwa_aligned_ERR1797973.bam /proj/uppmax2022-2-10/nobackup/innaf/Genome_analysis_project/BH_aln/bwa_aligned_ERR1797974.bam \
/home/innaf/Genome_analysis_project/results/annotation/annotation.gff \
> /home/innaf/Genome_analysis_project/results/htseq/BH_htseq_count.txt
