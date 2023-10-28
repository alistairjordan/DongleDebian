FROM debian:bookworm
RUN apt update && apt install -y bash
RUN apt install -y gcc gcc-arm-none-eabi
RUN apt install -y python3 python3-pip python3-venv git
ENTRYPOINT ["/bin/bash","/dongle/build_bootloader.sh"]
