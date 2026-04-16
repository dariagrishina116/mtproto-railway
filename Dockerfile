FROM golang:1.22-alpine AS builder

RUN apk add --no-cache git
RUN go install github.com/9seconds/mtg/v2@v2.1.7

FROM alpine:3.19

RUN apk add --no-cache ca-certificates

COPY --from=builder /go/bin/mtg /usr/local/bin/mtg
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8443

CMD ["/entrypoint.sh"]
