FROM ijapesigan/tidyverse:latest

ADD scripts /usr/src/local/src
RUN cd /usr/src/local/src           && \
    chmod 777 ComboLinux64.bin      && \
    chmod 777 setup.sh              && \
    ./setup.sh                      && \
    rm -rf /usr/src/local/src

# extra metadata
LABEL org.opencontainers.image.source="https://github.com/ijapesigan/docker-mplusautomation" \
      org.opencontainers.image.authors="Ivan Jacob Agaloos Pesigan <ijapesigan@gmail.com>"
