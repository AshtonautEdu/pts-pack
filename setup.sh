#!/bin/sh
# PTS-Pack setup script
#
# A script designed to setup the environment for PTS-Pack use

source ./spack/share/spack/setup-env.sh
spack load php-pts
alias pts=./phoronix-test-suite/phoronix-test-suite
export TMPDIR=./tmp
