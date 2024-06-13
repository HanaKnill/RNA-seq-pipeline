#!/bin/bash

SECONDS=0

# change working directory
cd "/Users/hanaknill/Documents/RNA Seq Project"

# STEP 1: Run fastqc to check for quality 
Tools/FastQC/fastqc data/* -o "fastqc results"


# run trimmomatic to trim reads with poor quality
java -jar Tools/Trimmomatic-0.39/trimmomatic-0.39.jar SE -threads 4 data/* data/*_trimmed.fastq TRAILING:10 -phred33
# Paired End reads
java -jar Tools/Trimmomatic-0.39/trimmomatic-0.39.jar PE -threads 4 data/* data/*_trimmed.fastq TRAILING:10 -phred33
java -jar <path to trimmomatic.jar> PE [-threads <threads] [-phred33 | -phred64] [-trimlog <logFile>] >] [-basein <inputBase> | SRR11180057_1.fastq SRR11180057_2.fastq] [-baseout <outputBase> | <unpaired output 1> <paired output 2> <unpaired output 2> <step 1> 


#echo "Trimmomatic finished running!"

#fastqc data/demo_trimmed.fastq -o data/


# STEP 2: Run HISAT2
# mkdir HISAT2
# get the genome indices
# wget https://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz


# run alignment using hisat2 
#hisat2 -q --rna-strandness R -x HISAT2/grch38/genome -U data/demo_trimmed.fastq | samtools sort -o HISAT2/demo_trimmed.bam
#echo "HISAT2 finished running!"

# STEP 3: Run featureCounts - Quantification



# get gtf
# wget http://ftp.ensembl.org/pub/release-106/gtf/homo_sapiens/Homo_sapiens.GRCh38.106.gtf.gz
#featureCounts -S 2 -a ../hg38/Homo_sapiens.GRCh38.106.gtf -o quants/demo_featurecounts.txt HISAT2/demo_trimmed.bam
#echo "featureCounts finished running!"


duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."