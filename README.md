# [mmmaxwwwell/space-engineers-dedicated-docker-linux](https://github.com/mmmaxwwwell/space-engineers-dedicated-docker-linux)
All of the space engineers dedicated server on wine containers I found wouldn't build, and I embarked on a journey to create my own. 

Turns out wine broke a few months back, and we couldn't winetricks dotnet48 or vcrun2013/2017 in some instances. The solution was to use wine-staging 5.16, install what it could, downgrade to wine-staging 5.9, and then install what was missing. This won't be necessary forever, just until wine releases a fixed build. I can't thank everyone enough for continuing to humor my many, somewhat futile attempts.

I got a LOT of help from the generous folks in [Keen's discord](https://discord.com/invite/keenswh) #linux channel. And when I say 'help', I mean they basically did everything.

Thank you to:
* [7thCore](https://github.com/7thCore) for [7thCore/sesrv-script](https://github.com/7thCore/sesrv-script)
* [Devidian](https://github.com/Devidian) for advancing the docker implementation to a working state!
* [Lazalatin](https://github.com/Lazalatin) for [Lazalatin/space-engineers-dedicated-ubuntu-docker-server](https://github.com/Lazalatin/space-engineers-dedicated-ubuntu-docker-server)
* @Tsu, @Aedis, @ebbit, @data, @ReAn, @BloodyIron, @Inflex, @spawnAjak
* If I missed, you - I'm sorry! Message me or open an issue and I'll fix it.

## Prerequisites:
* docker
* docker-compose (recommended, not required to run [Pull and run from dockerhub](#pull-and-run-from-dockerhub)
* you have a space engineers world in /appdata/space-engineers/World on your host machine
* you have valid dedicated server config at /appdata/space-engineers/SpaceEngineers-Dedicated.cfg
* the user running docker has full read/write permissions in:
  *  /appdata/space-engineers/SpaceEngineers-Dedicated.cfg
  *  /appdata/space-engineers/World
  *  /appdata/space-engineers/steamcmd
  *  /appdata/space-engineers/SpaceEngineersDedicated
* host machine port 27016 available for binding
* ~8gb ram free
* SpaceEngineers-Dedicated.cfg's \<LoadWorld\> tag should have " Z:\appdata\space-engineers\World" in it

## Usage:
### Pull and run from dockerhub:
```docker run mmmaxwwwell/space-engineers-dedicated-docker-linux --restart always -v /appdata/space-engineers/World:/appdata/space-engineers/World -v /appdata/space-engineers/SpaceEngineersDedicated:/appdata/space-engineers/SpaceEngineersDedicated -v /appdata/space-engineers/steamcmd:/root/.steam -v /appdata/space-engineers/SpaceEngineers-Dedicated.cfg:/appdata/space-engineers/SpaceEngineersDedicated/SpaceEngineers-Dedicated.cfg -p "27016:27016/udp"```
