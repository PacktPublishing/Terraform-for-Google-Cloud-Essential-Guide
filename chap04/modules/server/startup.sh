#! /bin/bash
apt update
apt -y install apache2
cat <<EOF > /var/www/html/index.html
<html><body><p>Hello World!</p><p>This is version 1.0.0</p></body></html> 