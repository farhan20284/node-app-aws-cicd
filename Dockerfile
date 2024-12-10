# Base Image
FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package.json .
RUN npm install

# Copy application source code
COPY . .

# Run tests
RUN npm test

# Expose Port and Start App
EXPOSE 3000
CMD ["npm", "start"]
