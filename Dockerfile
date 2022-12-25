FROM golang:latest
RUN go install github.com/pressly/goose/v3/cmd/goose@latest
# https://penpen-dev.com/blog/docker-cmd-entrypoin/
ENTRYPOINT ["goose"]
CMD ["status"]
