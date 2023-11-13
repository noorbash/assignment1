# Use a minimal base image with the latest LTS version of Node.js
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install only production dependencies to reduce the attack surface
RUN npm install --production

# Copy the application code into the container
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Create a volume mount point for the application code
VOLUME ["/usr/src/app"]

# Run the application using a non-root user
RUN addgroup -g 1001 -S nodejs && \
    adduser -u 1001 -S nodejs -G nodejs
USER nodejs

# Set environment variables for production
ENV NODE_ENV=production

# Start the application
CMD ["node", "app.js"]
