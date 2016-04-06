FROM java:openjdk-8-jdk
FROM tomcat:8-jre8

ENV MAVEN_VERSION 3.3.3

RUN mkdir -p /usr/share/maven \
  && curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    | tar -xzC /usr/share/maven --strip-components=1 \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

VOLUME /root/.m2

RUN ["mkdir","-p","/tmp/hydroid-api;"]
ADD "src" "/tmp/hydroid-api"
ADD "config/application.properties" "/tmp/hydroid-api/src/main/resources/application.properties"
WORKDIR "/tmp/hydroid-api"
RUN ["mvn","clean","package"]
RUN ["cp","/tmp/hydroid-api/target/hydroid.war","/usr/local/tomcat/webapps/"]

EXPOSE 8080

CMD ["catalina.sh", "run"]
