#!/bin/bash
#SBATCH --partition=msc_appbio
#SBATCH --job-name=starIndex
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --time=3:00:00
#SBATCH --output=/scratch_tmp/grp/msc_appbio/group13_tmp/logs/starIndex-%j.out

#unzip annotation file
#gunzip /scratch_tmp/grp/msc_appbio/group13_tmp/metadata/Saccharomyces_cerevisiae_cen_pk113_7d_gca_000269885.ASM26988v1>
module load star
STAR --runMode genomeGenerate \
 --genomeDir /scratch_tmp/grp/msc_appbio/group13_tmp/outputs/star_index2 \
 --genomeFastaFiles /scratch_tmp/grp/msc_appbio/group13_tmp/metadata/AEHG01.fasta \
 --genomeSAindexNbases 10 \
 --runThreadN 2

# --sjdbGTFfile /scratch_tmp/grp/msc_appbio/group13_tmp/metadata/Saccharomyces_cerevisiae_cen_pk113_7d_gca_0002698>
# --genomeFastaFiles /scratch_tmp/grp/msc_appbio/group13_tmp/outputs \
