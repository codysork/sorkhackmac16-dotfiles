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
    exec dwmblocks &
fi

# System maintenance scripts
if [[ $(system-maintenance-check.sh) -eq 0 ]]; then
    exec check-failed-services.sh
    exec sudo update-reminder.sh
fi
