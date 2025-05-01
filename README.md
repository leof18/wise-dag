# WISE-DAG at HPI
**WISE DAG** is a web application that helps researchers build, visualize, and analyze causal diagrams (DAGs) for stroke research. This application is deployed on a VM hosted at HPI.

## Features
- Access both frontend and backend through a single platform.
- Define research questions with exposure and outcome variables.
- Configure timepoints and node orders.
- Run backend analysis to detect cycles and generate DAG inputs.
- Generate DAGitty graphs and visualize causal relationships.

## Tech Stack
- **Frontend:** React, Tailwind CSS
- **Backend:** Node.js, Express, Neo4j
- **Other:** Docker (optional)

## Setup Instructions
### Prerequisites
- Node.js ≥ 14
- npm ≥ 6
- Neo4j running (with correct credentials)
- R installed
- [Optional] Docker installed

### 1️⃣ Clone the repository
bash
git clone https://github.com/leof18/wise-dag.git

### 2️⃣ Setup the backend
cd wise-dag/Application/wise-dag-backend  
npm install # for the first time setup  
node server.js

### 3️⃣ Setup the frontend
cd ../wise-dag-app  
npm install # for the first time setup  
npm start   # for development  

#### Environment Variables
Create a .env file in the frontend:  
REACT_APP_WEB_API_URL=http://172.18.132.31:3000

### Deployment
Use screen or tmux to keep the app running on a VM.

#### For backend server
cd WISE/Application/wise-dag-backend  
node server.js --local  
screen -S WISE

press control + a + d # detach the screen  
screen -r WISE # reattach the screen  
#### For frontend server
cd WISE/Application/wise-dag-app  
npm start  
screen -S WISE-FRONT

press control + a + d # detach the screen  
screen -r WISE-FRONT # reattach the screen  

Now the web app is running in the background

## To access the web application:
http://172.18.132.31:3001/

## Acknowledgments
DAGitty by Johannes Textor

## Contact
stefan.konigorski@hpi.de
