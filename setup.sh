#!/usr/bin/env bash
# PTS-Pack setup script
#
# A script designed to setup the environment for PTS-Pack use

# Dir setup
if [ -n "$SLURM_JOB_ID" ]; then
	SCRIPT_PATH=$(dirname $(scontrol show job $SLURM_JOB_ID | awk -F= '/Command=/{print $2}'))
else
	SCRIPT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
fi


### MAIN ###


source ${SCRIPT_PATH}/spack/share/spack/setup-env.sh
spack load php-pts
alias pts=${SCRIPT_PATH}/phoronix-test-suite/phoronix-test-suite
