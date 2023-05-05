FROM golang:1.19-alpine

WORKDIR /app

COPY echo/go.mod ./
COPY echo/go.sum ./
RUN go mod download

COPY echo/*.go ./

RUN go build -o /echo-hello
RUN apk update && apk add bash
COPY   ./run.sh /
RUN chmod +x /run.sh

EXPOSE 8080
ENTRYPOINT [ "/run.sh"]
