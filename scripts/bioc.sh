#!/bin/bash

set -e

# Bioconductor packages
Rscript -e "if (!requireNamespace('BiocManager', quietly = TRUE)) install.packages('BiocManager'); BiocManager::install('rhdf5', update = FALSE, ask = FALSE)"
Rscript -e "library(rhdf5)"

echo -e "\nInstall Bioconductor packages, done!"
