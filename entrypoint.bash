#!/bin/bash
/usr/games/steamcmd +login anonymous +@sSteamCmdForcePlatformType windows +force_install_dir /appdata/space-engineers/SpaceEngineersDedicated +app_update 298740 +quit
chown -R space_engineers /appdata
runuser space_engineers -c /entrypoint-space_engineers.bash