#!/bin/bash

set -e

mkdir -p "/storage/home/${USER}/work/apptainer/tmp"
mkdir -p "/storage/home/${USER}/work/apptainer/cache"
mkdir -p "/storage/home/${USER}/work/sif"

chmod 700 "/storage/home/${USER}/work/apptainer/tmp"
chmod 700 "/storage/home/${USER}/work/apptainer/cache"

export APPTAINER_TMPDIR="/storage/home/${USER}/work/apptainer/tmp"
export APPTAINER_CACHEDIR="/storage/home/${USER}/work/apptainer/cache"

cp /storage/home/${USER}/work/software/mplus-9.01/ComboLinux64.bin scripts

docker build -t mplusautomation:latest .
apptainer build mplusautomation.sif docker-daemon://mplusautomation:latest
cp mplusautomation.sif /storage/home/${USER}/work/sif
