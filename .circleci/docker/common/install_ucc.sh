#!/bin/bash

set -ex

export UCX_HOME="/usr"
export UCC_HOME="/usr"

git clone https://github.com/openucx/ucx.git
git clone https://github.com/openucx/ucc.git

pushd ucx
./autogen.sh
./contrib/configure-release-mt --prefix=$UCX_HOME --with-cuda=/usr/local/cuda/
make -j
make install
popd

pushd ucc
./autogen.sh
./configure --prefix=$UCC_HOME      \
    --with-ucx=$UCX_HOME            \
    --with-cuda=/usr/local/cuda/
make -j
make install
popd