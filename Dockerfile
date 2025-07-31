FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install build tools and dependencies
RUN apt-get update && apt-get install -y python3 make g++ \
  && npm install --legacy-peer-deps \
  && apt-get remove --purge -y python3 make g++ \
  && apt-get autoremove -y

# Copy rest of the source files
COPY . .

# Set environment variables
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0

# Expose the port
EXPOSE 5678

# Start n8n
CMD ["npm", "run", "start"]

