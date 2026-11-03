#/bin/sh
# @file autostart.sh
# @author Cody Sork <codysork@gmail.com>
# @created 2026-10-18
# @modified 2026-11-03
# @description This script is run when dwm starts up.

#------------------------------------------------------------------------------
# dwmblocks
#------------------------------------------------------------------------------

if [ $(pgrep dwmblocks) ]; then
    echo "[INFO] dwmblocks is already running."
else
    echo "[INFO] Starting dwmblocks..."
    exec dwmblocks &
fi

#-----------------------------------------------------------------------------
# Conky
#-----------------------------------------------------------------------------

if [ $(pgrep conky) ]; then
    echo "[INFO] conky is already running."
else
    echo "[INFO] Starting conky..."
    exec conky -c ~/.config/conky/conky-top-left.conf &
    exec conky -c ~/.config/conky/conky-bottom-left.conf &
    exec conky -c ~/.config/conky/conky-right.conf &
fi

#-----------------------------------------------------------------------------
# Maintenance Reminder
#-----------------------------------------------------------------------------

if [ $(pgrep maintenance-reminder) ]; then
    echo "[INFO] maintenance-reminder is already running."
else
    echo "[INFO] Starting maintenance-reminder..."
    exec maintenance-reminder.sh &
fi
