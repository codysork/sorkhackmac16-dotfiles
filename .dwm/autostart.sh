#/bin/sh
# @file autostart.sh
# @author Cody Sork <codysork@gmail.com>
# @created 2026-10-18
# @modified 2026-10-18
# @description This script is run when dwm starts up.

exec dwmblocks &
exec sudo update-reminder.sh &
