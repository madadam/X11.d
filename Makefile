##
# Authored by Alex Herrmann
#
#

ME= ME=$(realpath .)/Makefile
all: X11

D=dmd
DF=
DC=$(D) $(DF)

MK=$(MAKE) $(ME)

_BUILDFLAGS=-c -version=build -I$(WU)
%.o: %.d 
	 $(DC) $(_BUILDFLAGS) $(<)


.PHONY:X11
X11:
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
