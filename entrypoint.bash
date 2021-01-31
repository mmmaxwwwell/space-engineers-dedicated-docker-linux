#!/bin/bash

#check if /appdata/space-engineers/config/World is a folder
[[ -d /appdata/space-engineers/World ]] || echo "World folder does not exist, exiting" && exit 0
#check if /appdata/space-engineers/config/World/Sandbox.sbc exists and is a file
[[ -f /appdata/space-engineers/World/Sandbox.sbc ]] || echo "World file Sandbox.sbc does not exist, exiting" && exit 0
#check if /appdata/space-engineers/config/SpaceEngineers-Dedicated.cfg is a file
[[ -f /appdata/space-engineers/SpaceEngineers-Dedicated.cfg ]] || echo "SpaceEngineers-Dedicated.cfg does not exist, exiting" && exit 0

# #set <LoadWorld> to the correct value
sed -i '/.*<LoadWorld>.*/  <LoadWorld>Z:\appdata\space-engineers\World</LoadWorld>' /tmp/foo

# #set game port to the correct value
sed -i '/.*<ServerPort>.*/  <ServerPort>27016</ServerPort>' /tmp/foo
  
runuser -l se bash -c 'steamcmd +login anonymous +@sSteamCmdForcePlatformType windows +force_install_dir /appdata/space-engineers/SpaceEngineersDedicated +app_update 298740 +quit'
runuser -l se bash -c '/entrypoint-space_engineers.bash'