#!/bin/bash
#SBATCH --job-name=fastqc_multiqc
#SBATCH --output=fastqc_multiqc.out
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G

mkdir -p fastqc_reports
mkdir -p multiqc_report

fastqc *.fastq.gz -o fastqc_reports -t 4

multiqc fastqc_reports -o multiqc_report
