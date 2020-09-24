FROM alpine:latest

ENV KUBECTL_VERSION=v1.15.12

WORKDIR /usr/local/bin

RUN apk add --no-cache bash && \
    wget -O ./kubectl https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl
