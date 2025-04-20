# Steps to run the server on your local computor

# download and install node.js
https://nodejs.org/en

# go to the project directory
## e.g., cd Application\wise-dag-backend
cd path/to/your/project
cd WISE/Application/wise-dag-backend

# npm is a package manager for Node.js
## It will install required dependencies (modules)

npm install

# run the server on a command panel
## This file (server.js) is in the main branch now
## To start the development mode, type "node server.js --local"
node server.js
## If you clone the repository from the Github, there could be dependency issue. Node.js might not be able to find modules
## Reinstall npm is the only solution. Reseting path doesn't work.
## Go the the upper directory by
cd..
## remove npm
rm -rf node_modules package-lock.json
## reinstall npm
npm install
## go to the wise-dag-backend directory and run the server again
node server.js








# Step to run the frontend on another command panel

# go to the project directory (wise-dag-app)
## e.g., cd Application\wise-dag-app
cd path/to/your/project
cd WISE/Application/wise-dag-app
# install required dependencies (modules) in the frontend directory
npm install

# To access the server
npm start

# Test account
username: testuser
password: password123








# How to run Docker
## Create a Dockerfile with instruction to build a docker image for the backend
cd Application/wise-dag-backend
## In a shell, type below code to create an image. t means tage. "." means everything in the current work directory
### docker build -t wise-r .
docker build -t name_of_image .
## To run a container from a built image, type below code
### Your server is running on http://0.0.0.0:3000, which means it is listening on port 3000 inside the container. You need to correctly map the internal port (3000) to an external port (3001) on your host machine.

### e.g., docker run --name con-wise-r -p 3001:3000 wise-r
docker run --name name_of_container -p 3001:3000 name_of_image

### to list all containers
docker ps -a
#### to list running containers
docker ps
### to stop a container
docker stop CONTAINER_NAME
### to remove a container
docker rm CONTAINER_NAME
### to remove a docker image
docker rmi image_name
#### to check image names
docker images

# API to be changed for production in Graphpage, ResearchPage, and Timepointpage

const API_URL =
  process.env.NODE_ENV === "development"
    ? "http://localhost:3001" // Change this to your local backend URL
    : process.env.REACT_APP_WEB_API_URL || "https://wise-r.onrender.com";

## in .env
REACT_APP_WEB_API_URL = http://localhost:3001

# To check if required R packages are correctly installed in the docker container
## This opens an interactive R session inside the Docker container.
## docker exec -it con-wise-r R
docker exec -it name_of_container R
## Once inside R, run:
installed.packages()

## or check for a specific package:
if ("curl" %in% installed.packages()) {
  print("curl is installed!")
} else {
  print("curl is missing!")
}


# HPI Server
Our web app address: http://172.18.132.31:80

# Steps to access our web app on VM
## Step 1 start the backend
### Go to the backend directory
cd WISE/Application/wise-dag-backend
### Start the backend server
node server.js --local

## Step 2 start the frontend
### Go to the frontend directory
cd WISE/Application/wise-dag-app
### Start the frontend
npm start
### If it prompt a message asking you to use another port, enter y

# VM configurations
•	OS: Ubuntu 24.04 LTS
•	RAM: 4GB
•	CPUs. 2
•	Storage: 40GB
•	IP: 172.18.132.31

# Docker settings
name of backend docker image: wise_dag_hpi
name of our web app: wise_dag_app
maps host port 3001 to container port 3000

# Ports
sudo ufw allow 3000
sudo ufw allow 3001
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable

# We need to install R on VM to test our web app locally on the VM
## Update your package list
sudo apt update
## Install R base packages
sudo apt install -y r-base
### Install additional R packages for solving the loop
#### In bash
sudo apt install libcurl4-openssl-dev
#### In R
install.packages("V8", repos = "http://cran.us.r-project.org")
install.packages("dagitty", repos = "http://cran.us.r-project.org")