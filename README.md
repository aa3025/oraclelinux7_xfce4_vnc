# oraclelinux7_xfce4_vnc
Oracle Linux 7 XFCE 4 VNC Desktop



Build Oracle Linux 7.9 Docker image with Xfce4 Desktop and VNC server (TurboVNC)

git clone https://github.com/aa3025/oraclelinux7_xfce4_vnc.git

cd oraclelinux7_xfce4_vnc/

If you want edit variables in ./01_build.sh (user, UID and GID, password etc)

Then run build script:

    sh ./01_build.sh

You may want to edit or remove docker volumes created in 02_start.sh to reflect your local system. Then run start script:

    sh ./02_start.sh

Once VNC server starts in the container (you will see the output in your terminal), connect to it in VNC, to the displaynumber specified in build.sh, e.g. 
  
    vncviewer.exe hostname:3
    
To stop the container, either : 

    -- logout from VNC Desktop session
    
    -- docker rm -f CONTAINERID
