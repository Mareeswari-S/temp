FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --legacy-peer-deps

# Copy source files
COPY . .

# Set environment variables
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0

# Expose the port
EXPOSE 5678

# Start n8n
CMD ["npm", "run", "start"]
