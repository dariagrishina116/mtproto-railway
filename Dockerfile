FROM golang:1.22-alpine AS builder

RUN apk add --no-cache git
RUN go install github.com/9seconds/mtg/v2@v2.1.7

FROM alpine:3.19

RUN apk add --no-cache ca-certificates

COPY --from=builder /go/bin/mtg /usr/local/bin/mtg

EXPOSE 8443

CMD MTG_BIND="0.0.0.0:${PORT:-8443}" mtg run ${MTG_SECRET}
