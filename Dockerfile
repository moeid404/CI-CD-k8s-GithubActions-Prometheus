# Stage 1: Build Stage
FROM node:18 AS build

# Set working directory for build stage
WORKDIR /usr/src/app

# Copy package.json and package-lock.json for dependency installation
COPY ./src/package*.json ./

# Install dependencies (including dev dependencies for building, testing, etc.)
RUN npm install --production

# Copy the rest of the application code
COPY ./src .

# Stage 2: Production Stage
FROM node:18-slim

# Set working directory for production stage
WORKDIR /usr/src/app

# Copy only the necessary files from the build stage
COPY --from=build /usr/src/app /usr/src/app

# Clean up any unnecessary files (e.g., npm cache)
RUN npm cache clean --force

# Expose application port
EXPOSE 3000

# Command to run the app
CMD ["npm", "start"]
