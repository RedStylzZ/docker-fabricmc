FROM openjdk:17-slim

ENV MC_VERSION="latest" \
    FABRIC_LOADER_VERSION="latest" \
    FABRIC_INSTALLER_VERSION="latest" \
    MC_RAM="" \
    JAVA_OPTS=""

RUN apt-get update \
    && apt-get install -y curl jq \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /fabricmc

COPY eula.txt .
COPY run.sh .

CMD ["sh", "run.sh", "nogui"]

EXPOSE 25565/tcp
EXPOSE 25575/tcp
VOLUME /fabricmc