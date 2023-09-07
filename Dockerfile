FROM ubuntu:latest

WORKDIR /opt

RUN apt update
RUN apt install -y wget
RUN apt install xz-utils  
RUN wget -O factorio_headless.tar.xz https://www.factorio.com/get-download/1.1.87/headless/linux64
RUN tar -xJf factorio_headless.tar.xz

COPY ./data/server-settings.json ./factorio/data/server-settings.json

ENTRYPOINT /opt/factorio/bin/x64/factorio --start-server /opt/factorio/saves/world.zip --server-settings /opt/factorio/data/server-settings.json

EXPOSE 34197
