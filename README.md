# Elephant Twirp tools

A docker image that's used to genererate Twirp API code and documentation from protobuf declarations.

Usage:

``` makefile
proto_file := repository/service.proto
generated_files := repository/service.pb.go \
	repository/service.twirp.go \
	docs/repository-openapi.json

module := $(shell go list -m)

TOOL := docker run --rm \
	-v "$(shell pwd):/usr/src" \
	-u $(shell id -u):$(shell id -g) \
	ghcr.io/ttab/elephant-twirptools:v8.1.3-0

.PHONY: proto
proto: $(generated_files)

$(generated_files): $(proto_file) newsdoc/newsdoc.proto Makefile docs
	$(TOOL) protoc --go_out=. --twirp_out=. \
		--openapi3_out=./docs --openapi3_opt=application=repository,version=v0.0.0 \
		$(proto_file)
```
