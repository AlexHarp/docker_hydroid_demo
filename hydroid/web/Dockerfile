FROM httpd:2.4

RUN apt-get update

#VOLUME /root/.m2

# Install node, npm, brower and grunt
RUN     apt-get install -y nodejs npm
RUN     npm install -g bower
RUN     npm install -g grunt-cli

# Hydroid Client
RUN ["mkdir", "-p", "/tmp/hydroid-client"]
ADD "src" "/tmp/hydroid-client"
WORKDIR "/tmp/hydroid-client/node_modules/bin"
RUN ["grunt", "build"]
WORKDIR "/tmp/hydroid-client/build"
zip -r ../../release/hydroid.zip *
RUN ["cp", "-r", "webapps/*", "/usr/local/apache2/htdocs/"]

# Configuration
COPY config/httpd.conf /usr/local/apache2/conf/httpd.conf

# Exposed port 80
EXPOSE 80

# Expose Apache Document root
VOLUME ["/url/local/apache2/htdocs"]

#CMD ["apachectl", "start"]
