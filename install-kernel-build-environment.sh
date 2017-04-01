#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment
#
# For example:
# yum install -y curl wget git tmux firefox xvfb
#!/bin/bash -eux

echo "==> Installing kernel build environment"

export DEBIAN_FRONTEND=noninteractive
apt-get install -y ncurses-dev libssl-dev build-essential kernel-package

