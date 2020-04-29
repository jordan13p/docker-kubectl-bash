# build stage
FROM alpine:3.9 AS builder

ENV KUBECTL_VERSION=v1.14.3

RUN set -ex && \
    apk add --no-cache curl && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl

# final stage
FROM alpine:3.9

RUN apk add --no-cache bash

WORKDIR /usr/local/bin

COPY --from=builder /kubectl .
