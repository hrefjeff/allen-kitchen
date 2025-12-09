# Use a lightweight Nginx web server
FROM nginx:alpine

# Copy our website files to the Nginx public folder
COPY . /usr/share/nginx/html

# Expose port 80 (Standard web port)
EXPOSE 80
