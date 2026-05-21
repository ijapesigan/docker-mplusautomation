#!/bin/bash

set -e

APPTAINER_BASE="/storage/home/${USER}/work/apptainer"

mkdir -p "${APPTAINER_BASE}"
mkdir -p "/storage/home/${USER}/work/sif"

APPTAINER_TMPDIR="$(mktemp -d "${APPTAINER_BASE}/tmp.XXXXXXXXXX")"
APPTAINER_CACHEDIR="$(mktemp -d "${APPTAINER_BASE}/cache.XXXXXXXXXX")"

cleanup() {
    rm -rf "${APPTAINER_TMPDIR}"
    rm -rf "${APPTAINER_CACHEDIR}"
}

trap cleanup EXIT

chmod 700 "${APPTAINER_TMPDIR}"
chmod 700 "${APPTAINER_CACHEDIR}"

export APPTAINER_TMPDIR
export APPTAINER_CACHEDIR

cp "/storage/home/${USER}/work/software/mplus-9.01/ComboLinux64.bin" scripts

docker build -t mplusautomation:latest .
apptainer build mplusautomation.sif docker-daemon://mplusautomation:latest
cp mplusautomation.sif "/storage/home/${USER}/work/sif"
