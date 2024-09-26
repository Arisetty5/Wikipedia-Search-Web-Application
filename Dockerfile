# Use Nginx as the base image
FROM nginx:alpine

# Copy the application files into the Nginx server directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80