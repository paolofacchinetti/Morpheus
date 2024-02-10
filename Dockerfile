FROM debian:12.4

ENV DISPLAY :1

RUN apt-get update && \
    apt-get install -y dialog libgtk-3-0 libnotify4 libnss3 libxtst6 xdg-utils libatspi2.0-0 libdrm2 libgbm1 libxcb-dri3-0 libxss1 trash-cli libglib2.0-bin libasound2

RUN apt-get install -y xvfb x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable x11-apps

ADD "https://drive.usercontent.google.com/download?id=1PQ3n7LXeJHe_jmkYLDUQ9fWjZQTWbHCB&export=download&confirm=t&uuid=d005eb88-e7ec-427c-9826-bc2c9219694b&at=APZUnTWaR369fHuUfsJfswu1cXKS%3A1707589386112" ./morpheus.deb

RUN dpkg -i ./morpheus.deb

CMD ["/bin/bash", "-c", "Xvfb :1 -screen 0 1024x768x24 +extension GLX +render -noreset >> xsession.log 2>&1 & morpheus --no-sandbox"]