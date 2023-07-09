#!/bin/bash

# Add Universe repository
sudo add-apt-repository universe

# Update package lists
sudo apt update

# Upgrade installed packages
sudo apt upgrade -y

# Install Certbot
sudo apt install certbot -y

# Install required dependencies for HTML to PDF conversion
sudo apt-get install -y ca-certificates fontconfig libc6 libfreetype6 libjpeg62 libpng16-16 libssl1.1 libstdc++6 libx11-6 libxcb1 libxext6 libxrender1 xfonts-75dpi xfonts-base zlib1g

# Install OpenJDK 11
sudo apt install openjdk-11-jre-headless -y

# Install MariaDB 10.3
sudo apt install mariadb-server mariadb-client libmariadb-java -y

# Secure MariaDB installation
sudo mysql_secure_installation

# Install Tomcat 9
sudo apt install tomcat9 -y

# Install additional tools
sudo apt install unzip curl pgpgpg ufw -y

# Download OSCAR 19 deb package
wget "http://sourceforge.net/projects/oscarmcmaster/files/Oscar%20Debian%2BUbuntu%20deb%20Package/oscar_emr19-49~1508.deb"

# Install OSCAR 19
sudo dpkg -i oscar_emr19-49~1508.deb

# Display README file
less /usr/share/oscar-emr/README.txt

# Install Cloudflare CLI tool
sudo curl -L https://github.com/cloudflare/cloudflare-go/releases/latest/download/cloudflare-go-Linux-amd64.tgz | sudo tar xz -C /usr/local/bin

# Add domain to Cloudflare
read -p "Enter your Cloudflare email: " cloudflare_email
read -p "Enter your Cloudflare API key: " cloudflare_api_key
read -p "Enter your domain name: " domain_name

cloudflare-go -email "$cloudflare_email" -key "$cloudflare_api_key" -action zone_create -name "$domain_name" -jump_start true

echo "OSCAR 19 installation complete!"
