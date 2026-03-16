# Vulnerable base image (old version)
FROM node:12

# Running as root (security risk)
USER root

# Install packages without version pinning
RUN apt-get update && apt-get install -y \
    curl \
    vim \
    git

# Copy application files
COPY . /app

WORKDIR /app

# Install dependencies without security checks
RUN npm install

# Expose port
EXPOSE 3000

# Start application
CMD ["node", "app.js"]
