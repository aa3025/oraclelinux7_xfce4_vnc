#!/bin/bash
# srun as "./startup.sh 2"

/opt/TurboVNC/bin/vncserver :$1 -fg -xstartup /opt/xstartup.docker
