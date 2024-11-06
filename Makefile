.PHONY: build publish

build: platform/go.mod platform/main.go platform/main.roc platform/host.h
	roc build --lib main.roc --output platform/libapp.so
	go build -C platform -buildmode=pie -o dynhost
	roc preprocess-host platform/dynhost platform/main.roc platform/libapp.so

publish: platform
	roc build --bundle .tar.br platform/main.roc

release:
	git tag $$(cat VERSION)
