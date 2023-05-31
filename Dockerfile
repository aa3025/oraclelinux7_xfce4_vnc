FROM oraclelinux:7.9

# Specify custom username, UID, GID and password:
ARG user=user

ARG uid=2000
ARG gid=2000
ARG pass="qwerty"

# Change last line as well if you change VNC display number
ARG display=3

RUN yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
RUN yum groups mark convert
RUN yum groupinstall Xfce -y
RUN yum groupinstall "Development Tools" -y

RUN yum install mc git wget nano sudo tar bzip2 firefox environment-modules https://netcologne.dl.sourceforge.net/project/turbovnc/3.0/turbovnc-3.0.x86_64.rpm -y
WORKDIR "/"

RUN groupadd -g $gid $user
RUN useradd -u $uid -g $uid $user
RUN mkdir -p /home/$user/.vnc

# home folder from host can be mounted here:
RUN mkdir -p /home/$user/shared

RUN echo $(echo qwerty | /opt/TurboVNC/bin/vncpasswd -f) > /home/$user/.vnc/passwd
RUN echo "#!/bin/sh" > /opt/xstartup.docker
RUN echo "startxfce4" >> /opt/xstartup.docker

RUN echo "module use /share/apps/modulefiles" >> /etc/bashrc
#RUN echo "module load ansys/last" >> /home/$user/.bashrc

RUN chmod +x /opt/xstartup.docker

COPY startup.sh /opt/startup.sh
RUN chmod +x /opt/startup.sh
RUN chown -R $user:$user /home/$user
RUN chmod 600 /home/$user/.vnc/passwd
RUN usermod -aG wheel $user
RUN echo $pass | passwd -f -u $user
#CMD "/bin/bash"
USER $user
CMD [ "/opt/startup.sh", "3" ] 
