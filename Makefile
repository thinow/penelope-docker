.DEFAULT_GOAL := build

clean-resources:
	rm -rf resources

download-kindlegen: clean-resources
	mkdir -p ./resources/compressed
	mkdir -p ./resources/extracted/kindlegen
	curl 'http://kindlegen.s3.amazonaws.com/kindlegen_linux_2.6_i386_v2_9.tar.gz' --output ./resources/compressed/kindlegen.tar.gz
	tar xzvf ./resources/compressed/kindlegen.tar.gz --directory ./resources/extracted/kindlegen

build: download-kindlegen
	docker build -t penelope .

