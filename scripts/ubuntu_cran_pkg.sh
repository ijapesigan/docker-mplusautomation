#!/bin/bash

set -e

# mplus automation
install2.r --error --skipinstalled -n -1 \
    MplusAutomation

# etc
install2.r --error --skipinstalled -n -1 \
    mvtnorm                              \
    matrixStats                          \
    sp

Rscript -e "install.packages(\"BiocManager\"); BiocManager::install(\"rhdf5\")"
