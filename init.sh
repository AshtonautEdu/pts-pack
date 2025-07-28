#!/bin/sh
# PTS-Pack initialisation script
#
# A script designed to be ran immediately after download of the pack

# Spack setup
wget -q --show-progress https://github.com/spack/spack/releases/download/v1.0.0/spack-1.0.0.tar.gz
tar -xf spack-1.0.0.tar.gz
rm spack-1.0.0.tar.gz
mv spack-1.0.0 spack
source spack/share/spack/setup-env.sh
spack list > /dev/null # Generate package dir

cp -r ./php_pts ~/.spack/package_repos/fncqgg4/repos/spack_repo/builtin/packages
spack install php-pts

# PTS setup
wget -q --show-progress https://github.com/phoronix-test-suite/phoronix-test-suite/releases/download/v10.8.4/phoronix-test-suite-10.8.4.tar.gz
tar -xf phoronix-test-suite-10.8.4.tar.gz
rm phoronix-test-suite-10.8.4.tar.gz
mkdir ./tmp
