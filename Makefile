BINARY_NAME=flowgo
MAIN_PACKAGE=main.go
GO_INSTALL_PATH=github.com/fuegoers/flowgo

ifneq (,$(wildcard .env))
	include .env
	export
endif

.PHONY: all build run install clean release snapshot

## Compile the binary
build:
	go build -o $(BINARY_NAME) $(MAIN_PACKAGE)

## Run with arguments (ex: make run CMD="branch DEV-123")
run:
	go run $(MAIN_PACKAGE) $(CMD)

## Install to $GOPATH/bin
install:
	go install $(GO_INSTALL_PATH)@latest

## Clean build artifacts
clean:
	rm -f $(BINARY_NAME)
	rm -rf dist/

snapshot:
	goreleaser release --snapshot --clean

## 🚀 Publish a new release to GitHub (requires tag + GITHUB_TOKEN)
release:
	@if [ -z "$(VERSION)" ]; then \
		echo "❌ VERSION not set. Usage: make release VERSION=0.2.0"; \
		exit 1; \
	fi
	@git tag v$(VERSION)
	@git push origin v$(VERSION)
	@echo "📦 Releasing flowgo v$(VERSION)..."
	@GITHUB_TOKEN=$$GITHUB_TOKEN goreleaser release --clean
