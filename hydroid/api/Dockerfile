FROM maven:3.3.3-jdk-8
RUN ["apt-get","update"]
RUN ["mkdir","-p","/tmp/hydroid-api;"]
ADD "src" "/tmp/hydroid-api"
ADD "config/application.properties" "/tmp/hydroid-api/src/main/resources/application.properties"
WORKDIR "/tmp/hydroid-api"
RUN ["mvn","clean","package"]
RUN ["mkdir","-p","/usr/share/hydroid"]
RUN ["cp","/tmp/hydroid-api/target/hydroid.jar","/usr/share/hydroid/hydroid.jar"]

EXPOSE 9090

CMD ["java","-jar","/usr/share/hydroid/hydroid.jar"]