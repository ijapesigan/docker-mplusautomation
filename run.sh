#!/bin/bash

set -e

cp /storage/home/ibp5092/work/software/mplus-9.01/ComboLinux64.bin scripts

docker build -t mplusautomation:latest .
apptainer build mplusautomation.sif docker-daemon://mplusautomation:latest
cp mplusautomation.sif /storage/home/ibp5092/work/sif
