FROM --platform=$BUILDPLATFORM golang:1.21.0-alpine3.18 AS build

WORKDIR /usr/src

ADD go.mod go.sum ./
RUN go mod download && go mod verify

ARG TARGETOS TARGETARCH

RUN GOOS=$TARGETOS GOARCH=$TARGETARCH \
    go build github.com/twitchtv/twirp/protoc-gen-twirp
RUN GOOS=$TARGETOS GOARCH=$TARGETARCH \
    go build google.golang.org/protobuf/cmd/protoc-gen-go
RUN GOOS=$TARGETOS GOARCH=$TARGETARCH \
    go build github.com/navigacontentlab/twopdocs/cmd/protoc-gen-openapi3

FROM alpine:3.18.3

ARG protoc_version

RUN apk add --no-cache jq protoc

COPY --from=build /usr/src/protoc-gen-twirp /usr/local/bin/
COPY --from=build /usr/src/protoc-gen-go /usr/local/bin/
COPY --from=build /usr/src/protoc-gen-openapi3 /usr/local/bin/

WORKDIR /usr/src
