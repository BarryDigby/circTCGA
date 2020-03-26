#!/usr/bin/env bash
# Script to install envs, images
# Barry Digby

conda env create -f Conda_Environments/circseq.yml

conda env create -f Conda_Environments/circexplorer2.yml

singularity pull docker://barryd237/picard

singularity pull docker://barryd237/ciriquant_v1.0.1

mkdir -p containers

mv *.simg containers/
