# [mmmaxwwwell/space-engineers-dedicated-docker-linux](https://github.com/mmmaxwwwell/space-engineers-dedicated-docker-linux)

## <center> **This container is currently broken** </center>
## <center> Keen released an update that depends on a syscall not implemented in wine. Please see [this comment](https://github.com/mmmaxwwwell/space-engineers-dedicated-docker-linux/issues/11#issuecomment-825316220) for more info. </center>

## <center> If you use this container, please go to [this issue on keen's support site](https://support.keenswh.com/spaceengineers/pc/topic/v1-198-getgeoinfo-analytics-causes-crash-with-proton) and click the "I have the same bug" button. </center>

<hr>

All of the space engineers dedicated server on wine containers I found wouldn't build, and I embarked on a journey to create my own.

## Features:
* Wine 6
* Debian Buster
* Installs default star system world on first run
* Automatically updates ```<LoadWorld>``` element in ```SpaceEngineers-Dedicated.cfg```
* Supports plugins.
* Image built and [available on dockerhub](https://hub.docker.com/r/mmmaxwwwell/space-engineers-dedicated-docker-linux)
* Easy to implement offsite backups, just copy everything in ```./appdata/space-engineers/config``` with your favorite backup tool.
* Reduced container size (~4gb decompressed).

Thank you to:
* [7thCore](https://github.com/7thCore) for [7thCore/sesrv-script](https://github.com/7thCore/sesrv-script)
* [Devidian](https://github.com/Devidian) for advancing the docker implementation to a working state!
* @Tsu, @Aedis, @ebbit, @data, @ReAn, @BloodyIron, @Inflex, @spawnAjak

## Prerequisites:
* docker
* docker-compose (recommended, not required to run container)
* unzip

## Tips:
* You can copy the entire contents of ./appdata/space-engineers/config to make a backup, including the SpaceEngineers-Dedicated.cfg file.
* The ```./start``` script will start the server using docker-compose in detached mode, and then attaches to the log output. You can press <kbd>ctrl</kbd>+<kbd>c</kbd> to detach from the logs and keep the server running.
* If you are running plugins, the first time your run this, check your SpaceEngineers-Dedicated.cfg file for the Plugins element. If it spans multiple lines, you must replace it with ```<Plugins />```, exactly like that. The server will query ./appdata/space-engineers/config/Plugins and update the config file as needed from then on.

## Usage:

### -RECOMENDED- Pull from dockerhub and run with docker-compose

* Clone this repo with ```git clone https://github.com/mmmaxwwwell/space-engineers-dedicated-docker-linux.git```.
* Change directory into the cloned repo with ```cd space-engineers-dedicated-docker-linux```.
* Run the start script with ```./start```. This will initialize the ./appdata folder, unzip an empty star system from star-system.zip and start the server.

### Pull and run from dockerhub without docker-compose:
From this directory run :

``` 
docker run --restart always -p "27016:27016/udp" \
  -v $(pwd)/appdata/space-engineers/config/World:/appdata/space-engineers/World\
  -v $(pwd)/appdata/space-engineers/bins/SpaceEngineersDedicated:/appdata/space-engineers/SpaceEngineersDedicated\
  -v $(pwd)/appdata/space-engineers/bins/steamcmd:/home/se/.steam\
  -v $(pwd)/appdata/space-engineers/config/SpaceEngineers-Dedicated.cfg:/appdata/space-engineers/SpaceEngineersDedicated/SpaceEngineers-Dedicated.cfg\
  mmmaxwwwell/space-engineers-dedicated-docker-linux:latest 
```

## Exit Codes:
| Exit Code | Reason |
| - | - |
| 129 | Container is missing /appdata/space-engineers/World folder, volume mounts are mounted incorrectly. |
| 130 | Container is missing /appdata/space-engineers/World/Sandbox.sbc, World is not placed in the right folder, or the volume mounts are mounted incorrectly. Ensure your world is in ```./appdata/space-engineers/config/World/```.|
| 131 | Container is missing the dedicated server config file SpaceEngineers-Dedicated.cfg. Ensure that you have placed SpaceEngineers-Dedicated.cfg at ```./appdata/space-engineers/config/SpaceEngineers-Dedicated.cfg```. |

## Directory Structure:
```
SpaceEngineersDedicated contains the dedicated server files
steamcmd contains steamcmd
config contains all the user configurable files for the game instance
World contains the world files

appdata
└── space-engineers
    ├── bins
    │   ├── SpaceEngineersDedicated 
    │   └── steamcmd 
    └── config 
        ├── SpaceEngineers-Dedicated.cfg
        └── World
            ├── Alien-291759539d120000.vx2
            ├── EarthLike-1779144428d120000.vx2
            ├── Europa-595048092d19000.vx2
            ├── Mars-2044023682d120000.vx2
            ├── Moon-1353915701d19000.vx2
            ├── SANDBOX_0_0_0_.sbs
            ├── Sandbox.sbc
            ├── Sandbox_config.sbc
            ├── Titan-2124704365d19000.vx2
            ├── Triton-12345d80253.vx2
            └── thumb.jpg

```