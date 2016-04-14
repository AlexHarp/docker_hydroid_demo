FROM     httpd:2.4

# Install node, npm, bower and grunt
RUN      apt-get update && apt-get install -y nodejs npm
RUN      npm install -g bower
RUN      npm install -g grunt-cli
RUN      ln -s /usr/bin/nodejs /usr/bin/node

# Hydroid Client
RUN      mkdir -p /tmp/hydroid-client
COPY     src /tmp/hydroid-client
WORKDIR  /tmp/hydroid-client

RUN      ls -l

RUN      grunt build
WORKDIR  /tmp/hydroid-client/build
COPY     webapps /usr/local/apache2/htdocs

# Configuration
#COPY     config/httpd.conf /usr/local/apache2/conf/httpd.conf

# Restart Apache
#CMD      ["apachectl", "start"]
