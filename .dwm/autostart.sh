#/bin/sh
# @file autostart.sh
# @author Cody Sork <codysork@gmail.com>
# @created 2026-10-18
# @modified 2026-10-19
# @description This script is run when dwm starts up.

# Check if dwmblocks is already running
if [ $(pgrep dwmblocks) ]; then
    echo "[INFO] dwmblocks is already running."
else
    echo "[INFO] Starting dwmblocks..."
    exec dwmblocks
fi

# Conky
#-------
if [ $(pgrep conky) ]; then
    echo "[INFO] conky is already running."
else
    echo "[INFO] Starting conky..."
    conky -c ~/.config/conky/conky.conf &
fi

# System maintenance scripts
#----------------------------
if [[ $(sudo system-maintenance-check.sh) ]]; then
    
    # Run maintenance scripts here
    #------------------------------
    exec check-failed-services.sh
    exec sudo update-reminder.sh

else
    echo "[INFO] System maintenance checks failed."
fi

