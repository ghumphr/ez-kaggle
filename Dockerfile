FROM gcr.io/kaggle-gpu-images/python
ENV USER=root
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /root
RUN apt update -y

# Install XFCE, VNC server, dbus-x11, and xfonts-base
RUN apt install -y --no-install-recommends xfce4 xfce4-goodies tigervnc-standalone-server dbus-x11 xfonts-base software-properties-common

# Install some basic tools 
RUN apt install -y wget curl

## Make sure R is installed
#RUN apt install -y r-cran-zelig

## Install Jupyter
#RUN pip install --break-system-packages jupyterlab
#RUN pip install --break-system-packages notebook


# Free apt cache
RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose VNC port
EXPOSE 5901

# Expose jupyter-notebook port
EXPOSE 8888

# Copy a script to start the app
#COPY startup.sh /root/startup.sh
#RUN chmod +x /root/startup.sh

# List the contents of the /root directory
#RUN ls -a /root

#CMD ["./startup.sh"]

