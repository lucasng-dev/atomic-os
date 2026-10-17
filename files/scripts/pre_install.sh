#!/usr/bin/env bash
set -eux -o pipefail

# docker groups
groupadd -g 913 docker

# 1password groups: https://github.com/bsherman/ublue-custom/blob/main/build_files/1password.sh
groupadd -g 1790 onepassword
groupadd -g 1791 onepassword-cli
groupadd -g 1792 onepassword-mcp
