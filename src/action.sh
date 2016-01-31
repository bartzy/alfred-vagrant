#!/usr/bin/env bash

PATH=$PATH:/usr/local/bin
use_sudo=false
action="$1"

vagrant_action ()
{
    local action=$1
    local use_sudo=$2

    if $use_sudo; then
        sudo vagrant "$action"
    else
        vagrant "$action"
    fi
}

[ -f "vagrant_path" ] && cd "$(cat vagrant_path)" || exit 1

if [[ $action != "up" && $action != "halt" && $action != "reload" ]]; then
    exit 1
fi

case $action in
    "up")
        vagrant_action up $use_sudo > /dev/null && echo "Started" || echo "Error Starting Vagrant"
        ;;
    "halt")
        vagrant_action halt $use_sudo > /dev/null && echo "Stopped" || echo "Error Stopping Vagrant"
        ;;
    "reload")
        vagrant_action reload $use_sudo > /dev/null && echo "Restarted" || echo "Error Reloading Vagrant"
        ;;
    *)
        exit 1
esac
