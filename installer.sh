#!/usr/bin/env bash
# Script to install environments for analysis

conda env create -f Conda_Environments/circseq.yml
conda env create -f Conda_Environments/circexplorer2.yml
conda env create -f Conda_Environments/ciriquant.yml
