#!/bin/bash

docker build \
-t aa3025/oracle-7-xfce4 \
--build-arg user=$USER \
--build-arg pass=qwerty \
--build-arg uid=$(id -u) \
--build-arg gid=$(id -g) \
--build-arg display=3 \
.
