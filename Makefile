SC_PATH=$(shell pwd)/supercollider

.ONESHELL:
build:
	echo $(SC_PATH)
	cd mi-UGens
	./linux-build.sh $(SC_PATH)

collect:
	./collect.sh

clean:
	rm -fr build

all: build collect

