FROM httpd:2.4

RUN apt-get update

#VOLUME /root/.m2

# Install node, npm, brower and grunt
RUN     apt-get install -y nodejs
RUN     apt-get install -y npm
RUN     npm install -g bower
RUN     npm install -g grunt-cli
RUN     ln -s /usr/bin/nodejs /usr/bin/node

# Hydroid Client

RUN pwd

RUN ["mkdir", "-p", "/tmp/hydroid-client"]
WORKDIR "hydroid"
RUN pwd
ADD "src" "/tmp/hydroid-client"
WORKDIR "/tmp/hydroid-client/src"

RUN pwd
RUN ls -l

RUN ["grunt", "build"]
WORKDIR "/tmp/hydroid-client/src/build"
RUN ["cp", "-r", "webapps/*", "/usr/local/apache2/htdocs/"]

# Configuration
COPY config/httpd.conf /usr/local/apache2/conf/httpd.conf

# Exposed port 80
EXPOSE 80

# Expose Apache Document root
VOLUME ["/url/local/apache2/htdocs"]

#CMD ["apachectl", "start"]
