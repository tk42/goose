FROM golang:latest
RUN go install github.com/pressly/goose/v3/cmd/goose@latest
CMD goose