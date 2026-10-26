FROM --platform=$BUILDPLATFORM golang:1.27.3-alpine3.24 AS build

WORKDIR /usr/src

ADD go.mod go.sum ./
RUN go mod download && go mod verify

ARG TARGETOS TARGETARCH

RUN GOOS=$TARGETOS GOARCH=$TARGETARCH \
    go build -o /out/ tool

FROM alpine:3.24.1

ARG protoc_version

RUN apk add --no-cache jq protoc=$protoc_version

COPY --from=build /out/ /usr/local/bin/

WORKDIR /usr/src
