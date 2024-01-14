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

# Function to check if Docker is installed
check_docker_installed() {
    if ! command -v docker &> /dev/null; then
        echo "Docker is not installed. Please install Docker first."
        exit 1
    fi
}

# Function to add user to Docker group and restart Docker service
configure_docker_permissions() {
    os_type=$(get_os)

    case "$os_type" in
        "Amazon Linux" | "Ubuntu")
            sudo usermod -aG docker $USER
            sudo systemctl restart docker
            ;;
        "macos")
            sudo usermod -aG docker $USER
            brew services restart docker
            ;;
        "windows")
            echo "No additional steps needed for Docker permissions on Windows."
            ;;
        *)
            echo "Unsupported OS: $os_type"
            exit 1
            ;;
    esac
}

# Function to execute Docker commands
execute_docker_commands() {
    # Pull MongoDB Image
    docker pull mongo

    # Create MongoDB Credentials
    read -p "Enter MongoDB username: " mongo_user
    read -s -p "Enter MongoDB password: " mongo_password

    # Create MongoDB Container
    container_name="mongo_canister"

    docker run -d -p 27017:27017 \
        --name $container_name \
        -e MONGO_INITDB_ROOT_USERNAME=$mongo_user \
        -e MONGO_INITDB_ROOT_PASSWORD=$mongo_password \
        mongo

    # Verify 
    docker ps -a | grep $container_name
    if [ $? -ne 0 ]; then
        echo "MongoDB container '$container_name' is not running."
        exit 1
    fi

    echo "MongoDB container '$container_name' is running."
    echo "MongoDB setup completed successfully!"

    # Sleep for a while to keep the container running
    # echo "Sleeping for 10 minutes to keep the container running..."
    # sleep 600

    # Access MongoDB
    echo "Logging into the MongoDB container..."
    container_id=$(docker ps -aqf "name=$container_name")
    docker exec -it $container_name bash
}

# Main script

check_docker_installed
configure_docker_permissions

# Retry Docker commands after configuring permissions
execute_docker_commands

