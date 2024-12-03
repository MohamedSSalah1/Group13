#!/bin/bash
#SBATCH --job-name=seq_alignment
#SBATCH --output=star_test_%j.txt
#SBATCH --error=star_test_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=32G
#SBATCH --time=7:00:00
#SBATCH --partition=msc_appbio

fastq_files=(
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553381.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553382.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553383.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553384.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553385.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553386.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553387.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553388.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553389.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553390.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553391.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553392.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553393.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553394.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553395.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553396.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553397.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553398.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553399.fastq.gz"
"/scratch_tmp/grp/msc_appbio/group13_tmp/metadata/ERR4553400.fastq.gz"
)

module load star/2.7.10b-gcc-13.2.0

for fastq in "${fastq_files[@]}"; do
filename=$(basename "$fastq" .fastq.gz)
echo "Processing $fastq"

STAR --genomeDir /scratch_tmp/grp/msc_appbio/group13_tmp/outputs/star_index2 \
 --readFilesIn "$fastq" \
 --readFilesCommand zcat \
 --runThreadN 4 \
 --outFileNamePrefix "/scratch_tmp/grp/msc_appbio/group13_tmp/outputs/${filename}_" \
 --outSAMtype BAM SortedByCoordinate 

echo "Finished processing $fastq"
done 

