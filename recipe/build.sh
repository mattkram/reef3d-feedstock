#!/bin/bash

# If using openmpi, we need to set the prefix. This is critical for
# cross-compilation of the osx-arm64 build.
if [[ $mpi == "openmpi" ]]; then
  export OPAL_PREFIX=${PREFIX}
fi

# These variables are required by the Makefile, and are passed in
# from recipe
GIT_VERSION="${VERSION}"
GIT_BRANCH="master"

echo "GIT_VERSION=${GIT_VERSION}"
echo "GIT_BRANCH=${GIT_BRANCH}"

CXX="mpicxx"
CXXFLAGS="$CXXFLAGS -w -std=c++11 -O3 -DVERSION='\"${GIT_VERSION}\"' -DBRANCH='\"${GIT_BRANCH}\"'"
LDFLAGS="-lHYPRE $LDFLAGS"
INCLUDE="-I${PREFIX}/include/eigen3 -DEIGEN_MPL2_ONLY"

echo "CXXFLAGS=${CXXFLAGS}"

make -j "${CPU_COUNT}" CXX="${CXX}" CXXFLAGS="${CXXFLAGS}" INCLUDE="${INCLUDE}" LDFLAGS="${LDFLAGS}"

mkdir -p "${PREFIX}/bin"
cp bin/REEF3D "${PREFIX}/bin/reef3d"
chmod 755 "${PREFIX}/bin/reef3d"
