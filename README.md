# circTCGA
Scan TCGA sequencing data for circRNAs. Readme is collection of notes as scripts are prepared. 

### Script 1 (download_files.sh)
Despite `CIRIquant` using gencode as a reference genome for their tutorial, I will attempt to use `circexplorer2` to download UCSC's hg19 genome and use this as the reference for all 3 tools. To my knowledge, `circseq` and `circexplorer2` are compatible with UCSC reference genomes and annotations. Furthermore, `fetch_ucsc.py` is a very useful script that pulls the reference chromosomes, and concatenates the 'primary' chromosomes along with unplaced sequences. The haplotype sequences are not included in the reference genome. This is consitent with the Gencode GRCh37 genome. This was confirmed by simply running `grep ">" $genome` and inspecting the output. If all that was simply required is a reference genome, then this documentation would be unnecessary. Like everything in bioinformatics, each tool has its quirks: 

* `circseq`: circseq requires a hg19.fa file, a hg19.2bit file and the intron and exon boundaries in hg19. The former 2 are available at the ftp site at UCSC (see [here](http://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/)). The latter files have been prepared by the folks at the Mayo Clinic and are available for downaload at the following [link](http://bioinformaticstools.mayo.edu/downloads/circRNA/CircSeq_ref_files.tgz). One thing that catches users out is that the user manual for `circseq` recommends concatenating every fasta file from `chromFa.tar.gz` i.e `cat *.fa > hg19.fa`. Doing this will include the haplotype files. Further down the line, `find_circ.py` will look for individual chromosome files that are present in hg19.fa. Thus, it is advisable (in my case) to delete the haplotype files, then concatenate the remaining files into hg19.fa. Be sure to leave the individual chromosome files in the directory.

* `CIRIquant`: Requires a genome fasta file and a GTF file. May have to resort to gencode due to tools parsing scripts. 

* `circexplorer2`: Utilises the `fetch_ucsc.py` script. Requires a genome fasta, annotations in text and GTF format. 

Try and figure out which step needs `hg19.fa.fai`, as it is created in the dir.  
