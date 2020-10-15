

FROM golang:1.15.1-alpine3.12 as go-builder
WORKDIR /go/src/github.com/percona/mongodb_exporter
COPY . .
RUN go build
FROM alpine:3.12
COPY --from=go-builder /go/src/github.com/percona/mongodb_exporter/mongodb_exporter /bin/mongodb_exporter
EXPOSE     9216
ENTRYPOINT [ "/bin/mongodb_exporter" ]

