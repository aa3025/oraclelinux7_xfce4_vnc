#!/bin/bash

docker build \
-t local/oracle7_xfce_vnc \
--build-arg user=$USER \
--build-arg pass=qwerty \
--build-arg uid=$(id -u) \
--build-arg gid=$(id -g) \
--build-arg display=3 \
.
