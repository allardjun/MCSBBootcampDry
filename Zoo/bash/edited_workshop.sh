#!/bin/bash
#$ -N ATACseq_Alignment
#$ -q bio, free64
#$ -pe make 2
#$ -R y
#$ -ckpt blcr
#$ -t 1-n

#-N is the name of your job
#-q will list the queues you want to submit to
#-pe make 2 gives the number of cores you wish to request per job (in this case, 2 per job)
#-R y reserves cores as they become available
#-ckpt blcr turns on checkpointing, so if the job is suspended, it will be resubmitted and restart from that point
#the -t 1-n generates a task-array and should have n replaced with the number of lines in your file list

#load modules need for the script
module load bowtie2/2.2.3
module load samtools/1.3

#path variables for ease of use in body of script
reference_genome="/path/to/reference/genome"
path="/path/to/raw/data/directory/"
#create output directory before trying to put files into it
path_2="/path/to/output/dirctory/"

#Important to note that this file should have the name of each desired file that you want to operate this script on, each with their own line in the file. I use ls *.fastq.gz > read1_file_list.txt to generate this file when you are in the raw data directory
file="/path/to/location/of/file/list"

#Uses task ID to index your file list and generates a specific name. Modulate the cut command to however much of the file name you want to include
#head -n $SGE_TASK_ID $file takes the first task-id lines (so, if you're on task 5, it takes the first 5 lines)
#tail -n 1 takes the last line from the head command (so, if you're on task 5, it takes the fifth line only from the first 5 lines)
#cut -d '_' -f 1-5 seperates the 5th line by '_' and keeps the first 5 values (e.g. file_L2_B1_B2_P_test.txt, this will take file_L2_B1_B2_P but not _test since it is the 6th element) 
prefix=`head -n $SGE_TASK_ID $file | tail -n 1 | cut -d '_' -f 1-5` 

#Command to run in script. In this case, mapping a file to a reference genome then passing that mapped file to samtools to further procees the file with a pipe (|) 
bowtie2 -k 4 -X2000 --threads 2 -x $reference_genome -1 $path${prefix}_READ1_Sequences.fastq.gz -2 $path${prefix}_READ2_Sequences.fastq.gz | samtools view -bS - > $path_2${prefix}.bam
