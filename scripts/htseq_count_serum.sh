#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J htseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user inna.fryckstedt@gmail.com

# Load modules
module load bioinfo-tools
module load bwa
module load htseq

#bwa index /home/innaf/Genome_analysis_project/results/assembly/genome_assembly_canu.contigs.fasta 

htseq-count -f bam -r pos -i ID -t CDS -s no \
/proj/uppmax2022-2-10/nobackup/innaf/Genome_analysis_project/Serum_aln/bwa_aligned_ERR1797969.bam /proj/uppmax2022-2-10/nobackup/innaf/Genome_analysis_project/Serum_aln/bwa_aligned_ERR1797970.bam /proj/uppmax2022-2-10/nobackup/innaf/Genome_analysis_project/Serum_aln/bwa_aligned_ERR1797971.bam \
/home/innaf/Genome_analysis_project/results/annotation/annotation.gff \
> /home/innaf/Genome_analysis_project/results/htseq/Serum_htseq_count.txt
