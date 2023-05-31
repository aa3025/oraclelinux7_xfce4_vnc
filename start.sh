#!/bin/bash

# RUN THIS SCRIPT TO START EXISTING IMAGE created from Dockerfile previously ("docker build . -t aa3025/oracle-7-xfce4")


user=`cat Dockerfile | grep "ARG user" | cut -d'=' -f 2`

# make 2 volumes: SHARE and $USER
docker volume create --driver  local --opt type=nfs --opt o=addr=172.16.0.253,vers=4,soft,ro --opt device=:/export/share SHARE
docker volume create --driver  local --opt type=nfs --opt o=addr=172.16.0.253,vers=4,soft,rw --opt device=:/export/$HOME $USER

# mount local USER home in /home/$user/shared
docker run -p 5903:5903 -v SHARE:/share -v $USER:/home/$user/shared -h compute aa3025/oracle-7-xfce4

