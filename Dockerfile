# ============== build stage ==================
FROM debian as builder

WORKDIR /root
RUN apt update && apt install wget -y

RUN wget 'https://raw.githubusercontent.com/7thCore/sesrv-script/master/sesrv-script.bash'
RUN echo steam steam/question select "I AGREE" | debconf-set-selections && echo steam steam/license note '' | debconf-set-selections  && echo postfix postfix/mailname string 'your.hostname.com' | debconf-set-selections && echo postfix postfix/main_mailer_type string 'Internet Site'| debconf-set-selections
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
RUN bash sesrv-script.bash -install_packages

ENV TMPFS=n
ENV SET_BETA_BRANCH_STATE=n
ENV SCRIPT_UPDATE_CONFIG=n
ENV POSTFIX_ENABLE=n
ENV DISCORD_ENABLE=n
RUN bash sesrv-script.bash -install 
RUN apt-get clean autoclean && apt-get autoremove -y && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN apt install --yes --allow-downgrades --install-recommends wine-staging-i386=5.9~buster && \
    apt install --yes --allow-downgrades --install-recommends wine-staging-amd64=5.9~buster && \
    apt install --yes --allow-downgrades --install-recommends wine-staging=5.9~buster && \
    apt install --yes --allow-downgrades --install-recommends winehq-staging=5.9~buster

# ============== runtime stage ================
FROM builder as runtime

RUN runuser -l space_engineers -c "cd && env WINEARCH=win64 WINEPREFIX=/home/space_engineers/server winetricks --force -q dotnet48"

COPY entrypoint.bash /entrypoint.bash
COPY entrypoint-space_engineers.bash /entrypoint-space_engineers.bash
RUN chown space_engineers /entrypoint-space_engineers.bash

ENTRYPOINT /entrypoint.bash