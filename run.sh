#!/bin/bash

set -e

docker build -t mplusautomation:latest .
apptainer build mplusautomation.sif docker-daemon://mplusautomation:latest
