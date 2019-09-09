SNP Activity Answer Key
=============

### Exercise: Use sed to remove "chr" from column 2 without making a new file

```
sed -i 's/chr//'
```
* We use sed in-place to take all instances of "chr" and change them to "" (which effectively removes the word). 

### Exercise: Extract phsophorylatable residues into seperate files

```
awk '$3 ~ /S/ { print }' sorted_reformatted_chr1_snp146.txt > S_peptides.txt
awk '$3 ~ /T/ { print }' sorted_reformatted_chr1_snp146.txt > T_peptides.txt
awk '$3 ~ /Y/ { print }' sorted_reformatted_chr1_snp146.txt > Y_peptides.txt
```
* We use awk to check the 3rd column for any lines that include "S" or "T" or "Y" 

### Exercise: Rename .snp files by removing "_peptides" 

```
for f in *_peptides.snp; do mv "${f}" "${f%_peptides.snp}.snp"; done
```
* We use move to remove "_peptides.snp" from each file name and replace it with ".snp" thereby removing "_peptides". 

### Final Exercise: Generate the following file using the commands you've learned above

```
awk '$2 == "chrX" && $10 ~ /G/ { print }' snp146CodingDbSnp.txt | awk '{ print $6"\t"$2"\t"$3"\t"$8"\t"$10 }' | sed 's/,$//' | awk '{ print $1"\t"$2"\t"$3"\t"$5"\t"$4 }' | sed 's/,/:/g' | sort -V -k 3,3 > G_alleles.txt
```
[Return to SNP_Activity](https://github.com/KerriganBlake/General_HPC_Use_Tutorial/blob/master/SNP_Activity.md)
[Return to README](https://github.com/KerriganBlake/General_HPC_Use_Tutorial/blob/master/README.md)
