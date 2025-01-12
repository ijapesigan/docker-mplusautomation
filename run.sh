#!/bin/bash

set -e

cp ~/work/ComboLinux64.bin scripts

docker build -t mplusautomation:latest .
apptainer build mplusautomation.sif docker-daemon://mplusautomation:latest
