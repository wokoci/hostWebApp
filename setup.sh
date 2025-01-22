#!/bin/bash

# Switch to the root user to gain full administrative privileges
sudo su

# Update all installed packages to their latest versions
yum update -y

# Install Apache HTTP Server
yum install -y httpd

# Change the current working directory to the Apache web root
cd /var/www/html

# Install Git
yum install git -y

# Clone the project GitHub repository to the current directory
git clone https://github.com/wokoci/hostWebApp.git

# Copy all files, including hidden ones, from the cloned repository to the Apache web root
cp -R hostWebApp/. /var/www/html/

# Remove the cloned repository directory to clean up unnecessary files
rm -rf hostWebApp

# Enable the Apache HTTP Server to start automatically at system boot
systemctl enable httpd 

# Start the Apache HTTP Server to serve web content
systemctl start httpd
