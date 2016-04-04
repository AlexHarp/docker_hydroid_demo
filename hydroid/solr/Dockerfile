FROM solr:5.4.1
RUN ["bin/solr", "create_core", "-c", "gettingstarted"]
RUN ["bin/post", "-c", "gettingstarted", "example/exampledocs/manufacturers.xml"]