#!/bin/bash
/usr/games/steamcmd +login anonymous +force_install_dir /appdata/space-engineers/SpaceEngineersDedicated +app_update 298740 +quit || exit 0 
runuser space_engineers -c /entrypoint-space_engineers.bash