#!/bin/sh
# Deploys a simple Apache webpage with kittens as a service.

# cd /tmp
echo "setup start"
sudo apt-get -y update > /dev/null 2>&1
echo "apt-get -y update"
sudo apt install -y apache2 > /dev/null 2>&1
echo "apt install -y apache2"
sudo mkdir -p /var/www/html
echo "mkdir -p /var/www/html"
sudo cat << EOM > /var/www/html/index.html
<html>
  <head><title>AWS Meow!</title></head>
  <body style="background-image: linear-gradient(red,orange,yellow,green,blue,indigo,violet);">
  <center><img src="http://placekitten.com/800/600"></img></center>
  <marquee><h1>AWS Meow World</h1></marquee>
  </body>
</html>
EOM

echo "Your demo is now ready."