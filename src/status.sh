#!/usr/bin/env bash

PATH=$PATH:/usr/local/bin
use_sudo=false

print_result ()
{
    local status=$1
    local desc=$2
    local icon=$3

    cat <<EOF
<?xml version="1.0"?>
<items>
  <item valid="no">
    <title>Vagrant Status: $status</title>
    <subtitle>$desc</subtitle>
    <icon>$icon</icon>
  </item>
</items>
EOF

    exit 0
}

running_result ()
{

    local status="Running"
    local desc="The machine is running."
    local icon="icons/running.png"

    print_result "$status" "$desc" "$icon"
}

stopped_result ()
{

    local status="Stopped"
    local desc="The machine is stopped."
    local icon="icons/stopped.png"

    print_result "$status" "$desc" "$icon"
}

error_result ()
{

    local status="Error"
    local desc="An error occured. Did you run 'vg configure' correctly?"
    local icon="icons/error.png"

    print_result "$status" "$desc" "$icon"
}

unconfigured_result ()
{

    local status="Unconfigured"
    local desc="Vagrant Control is not configured. Please run 'vg configure'."
    local icon="icons/unconfigured.png"

    print_result "$status" "$desc" "$icon"
}

vagrant_status ()
{
    cd "$vagrant_path"

    if $1; then
        sudo vagrant status --machine-readable
    else
        vagrant status --machine-readable
    fi
}

if [ ! -f "vagrant_path" ]; then
    unconfigured_result
fi

read vagrant_path < vagrant_path

if [ ! -d "$vagrant_path" ]; then
    error_result
fi

while IFS=, read -r _ _ msg_type value _; do
    case $msg_type in
        "error-exit")
            error_result
            ;;
        "state")
            if [[ $value == "running" ]]; then
                running_result
            else
                stopped_result
            fi
        ;;
    esac
done < <(vagrant_status "$use_sudo")

error_result
