# goose

A handly Docker image of goose.

## Usage (postgres)
 1. Store sql schema files in ```./schema```
 1. Save .env file
    ```bash
    GOOSE_DRIVER=postgres
    GOOSE_DBSTRING="postgres://user:password@qwerty.us-east-1.redshift.amazonaws.com:5439/db"
    ```
 1. To ```goose up```, write docker-compose.yml as following
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
      command: "up"
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
