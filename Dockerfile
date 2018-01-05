# Multi-Stage Confd Docker Build
FROM golang:1.9.2 AS build-env

RUN CGO_ENABLED=0 go get github.com/kelseyhightower/confd/...

# Final Stage
FROM alpine:latest
LABEL maintainer="Peter Booker <mail@peterbooker.com>"

COPY --from=build-env /go/bin/confd /usr/local/bin/confd

ENTRYPOINT ["/usr/local/bin/confd"]
CMD ["-help"]