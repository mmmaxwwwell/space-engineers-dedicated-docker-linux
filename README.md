# [mmmaxwwwell/space-engineers-dedicated-docker-linux](https://github.com/mmmaxwwwell/space-engineers-dedicated-docker-linux)
All of the space engineers dedicated server on wine containers I found wouldn't build, and I embarked on a journey to create my own.

## Features:
* Wine 6
* Debian Buster
* Includes default star system world
* 

Thank you to:
* [7thCore](https://github.com/7thCore) for [7thCore/sesrv-script](https://github.com/7thCore/sesrv-script)
* [Devidian](https://github.com/Devidian) for advancing the docker implementation to a working state!
* @Tsu, @Aedis, @ebbit, @data, @ReAn, @BloodyIron, @Inflex, @spawnAjak
* If I missed, you - I'm sorry! Message me or open an issue and I'll fix it.

## Prerequisites:
* docker
* docker-compose (recommended, not required to run [Pull and run from dockerhub](#pull-and-run-from-dockerhub)

## Tips:
* You can copy the entire contents of ./appdata/space-engineers/config to make a backup, including the SpaceEngineers-Dedicated.cfg file
* The ```./start``` script will start the server using docker-compose in detached mode, and then attach to the log output. You can press <kbd>ctrl</kbd>+<kbd>c</kbd> to detach from the logs and keep the server running.

## Usage:

### -RECOMENDED- Pull from dockerhub and run with docker-compose

* Clone this repo with ```git clone https://github.com/mmmaxwwwell/space-engineers-dedicated-docker-linux.git```.
* Change directory into the cloned repo with ```cd space-engineers-dedicated-docker-linux```.
* Run the start script with ```./start```. This will initalize the ./appdata folder, unzip an empty star system from star-system.zip and start the server.

### Pull and run from dockerhub without docker-compose:
```docker run mmmaxwwwell/space-engineers-dedicated-docker-linux --restart always -v ./appdata/space-engineers/config/World:/appdata/space-engineers/config/World -v ./appdata/space-engineers/bins/SpaceEngineersDedicated:/appdata/space-engineers/bins/SpaceEngineersDedicated -v ./appdata/space-engineers/bins/steamcmd:/home/se/.steam -v ./appdata/space-engineers/config/SpaceEngineers-Dedicated.cfg:/appdata/space-engineers/bins/SpaceEngineersDedicated/SpaceEngineers-Dedicated.cfg -p "27016:27016/udp"```

### Build and run with docker-compose:
* Clone this repo
* Comment out ```image: mmmaxwwwell/space-engineers-dedicated-docker-linux:latest``` in docker-compose.yml
* Uncomment ```build: .``` in docker-compose.yml
* Run ```sudo docker-compose build && sudo docker-compose up```

