# Use Rocker R base image with Node.js installed
FROM rocker/r-ver:latest

# Install Node.js and system dependencies
RUN apt-get update && apt-get install -y \
    nodejs npm \
    libcurl4-openssl-dev \
    libv8-dev \
    && rm -rf /var/lib/apt/lists/*


# Install R packages globally
RUN Rscript -e "install.packages(c('Rcpp', 'curl', 'dplyr', 'V8', 'dagitty'), repos='http://cran.us.r-project.org'); \
                 cat('✅ R packages installed successfully! 🎉\n')"


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
