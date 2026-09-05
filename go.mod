module github.com/ttab/elephant-twirptools

go 1.27.1

require (
	github.com/getkin/kin-openapi v0.149.0 // indirect
	github.com/go-openapi/jsonpointer v1.0.1 // indirect
	github.com/kr/pretty v0.3.1 // indirect
	github.com/navigacontentlab/twopdocs v0.2.9 // indirect
	github.com/oasdiff/yaml v0.1.1 // indirect
	github.com/oasdiff/yaml3 v0.0.14 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/santhosh-tekuri/jsonschema/v6 v6.0.3 // indirect
	github.com/twitchtv/twirp v8.1.3+incompatible // indirect
	golang.org/x/text v0.41.0 // indirect
	google.golang.org/protobuf v1.36.12 // indirect
)

tool (
	github.com/navigacontentlab/twopdocs/cmd/protoc-gen-openapi3
	github.com/twitchtv/twirp/protoc-gen-twirp
	google.golang.org/protobuf/cmd/protoc-gen-go
)
