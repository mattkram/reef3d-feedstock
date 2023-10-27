#!/bin/sh

# Supplement conda-forge environment variable with extra paths
MPICXX="mpicxx -cxx=${CXX}"
CXXFLAGS="$CXXFLAGS -w -std=c++11 -O3"
LDFLAGS="-lHYPRE $LDFLAGS"
INCLUDE="-I${PREFIX}/include/eigen3 -DEIGEN_MPL2_ONLY"

make -j "${CPU_COUNT}" CXX="${MPICXX}" CXXFLAGS="${CXXFLAGS}" INCLUDE="${INCLUDE}" LDFLAGS="${LDFLAGS}"

mkdir -p "${PREFIX}/bin"
cp bin/REEF3D "${PREFIX}/bin/reef3d"
chmod 755 "${PREFIX}/bin/reef3d"
