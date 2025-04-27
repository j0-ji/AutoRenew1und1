# Requirements
- Docker

# Steps to run
## Setup environment variables
1. Copy the `.env.example` file and rename it to `.env`. You can use:
```shell
cp .env.example .env
```
2. Put one of the URLs you get per SMS from 1und1 into the new .env file.

## Build a docker container
```shell
docker build -t auto-renew-1und1 .
```