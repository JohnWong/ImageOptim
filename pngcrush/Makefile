VERSION=1.7.77

.PHONY: all

all: pngcrush.c

pngcrush.c: pngcrush.patch
    curl -L http://softlayer-sng.dl.sourceforge.net/project/pmt/pngcrush/old-versions/1.7/1.7.77/pngcrush-1.7.77-nolib.tar.gz | tar xz --strip-components=1 --exclude=Makefile
	-rm png.h pngconf.h 2>/dev/null
	patch -p1 < pngcrush.patch

clean:
	-rm *.c *.h 2>/dev/null

install:
