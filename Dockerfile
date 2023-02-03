FROM golang:1.19-alpine

WORKDIR /app

COPY echo/go.mod ./
COPY echo/go.sum ./
RUN go mod download

COPY echo/*.go ./

RUN go build -o /echo-hello

EXPOSE 8080

CMD [ "/echo-hello" ]