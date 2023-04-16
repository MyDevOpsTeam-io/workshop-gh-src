FROM golang:1.19-alpine

WORKDIR /opt/go-rest-helloworld

ADD main.go /opt/go-rest-helloworld

RUN apk update && apk add curl make && \
    cd /opt/go-rest-helloworld && make build

CMD ["exec /opt/go-rest-helloworld/main"]