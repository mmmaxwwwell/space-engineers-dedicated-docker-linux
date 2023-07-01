#!/bin/bash

# #check if /appdata/space-engineers/config/World is a folder
if [ ! -d "/appdata/space-engineers/World/World" ]; then
  echo "World folder does not exist, exiting"
  exit 129
fi

#check if /appdata/space-engineers/World/World/Sandbox.sbc exists and is a file
if [ ! -f "/appdata/space-engineers/World/World/Sandbox.sbc" ]; then
  echo "Sandbox.sbc file does not exist, exiting."
  exit 130
fi

#check if /appdata/space-engineers/config/SpaceEngineers-Dedicated.cfg is a file
if [ ! -f "/appdata/space-engineers/World/SpaceEngineers-Dedicated.cfg" ]; then
  echo "SpaceEngineers-Dedicated.cfg file does not exist, exiting."
  exit 131
else
  rm -rf /appdata/space-engineers/SpaceEngineersDedicated/SpaceEngineers-Dedicated.cfg
  cp /appdata/space-engineers/World/SpaceEngineers-Dedicated.cfg /appdata/space-engineers/SpaceEngineersDedicated/SpaceEngineers-Dedicated.cfg
fi

#set <LoadWorld> to the correct value
cat /appdata/space-engineers/SpaceEngineersDedicated/SpaceEngineers-Dedicated.cfg | sed -E '/.*LoadWorld.*/c\  <LoadWorld>Z:\\appdata\\space-engineers\\World\\World</LoadWorld>' > /tmp/SpaceEngineers-Dedicated.cfg && cat /tmp/SpaceEngineers-Dedicated.cfg > /appdata/space-engineers/SpaceEngineersDedicated/SpaceEngineers-Dedicated.cfg
chown -R 1000:1000 /appdata
runuser -l wine bash -c 'steamcmd +force_install_dir /appdata/space-engineers/SpaceEngineersDedicated +login anonymous +@sSteamCmdForcePlatformType windows +app_update 298740 +quit'
runuser -l wine bash -c '/entrypoint-space_engineers.bash'
