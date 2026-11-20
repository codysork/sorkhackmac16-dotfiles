# @file: .profile
# @author: Cody Sork <codysork@gmail.com>
# @created: 2026-10-18
# @modfied: 2026-11-19
# @description: This file is executed by the shell when the user logs in.

export BROWSER=brave

[[ -r "$HOME/.secret/api_keys" ]] && source "$HOME/.secret/api_keys"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi

