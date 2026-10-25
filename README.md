
<!-- README.md is generated from .setup/readme/README.Rmd, which rProject's
docker template writes. Edit .setup/readme/description.md, scripts/cran.txt,
scripts/github.txt, or .setup/scripts/project.R instead. -->

# ijapesigan/mplusautomation

<!-- badges: start -->

[![Docker Build and Push MplusAutomation \[multi\]
(Daily)](https://github.com/ijapesigan/docker-mplusautomation/actions/workflows/docker-build-push-daily-multi-mplusautomation.yml/badge.svg)](https://github.com/ijapesigan/docker-mplusautomation/actions/workflows/docker-build-push-daily-multi-mplusautomation.yml)
[![Docker Build and Push
\[multi\]](https://github.com/ijapesigan/docker-mplusautomation/actions/workflows/docker-build-push-multi.yml/badge.svg)](https://github.com/ijapesigan/docker-mplusautomation/actions/workflows/docker-build-push-multi.yml)
[![Make
Project](https://github.com/ijapesigan/docker-mplusautomation/actions/workflows/make.yml/badge.svg)](https://github.com/ijapesigan/docker-mplusautomation/actions/workflows/make.yml)
[![Non-ASCII
Check](https://github.com/ijapesigan/docker-mplusautomation/actions/workflows/non-ascii-check.yml/badge.svg)](https://github.com/ijapesigan/docker-mplusautomation/actions/workflows/non-ascii-check.yml)
[![Shell
Check](https://github.com/ijapesigan/docker-mplusautomation/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/ijapesigan/docker-mplusautomation/actions/workflows/shellcheck.yml)
<!-- badges: end -->

## Description

An R image for
[MplusAutomation](https://github.com/michaelhallquist/MplusAutomation),
built on `ijapesigan/tidyverse`, with rhdf5 and rProject. It has no
Mplus: the licensed Mplus is a local add-on
(`mplusautomation-plus.sif`), never pushed.

Based on `ijapesigan/tidyverse:latest`; built for linux/amd64 and
linux/arm64. Source:
<https://github.com/ijapesigan/docker-mplusautomation>.

## Use

Docker (Docker Hub or the GitHub Container Registry):

``` bash
docker run -it ijapesigan/mplusautomation
docker run -it ghcr.io/ijapesigan/mplusautomation
```

Apptainer:

``` bash
apptainer pull mplusautomation.sif docker://ijapesigan/mplusautomation
apptainer shell mplusautomation.sif
```

## Contents

R packages from CRAN (`scripts/cran.txt`), with their dependencies:

MplusAutomation, mvtnorm, matrixStats, sp

## Builds

- Docker Build and Push MplusAutomation \[multi\] (Daily)
  (`docker-build-push-daily-multi-mplusautomation.yml`): daily at 00:00
  UTC, when the base image is rebuilt
- Docker Build and Push \[multi\] (`docker-build-push-multi.yml`): after
  Make Project
- Make Project (`make.yml`): on push
- Non-ASCII Check (`non-ascii-check.yml`): after Make Project
- Shell Check (`shellcheck.yml`): after Make Project

The images are pushed to Docker Hub and the GitHub Container Registry as
`ijapesigan/mplusautomation:latest`.
