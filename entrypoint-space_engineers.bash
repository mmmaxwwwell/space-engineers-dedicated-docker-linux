#!/bin/bash
source ~/.profile
source ~/.bash_profile
cd /appdata/space-engineers/SpaceEngineersDedicated/DedicatedServer64/
env WINEARCH=win64 WINEDEBUG=-all WINEPREFIX=/home/space_engineers/server wine /appdata/space-engineers/SpaceEngineersDedicated/DedicatedServer64/SpaceEngineersDedicated.exe -noconsole -path Z:\\appdata\\space-engineers\\SpaceEngineersDedicated -ignorelastsession