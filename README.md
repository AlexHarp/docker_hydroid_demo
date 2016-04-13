# Hydroid Docker Demo
This project is experimenting with Docker and the use of it to present an easy to use demo with full source and config via just a few bash commands.

## Requirements

- Git client
- Docker 1.8+
- Docker Compose

## How to run it
Once you have a machine running docker, these images can be built locally to run with the following commands.

- `git clone https://github.com/GeoscienceAustralia/docker_hydroid_demo.git`
- `chmod +x ./build.sh
- `./build.sh`
- `docker-compose up -d`

This will run a a series of containers that is used by the Hydroid system including the following.

- Apache Web container (static web applcation)
- Spring Boot API (Hydroid API)
- Solr (Search)
- Fuseki Jena (Triples data store to enable SPARQL support of indexed data)
- Stanbol in Tomcat (To enhance data of specific vocabulary)
- Postgres (Database)

Once the `docker-compose up` has finished starting the containers, the web application is accessible on local port 80.
> Note, this demo is best used on a machine/VM without anything running on port 80 and at least 2GB ram. 
