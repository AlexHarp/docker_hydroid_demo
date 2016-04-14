FROM     httpd:2.4

# Install node, npm, bower and grunt
RUN      apt-get update && apt-get install -y nodejs npm
RUN      npm install -g bower
RUN      npm install -g grunt-cli
RUN      ln -s /usr/bin/nodejs /usr/bin/node

# Hydroid Client (Source and Config)
RUN      mkdir -p /tmp/hydroid-client
COPY     src /tmp/hydroid-client
COPY     config/httpd.conf /usr/local/apache2/conf/httpd.conf
WORKDIR  /tmp/hydroid-client

# Build Hydroid Client
RUN      npm install
RUN      grunt build
WORKDIR  /tmp/hydroid-client/build
RUN      cp -r webapp/* /usr/local/apache2/htdocs
