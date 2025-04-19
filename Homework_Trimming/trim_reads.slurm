#!/bin/bash
#SBATCH --job-name=trimming
#SBATCH --output=trimming_%j.out
#SBATCH --error=trimming_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=02:00:00
#SBATCH --mem=8G

conda activate multiqc

READ1=/projects/mipt_dbmp_biotechnology/genome/illumina_reads_R1_001.fastq
READ2=/projects/mipt_dbmp_biotechnology/genome/illumina_reads_R2_001.fastq
ADAPTERS=/projects/mipt_dbmp_biotechnology/genome/adapters.fa

OUT_R1=trimmed_R1.fastq
OUT_R2=trimmed_R2.fastq

cutadapt \
    -a file:$ADAPTERS \
    -A file:$ADAPTERS \
    -a "A{10}" \
    -A "A{10}" \
    -q 20,20 \
    --minimum-length 50 \
    --trim-n \
    -o $OUT_R1 \
    -p $OUT_R2 \
    $READ1 $READ2
