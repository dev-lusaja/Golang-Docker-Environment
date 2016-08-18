
Golang-Docker-Environment
================================

This is a docker container for golang apps:

Estruct:
--------
This is the project's structure

-----------
```
project
│   README.md
|   Dockerfile
|   common-compose.yml
|   docker-compose.yml
|   staging-compose.yml
└───app
    │   main.go
```

Compose files (yml)
------------------
This project is designed to be tested on a local machine or also can be deployed in a test environment using a load balancer (**Docker-Cloud**).

* The **common-compose.yml** file has to be shared common configuration in different environments.
* To launch this container in a local environment, simply use the **docker-compose.yml** file.
>
    $ docker-compose up -d
>
> the container began in a specific port


* To work in staging environments that have a load balancer, you must use the **staging-compose.yml*** file.
>
    $ docker-compose -f staging.yml up -d
>
> the container starts on a random port, this will serve to use a load balancer.

app directory
-------------

In this directory should put the source code of our application, the container take the files in that directory and perform the following processes:

* Copy the files to the GOPATH path ("/ go")
* Compile the application
* Execute binary application

default Go envs for alpine linux
--------------------------------
alpine linux have for default this go envs:

    GOARCH="amd64"
    GOBIN=""
    GOEXE=""
    GOHOSTARCH="amd64"
    GOHOSTOS="linux"
    GOOS="linux"
    GOPATH="/go"
    GORACE=""
    GOROOT="/usr/local/go"
    GOTOOLDIR="/usr/local/go/pkg/tool/linux_amd64"
    CC="gcc"
    GOGCCFLAGS="-fPIC -m64 -pthread -fmessage-length=0"
    CXX="g++"
    CGO_ENABLED="1"
    
for Go get
----------

This container only have git installed, if you need other, add this in the Dockerfile 
