BINARY_NAME=flowgo
MAIN_PACKAGE=main.go
GO_INSTALL_PATH=github.com/fuegoers/flowgo

.PHONY: all build run install clean release

## Compile the binary
build:
	go build -o $(BINARY_NAME) $(MAIN_PACKAGE)

## Install to $GOPATH/bin
install:
	go install $(GO_INSTALL_PATH)@latest

## Clean build artifacts
clean:
	rm -f $(BINARY_NAME)

## Create a new release from current version tag
release:
	git tag -a v$(VERSION) -m "Release v$(VERSION)"
	git push origin v$(VERSION)
