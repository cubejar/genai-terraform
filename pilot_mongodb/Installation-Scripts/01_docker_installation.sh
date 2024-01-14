#!/bin/bash

# Function to detect the operating system
get_os() {
    if [ -f "/etc/os-release" ]; then
        os=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')
        echo "$os"
    else
        echo "Unsupported OS"
        exit 1
    fi
}

# Function to install Docker on Linux
install_docker_linux() {
    if [ "$os_type" == "Amazon Linux" ]; then
        sudo yum update -y
        sudo amazon-linux-extras install docker -y
        sudo systemctl start docker
        sudo systemctl enable docker
        sudo usermod -aG docker $USER
    elif [ "$os_type" == "Ubuntu" ]; then
        sudo apt-get update
        sudo apt-get install docker.io -y
        sudo systemctl start docker
        sudo systemctl enable docker
        sudo usermod -aG docker $USER
    else
        echo "Unsupported Linux distribution"
        exit 1
    fi
}

# Function to install Docker on MacOS
install_docker_macos() {
    if [ "$(command -v brew)" ]; then
        brew install --cask docker
    else
        echo "Homebrew not installed. Please install Homebrew: https://brew.sh/"
        exit 1
    fi
}

# Function to install Docker on Windows
install_docker_windows() {
    echo "Please download and install Docker Desktop for Windows from: https://www.docker.com/products/docker-desktop"
    exit 1
}

# Main script

os_type=$(get_os)

case "$os_type" in
    "Amazon Linux")
        echo "Installing Docker on Amazon Linux..."
        install_docker_linux
        ;;
    "Ubuntu")
        echo "Installing Docker on Ubuntu..."
        install_docker_linux
        ;;
    "macos")
        echo "Installing Docker on MacOS..."
        install_docker_macos
        ;;
    "windows")
        echo "Installing Docker on Windows..."
        install_docker_windows
        ;;
    *)
        echo "Unsupported OS: $os_type"
        exit 1
        ;;
esac

echo "Docker has been installed successfully."
