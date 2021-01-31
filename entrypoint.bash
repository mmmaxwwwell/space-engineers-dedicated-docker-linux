#!/bin/bash

# #check if /appdata/space-engineers/config/World is a folder
if [ ! -d "/appdata/space-engineers/World" ]; then
  echo "World folder does not exist, exiting"
  exit 129
fi

# #check if /appdata/space-engineers/config/World/Sandbox.sbc exists and is a file
if [ ! -f "/appdata/space-engineers/World/Sandbox.sbc" ]; then
  echo "Sandbox.sbc file does not exist, exiting."
  exit 130
fi

# #check if /appdata/space-engineers/config/SpaceEngineers-Dedicated.cfg is a file
if [ ! -f "/appdata/space-engineers/SpaceEngineersDedicated/SpaceEngineers-Dedicated.cfg" ]; then
  echo "SpaceEngineers-Dedicated.cfg file does not exist, exiting."
  exit 131
fi

#set <LoadWorld> to the correct value
cat /appdata/space-engineers/SpaceEngineersDedicated/SpaceEngineers-Dedicated.cfg | sed -E '/.*LoadWorld.*/c\  <LoadWorld>Z:\\appdata\\space-engineers\\World</LoadWorld>' > /tmp/SpaceEngineers-Dedicated.cfg && cat /tmp/SpaceEngineers-Dedicated.cfg > /appdata/space-engineers/SpaceEngineersDedicated/SpaceEngineers-Dedicated.cfg

#set game port to the correct value
#cat /appdata/space-engineers/SpaceEngineersDedicated/SpaceEngineers-Dedicated.cfg | sed -E '/.*ServerPort.*/c\  <ServerPort>27016</ServerPort>' > /tmp/SpaceEngineers-Dedicated.cfg && cat /tmp/SpaceEngineers-Dedicated.cfg > /appdata/space-engineers/SpaceEngineersDedicated/SpaceEngineers-Dedicated.cfg

exit 0
runuser -l se bash -c 'steamcmd +login anonymous +@sSteamCmdForcePlatformType windows +force_install_dir /appdata/space-engineers/SpaceEngineersDedicated +app_update 298740 +quit'
runuser -l se bash -c '/entrypoint-space_engineers.bash'