#! /bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo service nginx start
sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
