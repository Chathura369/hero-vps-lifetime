FROM ubuntu:20.10
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get upgrade
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        dbus-x11 \
        nautilus \
        gedit \
        expect \
        sudo \
        vim \
	vlc \
        bash \
        net-tools \
        novnc \
        xfce4 \
	socat \
        x11vnc \
	xvfb \
        supervisor \
        curl \
        git \
	pulseaudio \
        wget \
        g++ \
	unzip \
        ssh \
	ffmpeg \
	chromium-browser \
	firefox \
        terminator \
        htop \
        gnupg2 \
	locales \
	xfonts-intl-chinese \
	fonts-wqy-microhei \  
	ibus-pinyin \
	ibus \
	ibus-clutter \
	ibus-gtk \
	ibus-gtk3 \
	ibus-qt4 \
	openssh-server \
    && apt-get autoclean \
    && apt-get autoremove \

COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
