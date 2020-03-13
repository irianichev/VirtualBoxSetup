#!/usr/bin/env bash
VM="Sync4_Win10"
if ! VBoxManage list -s vms | grep "$VM"; then
        echo "$VM doesn't exists"
    else
        if VBoxManage unregistervm "$VM" --delete; then
            echo "$VM deleted."
        else
            echo "Error during $VM delete procedure"
        fi
    fi