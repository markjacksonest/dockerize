FROM golang:1.18.1-bullseye AS binary
RUN apt update && apt upgrade -y && apt install -y build-essential libssl-dev openssl git make

WORKDIR /go/src/github.com/jwilder/dockerize
COPY *.go go.* /go/src/github.com/jwilder/dockerize/
ADD ./Makefile /go/src/github.com/jwilder/dockerize/Makefile

ENV GO111MODULE=on
RUN go mod tidy
RUN go install

ENTRYPOINT ["bash"]
