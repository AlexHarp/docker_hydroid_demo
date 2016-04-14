FROM     httpd:2.4

RUN      apt-get update

WORKDIR  /

#VOLUME   /root/.m2

# Install node, npm, bower and grunt
RUN      apt-get update && apt-get install -y nodejs npm
RUN      npm install -g bower
RUN      npm install -g grunt-cli
RUN      ln -s /usr/bin/nodejs /usr/bin/node

# Hydroid Client

RUN      ["mkdir", "-p", "/tmp/hydroid-client"]
RUN      ls -l src
COPY      src /tmp/hydroid-client/
WORKDIR  /tmp/hydroid-client/src

RUN      pwd
RUN      ls -l

RUN      grunt build
WORKDIR  /tmp/hydroid-client/src/build
RUN      ["cp", "-r", "webapps/*", "/usr/local/apache2/htdocs/"]

# Configuration
COPY     config/httpd.conf /usr/local/apache2/conf/httpd.conf

# Exposed port 80
EXPOSE   80

# Expose Apache Document root
#VOLUME   ["/url/local/apache2/htdocs"]

#CMD      ["apachectl", "start"]
