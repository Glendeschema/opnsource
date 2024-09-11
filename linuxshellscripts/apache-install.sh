#!/bin/bash

# Exit on any error
set -e

# Update package list
echo "Updating package list..."
apt-get update

# Install Apache2
echo "Installing Apache2..."
apt-get install -y apache2

# Get the server hostname
HOSTNAME=$(hostname)

# Create a custom welcome page
echo "Creating custom welcome page..."
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to $HOSTNAME</title>
</head>
<body>
    <h1>Welcome to $HOSTNAME</h1>
    <p>This is the default welcome page for the Apache HTTP Server.</p>
</body>
</html>
EOF

# Set permissions to the web directory
chown www-data:www-data /var/www/html/index.html

# Restart Apache2 to apply changes
echo "Restarting Apache2..."
systemctl restart apache2

# Enable Apache2 to start on boot
echo "Enabling Apache2 to start on boot..."
systemctl enable apache2

echo "Apache2 installation and configuration complete. Visit the server IP or hostname in your browser to see the welcome page."
