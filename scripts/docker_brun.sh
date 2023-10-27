docker build -t dongle .
docker run -it  --privileged --mount type=bind,source="$(pwd)",target=/dongle dongle build
