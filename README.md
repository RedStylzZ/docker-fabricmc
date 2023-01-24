
# Example Run command

    docker run -itd --name=fabric-1.19.3 \
    -p 25565:25565 \
    -v /PATH/TO/GAME/DIR:/fabricmc \
    -e EULA=true \
    -e MC_VERSION="latest" \
    -e MC_RAM="8G" \
    mueslisenpai/fabricmc-docker:latest

> You have to set the eula to true with `-e EULA=true`, otherwise your server won't start 

By default, the container will download the latest version of FabricMC, unless you specify it with `-e MC_VERSION=1.19.3` e.x.

# Environment Variables
| Env Variable             | Standard     |
|--------------------------|--------------|
| MC_VERSION               | latest       |
| MC_RAM                   |              |
| JAVA_OPTS                |              |
| EULA                     | false        |
| FABRIC_LOADER_VERSION    | latest       |
| FABRIC_INSTALLER_VERSION | latest       |
     

