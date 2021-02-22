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
COPY entrypoint.bash /entrypoint.bash
COPY entrypoint-space_engineers.bash /entrypoint-space_engineers.bash
RUN chmod +x /entrypoint.bash && chmod +x /entrypoint-space_engineers.bash
CMD /entrypoint.bash

# RUN apt install net-tools -y
# HEALTHCHECK \
#   --interval=1s \
#   --timeout=3s \
#   --start-period=5m \
#   --retries=1 \
#   CMD netstat -an | grep 27016 

  

