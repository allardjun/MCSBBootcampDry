Data Parsing: SNP Activity
==============

You are a researcher interested in studying SNPs in the coding region of each human chromosome. You know that you want to use hg19 and snp146, and you are able to find the location full dataset (including all human chromosomes) through the downloads page of the UCSC database. Since you will want to perform a lot of editing on this file, you decide to download it directly onto your university's HPC which has all the software you need. 

First, you need to login. 

If you have a Mac, you can do this directly from the Terminal by opening a new session and typing:

```
ssh {your UCNetID}@hpc.oit.uci.edu
```

If you have a Windows machine, you will need to use an ssh client (for example, Putty).

In both cases, you will be prompted for your password before entering the HPC. 

After you have entered the HPC, you should reqest an interactive node by entering the following. *You should NEVER run code from the login node on the HPC as it slows it down for other users.*

```
qrsh
```

Next, we should move into our public folder. To do this, you will run the following command:
```
cd /pub/{your UCNetID}/
```

To make a new folder and enter it, you should run the following 2 commands:
```
mkdir SNP_Activity
cd SNP_Activity
```

 <a name="download"></a>
Downloading and Unzipping Files
------

At this point, we can download our dataset using wget:

```
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg38/database/snp146CodingDbSnp.txt.gz
```

Next, you unzip the file:

```
gunzip snp146CodingDbSnp.txt.gz
```

Now, you need to understand the structure of the file since you've never seen this dataset before. To do so, you look at the first 10 lines using head:

```
head snp146CodingDbSnp.txt
```

You should see the following (without header labels):

| bin | chrom | chromStart | chromEnd | name | transcript | frame | alleleCount | funcCodes | alleles | codons | peptides
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 585	| chr1 | 14397  | 14400	| rs756427959	| NR_024540	| n/a	| 1	| 45,	| -,	| n/a,	| n/a, |
| 585	| chr1 | 14397	| 14400	| rs756427959	| NR_046018 | 	n/a	| 1	| 45,	| -,	| n/a,	| n/a, |
| 585	| chr1 | 17358	| 17361	| rs749387668	| NR_024540	| n/a	| 1	| 45,	| -,	| n/a,	| n/a, |
| 585	| chr1 | 51972	| 51975	| rs546829777	| XR_948874	| n/a	| 1	| 45,	| -,	| n/a,	| n/a, |
| 585	| chr1 | 69115	| 69116	| rs757299236	| NM_001005484	| 2	| 2	| 8,42,	| G,A,	| GGT,GAT, | 	G,D, |
| 585	| chr1 | 69133	| 69134	| rs781394307	| NM_001005484	| 2	| 2	| 8,42,	| A,G,	| GAA,GGA, | 	E,G, |

You can also look at the size of the file using ls -lh and look at the number of lines in the file using wc -l as follows:

```
ls -lh snp146CodingDbSnp.txt
```

Example output:
**-rw-r--r-- 1 kerrigab bio 2.7G Apr 17  2016 snp146CodingDbSnp.txt**


```
wc -l snp146CodingDbSnp.txt 
```

Example output:
**34754673 snp146CodingDbSnp.txt**


 <a name="restructure"></a>
Restructure Data
------

You want to extract all of the data for chromosome 1 into a seperate file. You decide to use awk and check the 2nd column for chr1:

```
awk '$2 == "chr1" { print }' no_na_snp146CodingDbSnp.txt > chr1_no_na_snp146CodingDbSnp.txt
```
* In this command, we check the 2nd column ($2) for values exactly equal to chr1 ($2 == "chr1") and print them to a new file ('... { print }' ${file} > ${new_file}) using awk.


Next, you want to remove all lines containing n/a in the codons column since you are only interested in amino acid changes. To do this, you run the following command that checks the 11th column (codons) and removes lines containing "n/a" and puts it into a new file:

```
awk '$11 !~ /n\/a/ { print }' snp146CodingDbSnp.txt > no_na_snp146CodingDbSnp.txt 
```
* In this command, we check the 11th column ($11) for values that do NOT include (!~) n/a (which requires the use of ```\/``` to represent /) and print them to a new file ('... { print }' ${file} > ${new_file}) using awk.

At this point, you realize that you could have removed the n/a values and seperated the data into chromosomes with a single command using and (&&) with awk. Here is an example of that command:

```
awk '$2 == "chr1" && $11 !~ /n\/a/ { print }' snp146CodingDbSnp.txt > alt_chr1_no_na_snp146CodingDbSnp.txt
```

You eventually want to process your data with a program that requires the following tab-seperated format, with the data ordered by name in a logical numerical order (i.e. rs1, rs2,....rs10, rs11):

