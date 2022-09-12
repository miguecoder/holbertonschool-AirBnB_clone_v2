#!/usr/bin/env bash
#Bash script that sets up your web servers for the deployment of web_static
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install nginx
sudo mkdir /data/web_static/releases/test/ /data/web_static/current
sudo touch /data/web_static/releases/test/index.html
echo "<html>
<head>
</head>
<body>
Holberton School
</body>
</html>" >> /data/web_static/releases/test/index.html
sudo ln -s /data/web_static/releases/test/ /data/web_static/current
chown -R ubuntu:ubuntu /data/
sudo sed -i '57i \tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default
sudo service nginx restart
