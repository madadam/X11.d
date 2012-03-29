all: extension libX11.a
include $(ME)

EXT_OBJ=extensions/render.o extensions/Xrender.o
COBJS=Xatom.o X.o Xlib.o Xutil.o
OBJS=$(EXT_OBJ) $(COBJS)
	
WU=..

extension:
	cd extensions; $(MAKE) ext

_LIBFLAGS=-oflibX11d.a -lib
libX11.a: extension $(OBJS)
	$(DC) $(_LIBFLAGS) $(OBJS)
