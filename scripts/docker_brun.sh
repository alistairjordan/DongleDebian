set -e

sudo docker build -t dongle .
sudo docker run --privileged --mount type=bind,source="$(pwd)",target=/dongle dongle build
