#!/bin/sh

# Supplement conda-forge environment variable with extra paths
CXX="mpicxx"
LDFLAGS="-lHYPRE $LDFLAGS"
INCLUDE="-I${PREFIX}/include/eigen3 -DEIGEN_MPL2_ONLY"

make -j "${CPU_COUNT}" CXX="${CXX}" INCLUDE="${INCLUDE}" LDFLAGS="${LDFLAGS}"

mkdir -p "${PREFIX}/bin"
cp bin/REEF3D "${PREFIX}/bin/reef3d"
chmod 755 "${PREFIX}/bin/reef3d"
