Homework #2
============

Setup
=====
First, we need to download the FASTA file for chr22 from build 38 of the human genome.

    curl https://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes/chr22.fa.gz > chr22.fa.gz
    gzip -d chr22.fa.gz

Question #1
============
How many G or C nucleotides (the GC content) are there on chr22? Show your work by providing the command(s) you used.

Question #2
===========
First read this tutorial on using `nano` (https://linuxize.com/post/how-to-use-nano-text-editor/). Nano is a text editor for Unix that allows you to create and edit text files. You can skip the installation section, as nano is already installed on malibu.  Using nano, you will add all of the commands from question 1 into a new file in nano and save it as `gc_content.sh`.  Once saved, you have created your first shell script.  A shell script is a series of one or more Unix commands that can be run as an automated "recipe".  After being saved, you can run the shell script by typing `bash gc_content.sh` on the command line.  Create the script, run it, and provide both the command you ran and the output.

Question #3
============
Recall question #8 from Homework 1.  Create a UNIX pipeline using `sort` and `uniq` that answers it with a _single_ command. Refer to the slides at the end of the "Pattern searching in the human genome" deck for a brief tutorial on using `sort` and `uniq`. There are also many examples of this online.
Show your work by providing the _single_ command you used.

Question #4
============
How many lines in the chr22 file have exactly 15 cytosines?
Show your work by providing the command(s) you used.

Question #5
============
How many lines in the chr22 file have >=15 cytosines? Note: checkout the -n option for the sort command.
Show your work by providing the command(s) you used.

Question #6
============
What fraction of chr22 is unknown sequence (Ns?)
Show your work by providing the command(s) you used.

Question #7
============
Restriction enzymes cleave DNA molecules at or near a specific sequence of bases. For example, the HindIII (Hin D 3) enzyme cuts at the "/" in this motif: 5'A/AGCTT3'.
How many perfectly matching HindIII restriction enzyme cut sites are there on chr22? Don't worry about sites that span two lines - just care about sites that are fully contained on a single line.

Question #8
===========
Given the chr22 fasta file we have used for the rest of this homework, devise a conceptual strategy for using Unix commands you know of so far (and possibly a wish list of methods that you are not yet aware of) to describe how you would conduct an *in silico* digest of  chr22 using HindIII. That is, if HindIII cuts at the sites described above, how could you predict exactly the sequences and their lengths that would result from chr22?


Bonus (not req'd but worth extra points) 
=======================================================
(1 pt) 1. How many distinct gaps (continuous runs of Ns) are there on chromosome 22? Show your work.
