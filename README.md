# circTCGA
Collection of scripts to conduct *de novo* circRNA analysis on TCGA sequencing BAM files. The goal of the analysis is to identify circRNAs and their exression values in the sequencing data and to predict miRA response elements (MRE) in their sequences for downstream network analysis. 

### Pre-processing the data
The first step in the analysis is to convert the BAM files back to Fastq pairs, and perform FastQC on the reads. I had expected TCGA BAM files to have been processed however upon inspection of a subset of BAM files (10) I noticed that there is a small portion of adapter contamination and poor read quality at the end of the reads. The read distribution is precisely 48bp for every read suggesting they had indeed been trimmed, but I still want to remove the adapter contamination and poor reads from the Fastq files. 

To run this part of the analysis you must install the required tools present in `scripts/yaml`, specfically the   `pre-process.yml` file to use Picard and FastQC. The nextflow script `process_bams.nf` will convert BAM files to FQ pairs, perform FastQC, MultiQC, trimming using BBDUK and subsequent FastQC and MultiQC analyses on the trimmed reads. 

Trimmed reads are stored under a newly created `fastq` directory for downstream analyses. 

### Downlaoding Genome files, Generating Index files
Each circRNA tool requires different aligners and thus different sets of genome indices. To start, use the `download_files.nf` script to download UCSC hg19 genome, hg19 2bit file, hg19 ensembl text and gtf files. The script removes haplotype contigs from the reference. All files are stored under `reference/` directory. 

Once the files have been downloaded, the next step is to create index files for each circRNA tool. To cover all tools used, the `create_indices.nf` script will create a genome index file for Hisat2, BWA, Bowtie, Bowtie2 and STAR. The index genome files are stored under `index/` in their respective directories.

### De novo circRNA detection
To run this analysis, please make conda environments for each tool. The `yml` files can be found under `scripts/yaml`. For the analysis we will need `circexplorer2.yml`, `ciriquant.yml` and `circseq.yml` (I have decided against using circseq for the analysis as it has an extremely slow BLAT process. The script is based on `find_circ.py`, and this will be used instead as all circseq dependencies are designed to run it). 

To run the analysis execute the `circRNA.nf` script. It will carry out CIRIquant analysis, and use the unmapped bam file generated from this step as inputs for circexplorer2. Similarly, STAR is used to generate Chimeric.junction files to use as inputs for circexplorer2. Find_circ can run independently of the other tools. Results will be deposited in a `results` folder at the top of the directory. Specific output files containing the counts for each BSJ are extracted from the results and deposited in `circRNA_outputs` folder for downstream differential expression analysis and miRNA target analysis. 







