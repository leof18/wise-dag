# Steps to run the server on your local computor

# download and install node.js
https://nodejs.org/en

# go to the project directory
## e.g., cd wise-dag\Application\wise-dag-backend
cd path/to/your/project

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
## e.g., cd wise-dag\Application\wise-dag-app
cd path/to/your/project

# install required dependencies (modules) in the frontend directory
npm install

# To access the server
npm start

# Test account
## We retired account functionality in the current version
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
