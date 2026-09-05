# Changelog

All notable changes to this project after v8.1.3-4 are documented here. The
entries below are derived from release tags; see the linked PRs for full
detail.

## [v8.1.3-5] - 2026-09-05

**Behaviour change (generated OpenAPI):** operations no longer carry an empty `default` response. Every path previously got a `default: {"description": ""}` entry, which is invalid — a Response Object requires a non-empty description — and kin-openapi stopped emitting it. If a downstream client generator keys off `default` as the catch-all error response, it now finds nothing there and will need the error responses declared explicitly. The rest of the spec is unchanged apart from the `openapi` key moving to the top of the document.

**Behaviour change (generated Go):** the first regeneration after this release produces a large, purely mechanical diff in every `.pb.go` and `.twirp.go` file. protoc-gen-go v1.36.12 emits the raw file descriptor as a string constant read through `unsafe.Slice`/`unsafe.StringData` rather than a `[]byte{…}` literal, so generated files now import `unsafe`; the gzipped descriptor blob embedded in `.twirp.go` churns because it is produced by a different protoc. Nothing about the generated API surface changes. Regenerate and commit in one go rather than mixing it with real changes.

**Release coupling:** `github.com/ttab/mage` pins the image tag in `twirp.TwirpTools`, so it needs its own tagged release pointing at `v8.1.3-5` before any project using `mage twirp:generate` picks this up.

Changes:

- protoc goes from 24.4 to 31.1, and is now stamped into generated files as `v6.31.1`.
- The `github.com/navigacontentlab/twopdocs` replace directive is gone. It redirected v0.2.7 to a `ttab/twopdocs` commit carrying the fix for map fields losing their `additionalProperties` schema; that fix has since been merged upstream and released as v0.2.9, which the image now uses directly. Generated OpenAPI output is unaffected.
- Dependency upgrades: Go to 1.27.1, Alpine to 3.24.1, protobuf to v1.36.12, and kin-openapi to v0.149.0. The GitHub Actions used by the release workflow were upgraded across major versions, and dependabot now watches them.

## [v8.1.3-4] - 2025-01-10

- baseline for this changelog
