# circTCGA
Scan TCGA sequencing data for circRNAs. Readme is collection of notes as scripts are prepared. 

#### Requirements
`nextflow` and `anaconda` must be installed to run the pipeline [[1](#1)]. 

#### Scripts
* **install_environments.nf**: creates conda envrionments required for the analysis

* **process_bams.nf**: converts TCGA bam files to fastq pairs using `picard`. Performs QC and subsequent adaptor / Phred score filtering using `bbduk.sh`. Final QC performed on cleaned reads. 

* **download_files.nf**: downloads the hg19 genome along with annotation files required for the analysis [[2](#2)].

* **create_indices.nf**: creates genome index files for 5 aligners.

<a name="1">1</a>: To run the pipeline on a HPC, you must make anaconda compatible with nextflow in order to use the compiled environments. Add the anaconda bin to your PATH via ~/.bashrc e.g : `export PATH="/home/bdigby/Anaconda3/4.4.0/bin/:$PATH"`.

<a name="2">2</a>: Haplotype files are removed from the reference genome during this step. 

