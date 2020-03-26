#!/usr/bin/env nextflow

/* 
 * Download files for each tool
 */
 
process ucsc_dl{
	publishDir "reference/ucsc/files/", mode:'copy'
         
	output:
	file("*.fa")
	file("hg19.fa")
	file("hg19.2bit")
	file("CircSeq_ref_files/*.bed")
         
	script:
	'''
	wget http://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/chromFa.tar.gz
         
	tar -xvzf chromFa.tar.gz
         
	rm *_*

	cat *.fa > hg19.fa  

	wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/bigZips/hg19.2bit    

	wget http://bioinformaticstools.mayo.edu/downloads/circRNA/CircSeq_ref_files.tgz

	tar -xvzf CircSeq_ref_files.tgz   
	'''
}

process gencode_dl{
	publishDir "reference/gencode/files/", mode:'copy'

	output:
	file("*.fa")
	file("*.gtf")

	script:
	"""
	wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_33/GRCh37_mapping/GRCh37.primary_assembly.genome.fa.gz

	gunzip GRCh37.primary_assembly.genome.fa.gz

	wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_33/GRCh37_mapping/gencode.v33lift37.annotation.gtf.gz

	gunzip gencode.v33lift37.annotation.gtf.gz
	"""
}
