Homework #3
============

Installing new software!!!
===========================
One of the biggest barriers for new genomics researchers is the confusion and complexity associated with installing new pieces of software to run on UNIX platforms.  The basic workflow is as follows:

    # Download the code for the software with curl or wget, or git.
    # Compile the code into an executable (a.k.a. binary) program
    # Copy the executable (e.g., seqtk, samtools, bedtools, etc.) into a directory that is in your PATH
    
To get your feet wet, we will install both [seqtk](https://github.com/lh3/seqtk) for use in this homework. First, let's create a new directory in your home directory called "src". This is where we will download and compile all of the software we download. Like "bin" for your binaries, "src" is a traditional name for the directory we create for storing custom software installations.

    cd ~
    mkdir src
    cd src
    
###Installing seqtk

Download the source code from github (this is where most software is hosted now) using the `git` command.

    git clone https://github.com/lh3/seqtk

This creates a new directory called "seqtk". Navigate into it.
        
    cd seqtk
    
Now we _compile_ the source code for the seqtk binary with the `make` command, which runs a series of instructions for building the program that are outlined in the file called "Makefile" in the seqtk directory. You may see some warnings. You can ignore them.
    
    make
        
This should have created a new binary called "seqtk". Let's check.
    
    ls
       
Now copy this binary to the bin directory in your home directory.  To copy files in UNIX we use `cp`, where the convention is cp FROM TO:
    
    cp seqtk ~/bin/
       
You should now be able to run `seqtk` from any directory since the "~/bin" directory is in your PATH.
    
    seqtk


Homework setup
===========================
Create a new directory in your home directory with the prosaic name "hw4". Move into that directory. Now we will download real FASTQ files resulting from an Illumina paired-end sequencing run of human genomic DNA. Since this is from a paired-end sequencing run, there are two files --- one for each end of each DNA fragment. As such, the two files are named 1805.1.fq and 1805.2.fq. 

    curl https://home.chpc.utah.edu/~u1007787/1805.1.fq > 1805.1.fq
    curl https://home.chpc.utah.edu/~u1007787/1805.2.fq > 1805.2.fq

Conveniently, the sequence for each end of each fragment is consistently ordered in each file. For example, let's look at the first 12 lines (3 sequences as each sequence record occupies 4 lines) of each file:

```head -n 12 1805.1.fq
@C19G9ACXX:3:1101:1147:71334/1
TGGCTCGAAGCGGGCACTGGCGATCTTGGCCACGGACAGCTGCTCATGGT
+
=BCDGE;DFBG=FEGDEFDEE>EDFGFBFFDAA;EEB;<A?AABCCB??@
@C19G9ACXX:3:1101:1232:59804/1
TTTTAATTTTTCAATGATTTCATCAATAATATTAGCAATAGCTATTTTCA
+
ABCCDFEEEEEFEFEGEEFFGEEGECDCEECDFBFGEEDDGGGDEFFEEC
@C19G9ACXX:3:1101:1236:78358/1
CTTCCTCTTCTTCACCTCCCTGCTGCAGCACTTCAGCTTCTCCGTGGCCG
+
ADCCFGEGEGGDGDFFFGFFGEFGGG=EFEEFFFCBFGFGGGE?B@BED=
```

```head -n 12 1805.2.fq
@C19G9ACXX:3:1101:1147:71334/2
GTCAGCACAACCTGGACATCGAGTGTCCCATGTACACCAACCTCAGTCGT
+
>CBB@EEDDFCFGDBEDDDG>CGAEBFEEEDF<DEEEEEGFFGGCFBE=?
@C19G9ACXX:3:1101:1232:59804/2
ATTACAGAAAATGATATACAAATTGCATTAGATGATGCCAAAATCAACTT
+
@BCBCDDEFFDDEDDDDCEEFFEFGGEEFCGEDFEDGGFEFFGEGEFEFD
@C19G9ACXX:3:1101:1236:78358/2
GATCCCAACGAGGGCGTGAGCAGGGGACCCGAGTTGGAACTACCACATTG
+
@CBCEEDFE:CEFFB>B7CDFCGBFFEFFF>ED@DCGEEEFDEDDDCBA<
```

Notice that aside from the /1 and /2 the sequence IDs for each record are identical in each file, indicating that they came from the two 5' ends of the same clonally amplified clusters on the Illumina flowcell.  This makes life easier for us --- remember, sorting is good!


Now, let's get to the fun part. Please note that many of these questions will need to be answered with a mixture of standard UNIX commands you have learned thus far, but also with the [seqtk](https://github.com/lh3/seqtk) toolkit that we just installed. Please consult their documentation websites and help menus (e.g., just type `seqtk` then Enter) for ideas of how to answer the questions. Note that seqtk has many subcommands (e.g., `seqtk comp`) and one can get further information about what the subcommands do and what their output means by typing the subcommand followed by -h (e.g., `seqtk comp -h`).


Question #1
===========
First, a quick question about DNA sequencing technologies. If you wanted to find all single-nucleotide polymorphism in a baby's genome with the fewest errors, what modern DNA sequencing technology would you choose?  Why?

Question #2
============
Is the length of every sequence in the FASTQ files the same? Show your work.

Question #3
===========
How many nucleotides were sequenced in total for this experiment? Show your work.

Question #4
===========
What is the overall GC content of the FASTQ files? Show your work.

Question #5
===========
How does the average Phred quality score for the first read (sequence) position compare to the average Phred quality score for the last position? Why is this? Show your work.

Question #6
============
Offline, I aligned these fastq files to build 37 human genome using bwa mem. The result is a SAM that you can download with the following command.

    curl https://home.chpc.utah.edu/~u1007787/1805.sam > 1805.sam

Convert the SAM file to a BAM file named `1805.bam` with `samtools`. 
Then use samtools to sort the BAM file by chromosome and name the sorted file `1805.sorted.bam`. 
Then index the sorted BAM file with samtools.
Show your work.

Question #7
============
What is the most common mapping quality (MAPQ) for the alignments in the BAM file?  How many alignments have that mapping quality?  What does that mapping quality reflect in terms of the estimated probability that the mapping location is wrong?

Question #8
==============
The `samtools mpileup` command reports the depth of coverage and the alleles observed at each position in the genome.  Using this command, figure out which column of the output represents the depth of sequencing coverage and use the UNIX `sort` command to report which two positions in the genome have the highest depth of sequencing coverage in this BAM file.  You will want to read up on how to use the UNIX `sort` command to sort data by a specific column (in this case, the depth column of the output of `samtools mpileup`):
https://www.geeksforgeeks.org/sort-command-linuxunix-examples/#:~:text=%2Dk%20Option%3A%20Unix%20provides%20the,sort%20on%20the%20second%20column.

Question #9
============
Use the `scp` command to transfer the sorted BAM file and index to
your OSX or Windows Desktop.

Load this BAM file into IGV using the File>Load from URL option. 

Using IGV only, what is the total aligned sequencing depth on chromosome 2, position 21,236,251? How many G alleles and T alleles were observed?  

Question #10
============
Given the alleles observed on chromosome 2, position 21,236,251, do you think this is evidence of a genetic variant in this individual?  Why or why not?
