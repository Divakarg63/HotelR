
FROM nginx:alpine

# Remove default nginx files
RUN rm -rf /usr/share/nginx/html/*

# Copy project files
COPY . /usr/share/nginx/html

# Expose nginx port
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