| name | chrom#:chromStart-chromEnd | peptides
| :---: | :---: | :---: | 
| rs756427959	| 1:14397-14400 | A,V
| rs757299236	| 1:69115-69116| A, *

You decide to test this software with chromsome 1, and start by extracting the relevant columns into yet another file before sorting. To do this, you take advantage of awk's print functionalities to move and reformat your columns as follows:

```
 awk '{print $5"\t"$2":"$3"-"$4"\t"$12 }' chr1_no_na_snp146CodingDbSnp.txt > unsorted_reformatted_chr1_snp146.txt
```
* In this command, we print the 5th column of chr1_no_na_snp146CodingDbSnp.txt followed by a tab seperator ("\t") then the 2nd column followed by ":" and so forth and put it into unsorted_reformatted_chr1_snp146.txt

Finally, before reordering the data, you want to remove the trailing "," from the 3rd column of unsorted_reformatted_chr1_snp146.txt file. To do this, it is easiest to use sed as follows:

```
sed -i 's/,$//' unsorted_reformatted_chr1_snp146.txt
```
* In this command, we use sed to replace all "," characters at the end of a line (,$) with nothing. The -i flag means "in-place" so it makes the changes in the original file and does not require a new intermediate file (to avoid these intermediate files in general, you can use pipes, which we'll cover at the end of this activity). 

### Exercise: Use sed to remove "chr" from column 2 without making a new file

 <a name="reorder"></a>
Reorder Data
------

Now, you need to sort the file by name. To do this, you decide to use sort with -V to ensure the correct ordering (this will prevent order like rs1, rs10, rs11, .. rs2,rs20,...):

```
sort -V -k 1,1 unsorted_reformatted_chr1_snp146.txt > sorted_reformatted_chr1_snp146.txt
```
* This command sorts the first column (-k 1,1) in order in the "natural sort of (version) numbers within text" with (-V). 


### Exercise: Extract phsophorylatable residues into seperate files

You decide to investigate phosphorylatable residues (namely, S,T, and Y). To do so, you seperate out your sorted file into three seperate files containing peptides S, T and Y using awk. You will name each file S_peptides.txt, T_peptides.txt, and Y_peptides.txt respectively.

 <a name="rename"></a>
Renaming Files (Batch)
------
After generating the S, T, and Y files, you realize that the software requires files to have a ".snp" extension rather than ".txt". You decide to rename your files rather than recreating them using bash.

```
for f in *_peptides.txt; do mv "${f}" "${f%.txt}.snp"; done
```
* This command looks for all files with names matching {anything}_peptide.txt and "moves" them into a file with a name replacing ".txt" with ".snp".

### Exercise: Rename .snp files by removing "_peptides" 
For example, S_peptides.snp will become S.snp.

 <a name="pipe"></a>
Using Pipes
------
If our interest was only to take our full file and extract out S.snp, T.snp, and Y.snp, we can avoid generating intermediate files by using pipes. The idea is that instead of keeping the intermediate file, we simply pass the would-be result to the next command. For example, to go from our downloaded snp146 file to S.snp, we could have run the following, which will output only S.snp:

```
awk '$2 == "chr1" && $11 !~ /n\/a/ { print }' snp146CodingDbSnp.txt |  awk '{print $5"\t"$2":"$3"-"$4"\t"$12 }' | sed 's/,$//' | sed 's/chr//' | sort -V -k 1,1 | awk '$3 ~ /S/ { print }' > alt_S.snp
```

### Final Exercise: Generate the following file using the commands you've learned above

You are now interested in SNPs that include G alleles on the X chromosome. Further, you wish to put these SNPs into a software that requires the following tab-seperated format ordered by chromStart:

| transcript | chr | chromStart | alleles | alleleCount |
| :---: | :---: | :---: | :---: | :---: | 
| NM_001005484| chr1 | 69115	| G:A | 2	| 
| NM_001005484	| chr1 | 69133	| A:G	| 2	|

You final result should have the following first 5 lines (excluding column headers):

| transcript | chr | chromStart | alleles | alleleCount |
| :---: | :---: | :---: | :---: | :---: | 
| NM_018390	| chrX	| 284194	| G:C	| 2 |
| XM_006724444	| chrX	| 284194	| G:C	| 2 |
| XM_006724445	| chrX	| 284194	| G:C	| 2 |
| XM_006724446	| chrX	| 284194	| G:C	| 2 |
| XM_011546180	| chrX	| 284194	| G:C	| 2 |

At last, you to load up the relevant software on the HPC and do a few test runs!

[Return to README](https://github.com/KerriganBlake/General_HPC_Use_Tutorial/blob/master/README.md)
