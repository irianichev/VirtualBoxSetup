#!/usr/bin/env bash
memory="2048"
cpus="2"
VM="Sync4_Win10"

# if [ "$1" = "-d" ]; then
#     bash deleteWin10VM.sh -d
#     exit 0
# fi

while getopts ":d:m:c:" opt; do
    case $opt in
    d)
        bash deleteWin10VM.sh -d
        exit 0
        ;;
    m)
        memory="$OPTARG"
        ;;
    c)
        cpus="$OPTARG"
        ;;
    \?)
        echo "Invalid option -$OPTARG" >&2
        ;;
    esac
done

if VBoxManage list -s vms | grep "$VM"; then
    echo "$VM virtual machine already installed."
    VBoxManage modifyvm "$VM" --cpus "$cpus" --memory "$memory" --vram 12
    VBoxManage showvminfo "$VM"
else
    VBoxManage createvm --name "$VM" -ostype Windows10_64 --register
    VBoxManage modifyvm "$VM" --cpus "$cpus" --memory "$memory" --vram 12
    VBoxManage showvminfo "$VM"
fi
