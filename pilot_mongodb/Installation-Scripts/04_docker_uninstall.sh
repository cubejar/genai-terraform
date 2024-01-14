#!/bin/bash

# Function to detect the operating system
get_os() {
    if [ "$(uname -s)" == "Linux" ]; then
        if [ -f "/etc/os-release" ]; then
            os=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')
            echo "$os"
        else
            echo "Unsupported OS"
            exit 1
        fi
    elif [ "$(uname -s)" == "Darwin" ]; then
        echo "macos"
    elif [ "$(uname -s)" == "MINGW"* ]; then
        echo "windows"
    else
        echo "Unsupported OS"
        exit 1
    fi
}

# Function to uninstall Docker on Linux
uninstall_docker_linux() {
    if [ "$os_type" == "Amazon Linux" ]; then
        sudo systemctl stop docker
        sudo yum remove docker -y
        sudo usermod -r -G docker $USER
    elif [ "$os_type" == "Ubuntu" ]; then
        sudo systemctl stop docker
        sudo apt-get remove --purge docker.io -y
        sudo usermod -r -G docker $USER
    else
        echo "Unsupported Linux distribution"
        exit 1
    fi
}

# Function to uninstall Docker on MacOS
uninstall_docker_macos() {
    if [ "$(command -v brew)" ]; then
        brew uninstall --force docker docker-compose docker-machine
        rm -rf /Applications/Docker.app
        rm -rf $HOME/Library/Containers/com.docker.docker
        rm -rf $HOME/Library/Group\ Containers/group.com.docker
    else
        echo "Homebrew not installed. Please install Homebrew: https://brew.sh/"
        exit 1
    fi
}

# Function to uninstall Docker on Windows
uninstall_docker_windows() {
    echo "Please manually uninstall Docker Desktop for Windows"
    exit 1
}

# Main script

os_type=$(get_os)

case "$os_type" in
    "Amazon Linux")
        echo "Uninstalling Docker on Amazon Linux..."
        uninstall_docker_linux
        ;;
    "Ubuntu")
        echo "Uninstalling Docker on Ubuntu..."
        uninstall_docker_linux
        ;;
    "macos")
        echo "Uninstalling Docker on MacOS..."
        uninstall_docker_macos
        ;;
    "windows")
        echo "Uninstalling Docker on Windows..."
        uninstall_docker_windows
        ;;
    *)
        echo "Unsupported OS: $os_type"
        exit 1
        ;;
esac

echo "Docker has been uninstalled successfully."


