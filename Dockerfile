# Use the official Nginx image
FROM nginx

# Copy the index.html file to the Nginx web root directory
COPY index.html /usr/share/nginx/html/index.html