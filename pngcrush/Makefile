VERSION=1.7.77
PNGCRUSH_FILENAME=pngcrush-$(VERSION)-nolib.tar.gz

.PHONY: all

all: pngcrush.c

pngcrush.c: pngcrush.patch
	curl -L http://softlayer-sng.dl.sourceforge.net/project/pmt/pngcrush/old-versions/1.7/$(VERSION)/$(PNGCRUSH_FILENAME)  -o /tmp/$(PNGCRUSH_FILENAME)
	tar xzf /tmp/$(PNGCRUSH_FILENAME) --strip-components=1 --exclude=Makefile --exclude=Makefile.solaris
	-rm png.h pngconf.h 2>/dev/null
	patch -p1 < pngcrush.patch

clean:
	-rm *.c *.h 2>/dev/null

install:
