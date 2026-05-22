# Use Node.js 18 as the base image - slim keeps it lightweight
FROM node:18-slim

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first
# This layer is cached - only re-runs if dependencies change
COPY package*.json ./

# Install dependencies inside the container
RUN npm install

# Copy the rest of the source code into the container
COPY . .

# Compile TypeScript to JavaScript into /dist
RUN npm run build

# Tell Docker this container listens on port 3000
EXPOSE 3000

# Start the app using the compiled JavaScript (not ts-node)
CMD ["node", "dist/index.js"]