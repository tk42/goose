FROM golang:latest
RUN go install github.com/pressly/goose/v3/cmd/goose@latest
CMD goose postgres "postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_SERVER}:${POSTGRES_PORT}/${POSTGRES_DB}?sslmode={POSTGRES_SSLMODE}" up