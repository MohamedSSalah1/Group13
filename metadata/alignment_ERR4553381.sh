#!/bin/bash
#SBATCH --job-name=seq_alignment
#SBATCH --output=star_test_%j.txt
#SBATCH --error=star_test_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=32G
#SBATCH --time=7:00:00
#SBATCH --partition=msc_appbio

module load star/2.7.10b-gcc-13.2.0

STAR --genomeDir /scratch_tmp/grp/msc_appbio/group13_tmp/outputs/star_index2 \
 --readFilesIn /scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553381.fastq.gz \
 --readFilesCommand zcat \
 --runThreadN 4 \
 --outFileNamePrefix /scratch_tmp/grp/msc_appbio/group13_tmp/outputs/ERR4553381_ \
 --outSAMtype BAM SortedByCoordinate 


