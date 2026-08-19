#!/bin/bash

set -euo pipefail

APPTAINER_BASE="/storage/home/${USER}/work/apptainer"
SIF_DIR="/storage/home/${USER}/work/sif"
MPLUS_BIN="/storage/home/${USER}/work/software/mplus-9.01/ComboLinux64.bin"

IMAGE_NAME="mplusautomation"
SIF_NAME="mplusautomation.sif"

mkdir -p "${APPTAINER_BASE}"
mkdir -p "${SIF_DIR}"

APPTAINER_TMPDIR="$(mktemp -d "${APPTAINER_BASE}/tmp.XXXXXXXXXX")"
APPTAINER_CACHEDIR="$(mktemp -d "${APPTAINER_BASE}/cache.XXXXXXXXXX")"

cleanup() {
    rm -rf "${APPTAINER_TMPDIR}" "${APPTAINER_CACHEDIR}"
    rm -f scripts/ComboLinux64.bin
}

trap cleanup EXIT

chmod 700 "${APPTAINER_TMPDIR}" "${APPTAINER_CACHEDIR}"

export APPTAINER_TMPDIR
export APPTAINER_CACHEDIR

# Make Apptainer SIF creation use conservative SquashFS settings.
# Useful on systems with limited memory.
export APPTAINER_MKSQUASHFS_ARGS="-processors 1 -mem 512M -comp gzip -no-progress"

# Optional, but useful while debugging.
export APPTAINER_MESSAGELEVEL=2

# Copy Mplus installer into the Docker build context.
cp -f "${MPLUS_BIN}" scripts/ComboLinux64.bin

# Build Docker image locally.
docker build \
    --pull \
    -t "${IMAGE_NAME}:latest" .

# Convert local Docker image to Apptainer SIF.
apptainer build \
    --force \
    --disable-cache \
    "${SIF_DIR}/${SIF_NAME}" \
    "docker-daemon://${IMAGE_NAME}:latest"
