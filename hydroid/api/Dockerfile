FROM maven:3.3.3-jdk-8
RUN ["apt-get","update"]
RUN ["apt-get","install","-y","tomcat8"]
RUN ["mkdir","-p","/tmp/hydroid-api;"]
ADD "src" "/tmp/hydroid-api"
WORKDIR "/tmp/hydroid-api"
RUN ["mvn","clean","package"]
RUN ["cp","/tmp/hydroid-api/target/hydroid.war","/usr/share/tomcat8-root/hydroid.war"]
CMD ["service","tomcat8","start"]
