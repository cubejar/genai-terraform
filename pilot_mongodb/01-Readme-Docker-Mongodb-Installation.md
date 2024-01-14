
### Docker-Mongo Installation and Setup ###

### This repository provides scripts for installing Docker and MongoDB as a Docker container. Follow the steps below to set up your environment.
### Installation Scripts are available under Installation-Scripts folder ###

### Step 1: Docker Installation ###
	If Docker is not installed on your system, run the following script:
	# Run Docker installation script
	sudo sh ./Installation-Scripts/01_docker_installation.sh

### Step 2: MongoDB Installation as Docker Container ### 
	Run the MongoDB installation script to set up MongoDB as a Docker container
	sudo sh ./Installation-Scripts/02_mongodb_installation.sh

### Step 3: How to upload a MongoDB Document? ### 
	Find the instructions for uploading a MongoDB document
	"02-Readme-mongodb-sample-document-upload.md"

### Step 4: Setup MongoDB Connection via VSCode ### 
	To establish a connection to MongoDB using Visual Studio Code. 
	Follow the instructions in "03-Readme-setup-mongodb-connection-vscode.md."

### Step 5: Uninstall Docker or MongoDB ### 
	If you need to uninstall Docker or MongoDB, use the uninstall scripts in the "Installation-Scripts" folder.
	For mongodb uninstallation,
	sudo sh ./Installation-Scripts/03_mongodb_uninstall.sh
	For docker uninstallation,
	sudo sh ./Installation-Scripts/04_docker_uninstall.sh
