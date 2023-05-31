# oraclelinux7_xfce4_vnc
Oracle linux 7 XFCE 4 VNC Desktop



Build Oracle Linux 7.9 Docker image with Xfce4 Desktop and VNC server (TurboVNC)

git clone https://github.com/aa3025/oraclelinux7_xfce4_vnc.git

cd oraclelinux7_xfce4_vnc/

edit variables in ./01_build.sh (user, password etc)

./01_build.sh

You may want to edit or remove docker volumes created in 02_start.sh to reflect your local system

./02_start.sh


connect to container in VNC to the displaynumber specified in build.sh, e.g. 
vncviewer.exe hostname:3
