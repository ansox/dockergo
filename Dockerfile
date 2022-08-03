FROM golang:1.18 AS builder

WORKDIR /usr/src/app

RUN go mod init example/app

COPY app /usr/src/app

RUN go build -v -o /usr/local/bin/app ./

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/local/bin/app .

CMD ["./app"]
