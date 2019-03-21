#!/bin/bash
mkdir -p $PREFIX/bin

export C_INCLUDE_PATH="${PREFIX}/include:${PREFIX}/include/bam"
export CPP_INCLUDE_PATH="${PREFIX}/include"
export CXX_INCLUDE_PATH="${PREFIX}/include"
export LIBRARY_PATH="${PREFIX}/lib"
export LD_LIBRARY_PATH="${PREFIX}/lib"
export CFLAGS="$CFLAGS -L${PREFIX}/lib"

# Compile and install. Replace gcc with $CC

pushd src/bamutils
sed -i.bak "s/gcc/\$\(CC\)/g" Makefile
sed -i.bak '/IDIRS=/d' Makefile
sed -i.bak '/LIBDIRS=/d' Makefile
sed -i.bak 's/IDIRS/C_INCLUDE_PATH/g' Makefile
sed -i.bak 's/LIBDIRS/LIBRARY_PATH/g' Makefile
make -B
# Copy executables into prefix
cp bam_pe_insert bam_fix_NH bam_fix_se_flag bam_tophat2_fix bamRindex $PREFIX/bin
popd
