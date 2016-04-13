# Hydroid Docker Demo
This project is experimenting with Docker and the use of it to present an easy to use demo with full source and config via just a few bash commands.

## Requirements

- Git client
- Docker 1.8+
- Docker Compose

## How to run it
Once you have a machine running docker, these images can be built locally to run with the following commands.

``` bash
git clone https://github.com/GeoscienceAustralia/docker_hydroid_demo.git
chmod +x ./build.sh
./build.sh
docker-compose up -d
```

This will run a a series of containers that is used by the Hydroid system including the following.

- Apache Web container (static web applcation)
- Spring Boot API (Hydroid API)
- Solr (Search)
- Fuseki Jena (Triples data store to enable SPARQL support of indexed data)
- Stanbol in Tomcat (To enhance data of specific vocabulary)
- Postgres (Database)

Once the `docker-compose up` has finished starting the containers, the web application is accessible on local port 80.
> Note, this demo is best used on a machine/VM without anything running on port 80 and at least 2GB ram. 

## How it works
When building the images, configuration from this repository is used to run the applications, include demo files to be enhanced and indexed by the application. To make this demo simple to try, it uses the local file system in the API container to look for and enhance documents. This can be switched to support an Amazon S3 bucket, via the API application.properties config file. The basic process for files being enhanced and indexed goes like this.

1. A Quartz job runs, picking up new files to be enhanced and indexed from the file system of the API container.
2. New files content is then sent to Stanbol to enhance (uses Open NLP populated by a provided custom vocabulary or DBpedia by default).
3. Resulting RDF is then stored in Jena via Fuseki
4. Terms are pulled out of RDF to populate Solr
5. Database is updated of file `keys` (partial paths when using loacl file system) and content's SHA1 is used as unqiue ID

### Images
This process can also be used for indexing and classifying images. By default, the Google Vision API is used to provide tags of images, however there is also an alternate implementation to use Microsoft's Computer Vision API as well. Since the images are not expected to change, results are cached in the DB to prevent reclassifiying images (and reduce costs of using related SaaS API).
6. 
