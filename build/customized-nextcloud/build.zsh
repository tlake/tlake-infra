#!/usr/bin/env zsh

#docker login

docker buildx build \
    --no-cache \
    --platform linux/amd64,linux/arm64 \
    --tag tlake/customized-nextcloud:29.0.13-fpm-alpine \
    --push \
    .
