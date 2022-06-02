#!/bin/sh
# Static paths
SERVER_DIR=/home/steam/Steam/steamapps/common/VRisingDedicatedServer
SETTINGS_DIR=$SERVER_DIR/VRisingServer_Data/StreamingAssets/Settings


# Functions
Set_Game_Settings() {
    if [ ! -f "/saves/Settings/ServerGameSettings.json" ]; then
        if [ -f "/var/settings/ServerGameSettings.json" ]; then
            cp /var/settings/ServerGameSettings.json /saves/Settings/ServerGameSettings.json
        fi
    fi
}


Set_Host_Settings() {
    if [ ! -f "/saves/Settings/ServerHostSettings.json" ]; then
        if [ -f "/var/settings/ServerHostSettings.json" ]; then
            cp /var/settings/ServerHostSettings.json /saves/Settings/ServerHostSettings.json
            Set_Game_Settings
        fi
    fi
}


./steamcmd.sh +@sSteamCmdForcePlatformType windows +login anonymous +app_update 1829350 validate +quit


Set_Game_Settings
Set_Host_Settings


cd $SERVER_DIR
Xvfb :0 -screen 0 1024x768x16 & DISPLAY=:0.0 wine VRisingServer.exe -persistentDataPath Z:\\saves