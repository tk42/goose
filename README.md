# goose

A handly Docker image of goose.

## Usage (postgres)
 1. Store sql schema files in ```./schema```
 1. Save .env file
    ```bash
    POSTGRES_USER=postgres
    POSTGRES_PASSWORD=postgres
    POSTGRES_SERVER=postgres
    POSTGRES_PORT=5432
    POSTGRES_DB=postgres
    POSTGRES_SSLMODE=disable
    ```
 1. In docker-compose.yml
    ```yaml
    version: '3'
    services:
      migration:
      image: ghcr.io/tk42/goose:latest
      platform: linux/amd64 # If you use M1 Mac
      env_file:
        - .env
      working_dir: "/src"
      volumes:
        - "./schema:/src"
      depends_on:
        - postgres

    postgres:
      image: postgres:latest
      env_file:
        - .env
      ports:
        - 5432:5432
      volumes:
        - postgres_data:/var/lib/postgresql/data/

    volumes:
      postgres_data:
    ```
