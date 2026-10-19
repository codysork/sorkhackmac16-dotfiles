# @file: .profile
# @author: Cody Sork <codysork@gmail.com>
# @created: 2026-10-18
# @modfied: 2026-10-18
# @description: This file is executed by the shell when the user logs in.

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi
