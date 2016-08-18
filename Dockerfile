FROM golang:1.7-alpine

MAINTAINER dev-lusaja janoone52@gmail.com

# Installing Git
RUN apk update && apk upgrade && \
    apk add --no-cache git

# GOPATH by default is /go
ADD app/ /go/src/app

RUN go get github.com/gin-gonic/gin

RUN go install app

ENTRYPOINT /go/bin/app