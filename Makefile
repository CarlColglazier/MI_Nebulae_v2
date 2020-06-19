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

bundle:
	tar -czvf mi_nebulae_v2.tar.gz build/

install:
	cp -pr build ~/.local/share/SuperCollider/Extensions/MI_Ugens
