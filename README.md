docker-nodejs
=============

A simple Centos + EPEL server with nodejs v0.10.18 + coffeescript + amqp

This container is a basic development environment for coffeescript appliances that speak AMQP to other applications.  The build scripts are available at http://github.com/cthulhuology/docker-nodejs

It includes:

* Centos 6.4
* Epel 6
* Development Tools
* Nodejs 0.10.18  (built from source)
* Coffeescript
* AMQP


Getting Started
---------------

You can build this container using docker build

	sudo docker build -t nodejs github.com/cthulhuology/docker-nodejs


Or you can pull the latest image from the docker.io index

	sudo docker pull cthulhuology/nodejs


You can then run the container using

	sudo docker run -i -t cthulhuology/nodejs


It will drop you into a shell prompt with port 8080 exposed.  If you'd like to use
it run an actual webapp you can do something like:

	sudo docker run -p 8080:8080 -i -t cthulhuology/nodejs

