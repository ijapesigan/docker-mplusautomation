#!/bin/bash

set -e

# Copy ComboLinux64.bin to scripts/

./ComboLinux64.bin -i silent
ln -s /opt/mplus/8.11/mplus /usr/local/bin/mplus
