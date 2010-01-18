#!/bin/sh

#this will be replaed by autotools inthe fulture

_gen_vala(){
	mkdir src
	valac 	vala/RC_Config.vala \
		vala/RC_Connection.vala \
		vala/RC_RuijieClient.vala \
		\
		-C --pkg gee-1.0 --pkg   ruijie --vapidir=./packet
	mv ./vala/*.c ./src
}

gen(){
	_gen_vala
	cp ./packet/*.c ./src
	cp ./packet/*.h ./src
}


test(){
	_gen_vala
	cp ./test/*.c ./src
	cp ./test/*.h ./src
}

clean(){
	rm -r ./src
}

build(){
	cd src
	gcc ./*.c -o ruijieclient ` pkg-config glib-2.0 gobject-2.0 gee-1.0 --cflags --libs` -I. -lpcap
	cd ..
}

$1