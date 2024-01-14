#!/bin/bash

# Function to detect the operating system
get_os() {
    if [ -f "/etc/os-release" ]; then
        os=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')
        echo "$os"
    elif [ "$(uname -s)" == "Darwin" ]; then
        echo "macos"
    elif [ "$(uname -s)" == "MINGW"* ]; then
        echo "windows"
    else
        echo "Unsupported OS"
        exit 1
    fi
}

# Function to uninstall MongoDB on MacOS
uninstall_mongodb_macos() {
    if [ "$(command -v brew)" ]; then
        brew uninstall mongodb/brew/mongodb-community
        brew services stop mongodb-community
        brew cleanup
    else
        echo "Homebrew not installed. Please install Homebrew: https://brew.sh/"
        exit 1
    fi
}

# Function to uninstall MongoDB on Amazon Linux
uninstall_mongodb_amazon_linux() {
    sudo yum erase -y mongodb-org
    sudo rm -r /var/log/mongodb
    sudo rm -r /var/lib/mongo
}

# Function to uninstall MongoDB on Ubuntu
uninstall_mongodb_ubuntu() {
    sudo apt-get purge -y mongodb-org*
    sudo apt-get autoremove -y
    sudo rm -r /var/log/mongodb
    sudo rm -r /var/lib/mongodb
}

# Function to uninstall MongoDB on Windows
uninstall_mongodb_windows() {
    echo "Please follow MongoDB's official documentation to uninstall MongoDB on Windows."
    echo "https://docs.mongodb.com/manual/tutorial/install-mongodb-on-windows-uninstall/"
    exit 1
}

# Main script

os_type=$(get_os)

case "$os_type" in
    "macos")
        echo "Uninstalling MongoDB on MacOS..."
        uninstall_mongodb_macos
        ;;
    "Amazon Linux")
        echo "Uninstalling MongoDB on Amazon Linux..."
        uninstall_mongodb_amazon_linux
        ;;
    "Ubuntu")
        echo "Uninstalling MongoDB on Ubuntu..."
        uninstall_mongodb_ubuntu
        ;;
    "windows")
        echo "Uninstalling MongoDB on Windows..."
        uninstall_mongodb_windows
        ;;
    *)
        echo "Unsupported OS: $os_type"
        exit 1
        ;;
esac

echo "MongoDB has been uninstalled successfully."

