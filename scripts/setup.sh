#!/bin/bash

set -e

bash mplus.sh
bash ubuntu_cran_pkg.sh
bash rproject.sh
bash post.sh
