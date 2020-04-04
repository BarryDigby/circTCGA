# circTCGA
Scan TCGA sequencing data for circRNAs. Readme is collection of notes as scripts are prepared. 

### Downloading Prerequisite files
CircRNA tools are extremely selective about which reference genome and annotation files are supplied! However it seems that the field of circRNA was built on hg19, specifically UCSC and gencode. Thus, this section provides a breakdown of the files required for each tool:

* `circseq`: circseq requires a `hg19.fa` file, a `hg19.2bit` file and the intron and exon boundaries in hg19. The former 2 are available at the ftp site at UCSC (see [here](http://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/)). The latter 2 files have been prepared by the folks at the Mayo Clinic and are available for downaload at the following [link](http://bioinformaticstools.mayo.edu/downloads/circRNA/CircSeq_ref_files.tgz). One thing that catches users out is that the user manual for `circseq` recommends concatenating every fasta file from `chromFa.tar.gz` i.e `cat *.fa > hg19.fa` (doing this will also include the haplotype files). Further down the line, `find_circ.py` will look for individual chromosome files that are present in hg19.fa. I recommend deleting the haplotype files, then concatenating the remaining files into `hg19.fa`. After concatenating the files, unzip the tar file again and remove the haplotype files. Once the `circseq` environment has been configured, install circseq scripts via this link http://bioinformaticstools.mayo.edu/downloads/circRNA/CircSeq_standalone.tgz. Unpack the file and save it to the `circseq` Anaconda environment bin. 

* `CIRIquant`: CIRIquant requires a genome fasta file and a GTF file. 

* `circexplorer2`: circexplorer2 requires a genome fasta, annotations in text and GTF format. The tools comes with a `fetch_ucsc.py` script that will automatically download and generate these files for you. This script is used to produce reference files for `circseq` and `ciriquant`.

* `KNIFE`: KNIFE offers a complete set of genomes, genome and junction indices at the following link: https://mega.nz/#F!RtsCHCQb!fyxYNWjoCef5Ie361vUxiA. You will have to install MEGAsync to download the files, and then painfully split them and upload to lugh via mojo... damn you coronavirus.  

### Script 2 (index.sh)
Bash script to make directories and perform genome indexing using the following tools:
* `bowtie`
* `bowtie2`
* `STAR`
* `hisat2`
* `bwa`
* `samtools` (made in previous script) 

### Script 3 (bam_to_fastq.sh)
Simple script using `picard.jar SamToFastq` to convert TCGA bams to fastq pairs. Crucial that you include `VALIDATION_STRINGENCY=LENIENT`. 

* **future work** add picard to an environment so that no manual installation is required. 
