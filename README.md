# [mmmaxwwwell/space-engineers-dedicated-docker-linux](https://github.com/mmmaxwwwell/space-engineers-dedicated-docker-linux)

## Features:
* Wine 8
* Debian Bullseye slim
* Automatically updates ```<LoadWorld>``` element in ```SpaceEngineers-Dedicated.cfg```
* Supports plugins.
* Image built and [available on dockerhub](https://hub.docker.com/r/mmmaxwwwell/space-engineers-dedicated-docker-linux)
* Easy to backup world data, just run ./backup, and a zip will be created in ./backup-data

Thank you to:
* [7thCore](https://github.com/7thCore) for [7thCore/sesrv-script](https://github.com/7thCore/sesrv-script)
* [Devidian](https://github.com/Devidian) for advancing the docker implementation to a working state!
* @Tsu, @Aedis, @ebbit, @data, @ReAn, @BloodyIron, @spawnAjak for all around helping when testing and getting this started
* [@UseAfterFreee](https://github.com/UseAfterFreee), [@woeisme](https:/github.com/woeisme), [@kennethx](https://github.com/kennethx), [@MarkL4YG](https://github.com/MarkL4YG), [@BaIthamel](https://github.com/BaIthamel), [@Tetrino](https://github.com/Tetrino), [@Teacay1](https://github.com/Teacay1), [@Fischchen](https://github.com/Fischchen), [@whodat](https://github.com/whodat), [@msansen](https://github.com/msansen), [@IndexOutOfMJ](https://github.com/IndexOutOfMJ) for opening issues or contributing to an issue conversation that improved the repo.

## Prerequisites:
* docker or podman
* docker-compose or podman-compose (recommended, not required to run container)
* unzip
* zip

## Tips:
* When migrating from v1 to v2, run the ./migrate script.
* If starting from scratch, use the ./setup script to create a default world. Then run ./start, and verify you can connect. Once the server comes up and you have verified you can connect, stop the server and run ./unpack. This will move all user configurable world files to the ./volumes folder. From there you can adjust any settings in the SpaceEngineers-Dedicated.cfg or replace the world files. Once complete, run ./pack to put the files back into the volume mounts so the server will pick up your world.
* The ```./start``` script will start the server using docker-compose in detached mode, and then attaches to the log output. You can press <kbd>ctrl</kbd>+<kbd>c</kbd> to detach from the logs and keep the server running.
* If you are running plugins, the first time your run this, check your SpaceEngineers-Dedicated.cfg file for the Plugins element. If it spans multiple lines, you must replace it with ```<Plugins />```, exactly like that. The server will automatially enumerate the plugins directory and update the config file as needed.

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
