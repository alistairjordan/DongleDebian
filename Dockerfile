FROM debian:bookworm
WORKDIR /dongle
RUN apt update && apt install -y make gcc bash bison flex 
RUN apt install -y gcc-aarch64-linux-gnu git
RUN apt install -y bc libssl-dev dpkg-dev build-essential kmod cpio debhelper rsync
RUN apt install -y qemu-user-static binfmt-support fakeroot mkbootimg android-sdk-libsparse-utils
RUN apt install -y debootstrap && apt purge -y arch-test
RUN apt install -y qemu-system-arm
RUN apt install -y zip
ENTRYPOINT ["/bin/bash", "./scripts/docker_entrypoint.sh"]
#ENTRYPOINT "/bin/bash" # ./scripts/build_linux.sh"
