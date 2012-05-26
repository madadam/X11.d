##
# Authored by Alex Herrmann
#
#
__MSG= \
"you can build by running make build\n\
install by running make install\n\
set the prefix for install by doing make install prefix=blahblah"

default:
	@echo $(__MSG)

prefix?=/usr/local
includedir=$(prefix)/include
libdir=$(prefix)/lib
ME= ME=$(realpath .)/Makefile

.PHONY:build
build: X11lib

.PHONY:install
install: build
	mkdir -p $(prefix)
	mkdir -p $(libdir)
	mkdir -p $(includedir)/extensions
	cp X11/libX11d.a $(libdir)
	cp X11/*.d $(includedir)
	cp X11/extensions $(includedir)/extensions


D=dmd
DF=
DC=$(D) $(DF)

MK=$(MAKE) $(ME)

_BUILDFLAGS=-c -version=build -I$(WU)
%.o: %.d 
	 $(DC) $(_BUILDFLAGS) $(<)


.PHONY:X11
X11lib:
	cd X11; $(MK)

.PHONY:examples
examples: X11
	cd examples; $(MK)

clean:
	cd X11; $(MK) cclean
	cd X11/extensions; $(MK) cclean
	cd examples; $(MK) cclean

cclean:
	$(RM) *.o *.a $(_OCLEAN)
