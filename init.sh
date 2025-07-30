#!/bin/bash
#SBATCH --job-name=pts-pack-init
#SBATCH --time=01:00:00
#SBATCH --mem=4G
#SBATCH --cpus-per-task=2
#SBATCH --out=init.out
#
# PTS-Pack initialisation script
#
# A script designed to be ran immediately after download of the pack


# Slurm check
if [[ "$1" == "--slurm" ]]; then
	echo "Running initialisation as Slurm job"
	job_id=$(sbatch "$0" | awk '{print $4}')
	echo "Submitted job $job_id"
	exit 0
fi


# Dir setup
if [ -n "$SLURM_JOB_ID" ]; then
	SCRIPT_PATH=$(dirname $(scontrol show job $SLURM_JOB_ID | awk -F= '/Command=/{print $2}'))
else
	SCRIPT_PATH=$(dirname $(realpath $0))
fi
cd $SCRIPT_PATH


### MAIN ###


# Spack setup
if [ ! -e spack ]; then
	wget -q --show-progress https://github.com/spack/spack/releases/download/v1.0.0/spack-1.0.0.tar.gz
	tar -xf spack-1.0.0.tar.gz
	rm spack-1.0.0.tar.gz
	mv spack-1.0.0 spack
fi
source spack/share/spack/setup-env.sh
spack list > /dev/null # Generate package dir

cp -r ./php_pts ~/.spack/package_repos/fncqgg4/repos/spack_repo/builtin/packages
spack install php-pts

# PTS setup
wget -q --show-progress https://github.com/phoronix-test-suite/phoronix-test-suite/releases/download/v10.8.4/phoronix-test-suite-10.8.4.tar.gz
tar -xf phoronix-test-suite-10.8.4.tar.gz
rm phoronix-test-suite-10.8.4.tar.gz
./phoronix-test-suite/phoronix-test-suite > /dev/null # Generate ~/.phoronix-test-suite
