FROM ubuntu:latest
LABEL authors="georgigerov"

ENTRYPOINT ["top", "-b"]