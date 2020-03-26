# circTCGA
Scan TCGA sequencing data for circRNAs

# Requirements
Singularity is required to assemble `CIRIquant_v.1.0.1` and `picard`. The latest version of Singularity is available at [this link](https://singularity.lbl.gov/install-linux). I have assembled a Docker file hosted at https://hub.docker.com/r/barryd237/ciriquant_v1.0.1 which will be used to pull the image for use with Singularity. 

The latest version of Conda is also required, available [here](https://www.anaconda.com/distribution/). Conda will be used to construct environments for `Circseq` and `circexplorer2`, respectively. 

Finally `nextflow` is required to run scripts. The latest executable can be downloaded [here](https://www.nextflow.io/docs/latest/getstarted.html#installation). 

# Step 1
#### Constructing environments
To construct the environments for `CIRIquant`, `circseq` and `circexplorer`, run the `installer.sh` script available in the repository. 

```bash
bash installer.sh
```
