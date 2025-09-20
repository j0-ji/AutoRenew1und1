# Short description
This Docker container used playwright and cron to regularly check if an extra 1GB can be booked over a SMS link one gets over SMS when the mobile data volume was almost used up. Because the links are static and can still be used even when one gets another link, it is possible to set up this docker container once with a link and just regularly check if more GB can be booked.

# Important
Unfortunately this project does not work anymore like intended, because 1&1 added captchas to their 1GB booking process for the Unlimited on demand plans. Furthermore links one gets per SMS are invalidated after some time now.

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
