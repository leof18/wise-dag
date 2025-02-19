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
## This file is in the application branch (currently not in the main branch)
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
username: testuser
password: password123