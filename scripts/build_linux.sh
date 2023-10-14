export CROSS_COMPILE=aarch64-linux-gnu-
export ARCH=arm64
pushd linux
make msm8916_defconfig
make -j`nproc`
make -j`nproc` deb-pkg
popd
