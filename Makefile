.DEFAULT_GOAL := build

clean-resources:
	rm -rf resources

download-kindlegen: clean-resources
	mkdir -p ./resources/compressed
	mkdir -p ./resources/extracted/kindlegen
	curl 'http://kindlegen.s3.amazonaws.com/kindlegen_linux_2.6_i386_v2_9.tar.gz' --output ./resources/compressed/kindlegen.tar.gz
	tar xzvf ./resources/compressed/kindlegen.tar.gz --directory ./resources/extracted/kindlegen

build: download-kindlegen
	docker build --tag thinow/penelope:local .

push: build
	docker login
	docker tag thinow/penelope:local thinow/penelope:latest
	docker push thinow/penelope:latest

