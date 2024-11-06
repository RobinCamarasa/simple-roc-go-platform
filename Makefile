.PHONY: build publish release

build: platform/go.mod platform/main.go platform/main.roc platform/host.h
	roc build --lib main.roc --output platform/libapp.so
	go build -C platform -buildmode=pie -o dynhost
	roc preprocess-host platform/dynhost platform/main.roc platform/libapp.so

publish: build
	roc build --bundle .tar.br platform/main.roc

release: publish
	git tag $$(cat VERSION)
	git push
