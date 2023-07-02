FROM debian:bullseye-slim
WORKDIR /root
RUN mkdir /scripts
RUN \
  dpkg --add-architecture i386 &&\
  apt-get update &&\
  apt install -y curl  locales &&\
  apt update && apt upgrade -y &&\
  apt install curl gnupg2 software-properties-common -y &&\
  curl https://dl.winehq.org/wine-builds/winehq.key | apt-key add - &&\
  apt-add-repository https://dl.winehq.org/wine-builds/debian/ &&\
  apt-add-repository non-free &&\
  apt-get update &&\
  apt update &&\
  locale-gen en_US.UTF-8 &&\
  dpkg-reconfigure locales
RUN \
  apt install --install-recommends winehq-stable -y &&\
  curl -L https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks > /scripts/winetricks &&\
  chmod +x /scripts/winetricks &&\
  adduser wine --disabled-password --gecos "" &&\
  touch /home/wine/.bash_profile
RUN \
  echo steam steam/question select "I AGREE" | debconf-set-selections &&\
  curl -L http://ftp.us.debian.org/debian/pool/non-free/s/steamcmd/steamcmd_0~20180105-4_i386.deb > steamcmd_0~20180105-4_i386.deb &&\
  dpkg -i steamcmd_0~20180105-4_i386.deb &&\
  apt install xvfb cabextract unzip -y &&\
  apt purge software-properties-common gnupg2 python* -y &&\
  apt autoclean &&\
  apt autoremove -y
  
COPY install-winetricks /scripts/
RUN \
  mkdir /wineprefix &&\
  chown -R wine:wine /wineprefix &&\
  chmod +x /scripts/install-winetricks
WORKDIR /scripts
RUN runuser wine bash -c ./install-winetricks
WORKDIR /root
RUN \
  mkdir -p /appdata/space-engineers/bin &&\
  mkdir -p /appdata/space-engineers/config
COPY entrypoint.bash /entrypoint.bash
COPY entrypoint-space_engineers.bash /entrypoint-space_engineers.bash
RUN chmod +x /entrypoint.bash && chmod +x /entrypoint-space_engineers.bash

CMD /entrypoint.bash

  

