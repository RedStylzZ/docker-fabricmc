# API Doc https://meta.fabricmc.net/
cd fabricmc

BASE_URL="https://meta.fabricmc.net/v2/versions"
GAME_VERSION_URL="$BASE_URL/game"
INSTALLER_URL="$BASE_URL/installer"
LOADER_URL="$BASE_URL/loader"

if [ ${MC_VERSION} = "latest" ]
then
    MC_VERSION=$(curl -so - $GAME_VERSION_URL | jq -r '.[0].version')
fi

LOADER_URL=$LOADER_URL/$MC_VERSION

if [ ${FABRIC_LOADER_VERSION} = "latest" ]
then
    FABRIC_LOADER_VERSION=$(curl -so - $LOADER_URL | jq -r '.[0].loader.version')
fi

if [ ${FABRIC_INSTALLER_VERSION} = "latest" ]
then
    FABRIC_INSTALLER_VERSION=$(curl -so - $INSTALLER_URL | jq -r '.[0].version')
fi

JAR_NAME="fabric-server-mc.${MC_VERSION}-loader.${FABRIC_LOADER_VERSION}-launcher.${FABRIC_INSTALLER_VERSION}.jar"

if [ ! -e ${JAR_NAME} ]
then
    rm -f *.jar
    D_URL="${LOADER_URL}/${FABRIC_LOADER_VERSION}/${FABRIC_INSTALLER_VERSION}/server/jar"
    echo $D_URL
    echo meep
    curl -o $JAR_NAME $D_URL

    mv /eula.txt .

    if [ ! -z ${MC_RAM} ]
    then
        JAVA_OPTS="-Xmx${MC_RAM} ${JAVA_OPTS}"
    fi
fi
exec java ${JAVA_OPTS} -jar $JAR_NAME nogui