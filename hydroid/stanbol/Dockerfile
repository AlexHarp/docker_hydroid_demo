FROM tomcat:7-jre7
RUN ["wget","https://s3-ap-southeast-2.amazonaws.com/hydroid/stanbol/stanbol.war","-P","/usr/local/tomcat/webapps/"]
RUN ["wget","https://s3-ap-southeast-2.amazonaws.com/hydroid/stanbol/org.apache.stanbol.entityhub.indexing.genericrdf-0.12.1-SNAPSHOT.jar","-P","/var/tmp/"]
RUN ["mkdir","-P","/var/tmp/config"]
ADD "config" "/var/tmp/config"
ADD "vocab" "/var/tmp"
WORKDIR "/var/tmp"
RUN ["java","-jar","-Xmx1g","-XX:MaxPermSize=256M", "org.apache.stanbol.entityhub.indexing.genericrdf-0.12.1-SNAPSHOT.jar", "init"]
RUN ["cp", "pp_project_gapublicvocabssandbox.rdf", "indexing/resources/rdfdata/"]
RUN ["rm", "indexing/config/indexing.properties"]
RUN ["cp", "indexing.properties", "indexing/config/indexing.properties"]
RUN ["java","-jar","-Xmx1g","-XX:MaxPermSize=256M", "org.apache.stanbol.entityhub.indexing.genericrdf-0.12.1-SNAPSHOT.jar", "index"]