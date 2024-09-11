#!/bin/bash

# Update package lists
sudo apt update

# Install NGINX
sudo apt install -y nginx

# Create a basic NGINX configuration with load balancing
cat <<EOF | sudo tee /etc/nginx/nginx.conf
user www-data;
worker_processes auto;
pid /run/nginx.pid;

events {
    worker_connections 1024;
}

http {
    log_format main '\$remote_addr - \$remote_user [\$time_local] "\$request" '
                      '\$status \$body_bytes_sent "\$http_referer" '
                      '"\$http_user_agent" "\$http_x_forwarded_for"';

    access_log /var/log/nginx/access.log main;
    error_log /var/log/nginx/error.log warn;

    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types {
        text/html html;
        text/css css;
        text/xml xml;
        image/gif gif;
        image/jpeg jpg;
        application/javascript js;
        application/atom+xml atom;
        application/rss+xml rss;
        application/x-font-ttf ttf;
        font/opentype otf;
        image/x-icon ico;
        image/svg+xml svg;
        application/x-font-woff woff;
        application/x-font-woff2 woff2;
    }

    server {
        listen 80;

        location / {
            proxy_pass http://load_balancer;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto \$scheme;
        }
    }

    upstream load_balancer {
        server 10.0.0.4;  # Replace with VM1's private IP
        server 10.0.0.5;  # Replace with VM2's private IP
        server 10.0.0.6;  # Replace with VM1's private IP
        server 10.0.0.7;  # Replace with VM2's private IP
        server 10.0.0.8;  # Replace with VM1's private IP
        server 10.0.0.9;  # Replace with VM2's private IP
    }
}
EOF

# Restart NGINX to apply changes
sudo systemctl restart nginx

# Ensure NGINX starts on boot
sudo systemctl enable nginx
