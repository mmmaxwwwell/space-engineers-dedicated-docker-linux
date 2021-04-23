FROM mmmaxwwwell/wine6:latest

COPY install-winetricks /scripts/
RUN \
  mkdir /wineprefix &&\
  chown -R wine:wine /wineprefix &&\
  chmod +x /scripts/install-winetricks
WORKDIR /scripts
RUN runuser wine bash -c ./install-winetricks
RUN \
  mkdir -p /appdata/space-engineers/bin &&\ 
  mkdir -p /appdata/space-engineers/config
RUN \
  apt-get install locales -y &&\
  locale-gen en_US.UTF8 &&\
  dpkg-reconfigure --frontend=noninteractive locales
  
ENV LANG=en_US.UTF8
ENV LANGUAGE=en_US.UTF8
ENV LC_ALL=en_US.UTF8
RUN cat /etc/locale.gen
RUN echo "en_US UTF-8" >> /etc/locale.gen
RUN locale-gen
RUN locale -a
COPY entrypoint.bash /entrypoint.bash
COPY entrypoint-space_engineers.bash /entrypoint-space_engineers.bash
RUN chmod +x /entrypoint.bash && chmod +x /entrypoint-space_engineers.bash
COPY LocaleTest.exe /LocaleTest.exe
CMD /entrypoint.bash

  

