Homework #1
============

Setup
============
For this homework, we will learn a bit about protein coding genes and transcripts in the human genome by working with a [GTF]() file 
from Ensembl that describes all of the protein coding _and_ non coding genes that have been annotated for human. Now, we know that most
have more than one isoform, and accordingly, this GTF reports information about the exons, introns, and UTRs of each transcript for each 
gene. But first, a couple of warm-up questions.

Question #1
============
Create a new directory in your home directory called homework-01.
Navigate into that directory.
Show your work by providing the command you used.

Question #2
============
Using a UNIX pipe, write a command that counts how many directories are in the `/home` directory on `malibu`. 
Show your work by providing the command you used.

Question #3
============
Unix computers have a convenient file located at `/usr/share/dict/words` that stores all (or at least the majority) of words in the English language. What is the 55,000th word in that file? Show your work by providing the command you used.

Question #4
============
Using a Unix command, how many visible and imvisible characters are in the 55,000th word? Show your work by providing the command you used.

Collecting the data we will use for the rest of this homework
=============================================================
Let's start by downloading this GTF file from Ensemble using a new UNIX command called `curl`. [curl](https://www.tutorialspoint.com/unix_commands/curl.htm)
transfers data from a remote file (i.e., on an FTP or HTTP site) directly to your terminal. In other words, it is the command line
way of going to a website and downloading something. This command is super useful because most real world analyses require getting data
or annotations from other resources such as the UCSC genome browser.

So, you must start by downloading this file. Note that we use the ">" to redirect the data retrieved by `curl` into a new file called
`human.genes.gtf.gz`

    curl ftp://ftp.ensembl.org/pub/release-87/gtf/homo_sapiens/Homo_sapiens.GRCh38.87.gtf.gz > human.genes.gtf.gz
    
Now, notice that the filename ends in ".gz". This means that it is compressed with a program called `gzip`. If you have ever used the 
compression utilities on your Mac or Windows machine, you have likely seen files that end with ".zip".  This is the exact same concept,
but ".gz" file were compressed with a slightly different tool.  So, before we get started, we have to first "decompress" this file into
a plain old text file (in GTF format as we discuss in class) that we can easily work with using the UNIX commands we have learned thus far.
We do this as follows using yet another new UNIX command called `gzip`. The `-d` option tells `gzip` to decompress the file.

    gzip -d human.genes.gtf.gz
    
Now you should see that the file is now called "human.genes.gtf" --- gzip automatically removed the ".gz" extension once it 
finished decompressing the file.

Question #5
============
How many GTF _data_ lines are in this file? Note that the first few lines in the file beginning with "#" are so-called "header" lines 
describing thing like the creation date, the genome version (more on that later in the course), etc.  Header lines should not be counted
as _data_ lines.

Show your work by providing the command you used.

Question #6
============
How many GTF _data_ lines are in this file for _protein coding genes_? Note that entries (lines in the file for protein coding genes 
will contain the following text: gene_biotype "protein_coding"

Use the string above with a command you have learned to find such lines.  

Hint: the UNIX pipe may come in handy here...

Show your work by providing the _single_ command you used.

Question #7
============
How many GTF _data_ lines are in this file for _exons_ from _protein coding genes_? 

Show your work by providing the _single_ command you used.

Question #8
============
How many [CDS](https://www.biostars.org/p/65162/) exons ("CDS" in column 3)  from _protein coding genes_ exist 
on per each chromosome (column 1 in the GTF file)?  That is, the count per chromsome.

Show your work by providing the command or commands you used.

Question #9
============
Explain how you might design an analysis of this file that would reveal how many distinct protein coding genes there are in the human genome. Hint: you may not have learned all of the command you might need - the point is to think about what what you _could_ do with the commands you know of and what limitations would have to be addressed.

Bonus
=====
Using `grep` and the Unix words file from above, write a command that returns only five-letter words. Hint: it is okay to do some googling.
