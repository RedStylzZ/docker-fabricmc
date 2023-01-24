FROM openjdk:17-slim

ENV MC_VERSION="latest" \
    FABRIC_LOADER_VERSION="latest" \
    FABRIC_INSTALLER_VERSION="latest" \
    MC_RAM="" \
    JAVA_OPTS="" \
    EULA="false"

RUN apt-get update \
    && apt-get install -y curl jq \
    && mkdir /fabricmc

COPY run.sh .

CMD ["sh", "run.sh"]

EXPOSE 25565/tcp
EXPOSE 25575/tcp
VOLUME /fabricmc
