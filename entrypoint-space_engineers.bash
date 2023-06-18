#!/bin/bash
source ~/.profile
source ~/.bash_profile
cd /appdata/space-engineers/SpaceEngineersDedicated/DedicatedServer64/
echo "Starting Server.."
env WINEARCH=win64 WINEDEBUG=-all WINEPREFIX=/wineprefix wine /appdata/space-engineers/SpaceEngineersDedicated/DedicatedServer64/SpaceEngineersDedicated.exe -noconsole -path Z:\\appdata\\space-engineers\\SpaceEngineersDedicated -ignorelastsession
echo "Exiting Server Process.."
