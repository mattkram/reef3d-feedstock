#!/bin/sh

HYPRE_DIR="${PREFIX}"

# Supplement conda-forge environment variable with extra paths
LDFLAGS="-L${HYPRE_DIR}/lib/ -lHYPRE $LDFLAGS"

make -j "${CPU_COUNT}" CXX="mpicxx" HYPRE_DIR="${HYPRE_DIR}" EIGEN_DIR="${PREFIX}/include/eigen3" LDFLAGS="${LDFLAGS}"

mkdir -p "${PREFIX}/bin"
cp bin/REEF3D "${PREFIX}/bin/reef3d"
chmod 755 "${PREFIX}/bin/reef3d"
