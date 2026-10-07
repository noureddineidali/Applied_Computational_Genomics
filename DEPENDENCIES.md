# Dependencies

The exercises use standard Unix tools plus the following bioinformatics tools:

- **BioAWK** for biological file formats
- **EMBOSS** (`geecee`) for GC-content calculation
- **Seqtk** and **SeqKit** for FASTA/FASTQ processing
- **Samtools** for SAM/BAM conversion, sorting, indexing, and pileups
- **FastQC** for sequencing-read quality control

Install them in a dedicated Conda environment:

```bash
conda create -n applied-genomics -c conda-forge -c bioconda \
  bioawk emboss seqtk seqkit samtools fastqc
conda activate applied-genomics
```

The notebooks also require a Jupyter installation with a Python kernel. `eza`
is optional and is used only as a modern directory-listing command.
