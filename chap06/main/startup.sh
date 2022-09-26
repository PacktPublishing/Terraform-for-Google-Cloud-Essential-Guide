#! /bin/bash
set -euo pipefail
apt update
apt -y install nginx-light wget default-mysql-client

wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O /usr/bin/cloud_sql_proxy
chmod +x /usr/bin/cloud_sql_proxy

NAME=$(curl -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/name")
IP=$(curl -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/ip")
CONNECTION_NAME=$(gcloud secrets versions access latest --secret="connection-name" --format='get(payload.data)' | tr '_-' '/+' | base64 -d)

cat <<EOF > /var/www/html/index.html
<html>
   <body>
      <p>Hello World!</p>
      <p>The current version is: V1.0</>
      <p>My name is: $NAME</>
      <p>My internal IP is: $IP</p>
      <p>Copy the two lines of code, and paste into your SSH session to connect to the database.
      <pre>
<code>
cloud_sql_proxy -instances=$CONNECTION_NAME=tcp:3306  &
mysql -u user  --host 127.0.0.1 --port 3306 -p
</code>
</pre>
   </body>
</html>
