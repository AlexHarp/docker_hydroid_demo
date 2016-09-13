FROM java:openjdk-8

EXPOSE 9090

# Maven
ENV MAVEN_VERSION 3.3.3

RUN mkdir -p /usr/share/maven \
  && curl -fsSL https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    | tar -xzC /usr/share/maven --strip-components=1 \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

VOLUME /root/.m2

# Hydroid app
RUN ["mkdir","-p","/tmp/hydroid-api"]
RUN ["mkdir","-p","/usr/local/hydroid"]
ADD "src" "/tmp/hydroid-api"
WORKDIR "/tmp/hydroid-api"
RUN ["mvn","clean","package"]
RUN ["cp","/tmp/hydroid-api/target/hydroid.jar","/usr/local/hydroid/hydroid.jar"]
ADD "config/application.properties" "/usr/local/hydroid/application.properties"
ADD "demo/" "/usr/local/hydroid/files/"
WORKDIR "/usr/local/hydroid"
ENV spring.config.location file:/usr/local/hydroid/application.properties
CMD ["java", "-jar", "/usr/local/hydroid/hydroid.jar","--spring.config.location=file:/usr/local/hydroid/application.properties"]
