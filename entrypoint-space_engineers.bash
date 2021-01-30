#!/bin/bash
source ~/.profile
source ~/.bash_profile
cd /appdata/space-engineers/bins/SpaceEngineersDedicated/DedicatedServer64/
env WINEARCH=win64 WINEDEBUG=-all WINEPREFIX=/wineprefix wine /appdata/space-engineers/bins/SpaceEngineersDedicated/DedicatedServer64/SpaceEngineersDedicated.exe -noconsole -path Z:\\appdata\\space-engineers\\bins\\SpaceEngineersDedicated -ignorelastsession