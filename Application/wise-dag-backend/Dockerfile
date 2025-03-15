# Use Rocker R base image with Node.js installed
FROM rocker/r-ver:latest

# Install Node.js
RUN apt-get update && apt-get install -y nodejs npm

# Install R packages globally
RUN Rscript -e "install.packages(c('Rcpp', 'curl', 'dplyr', 'V8', 'dagitty'), repos='http://cran.r-project.org')"


# Set working directory inside the container
WORKDIR /app

# Copy all files from the backend folder to the container
COPY . .

# Install Node.js dependencies
RUN npm install

# Expose port for Node.js
EXPOSE 3001

# Start the Node.js server
CMD ["node", "server.js"]
