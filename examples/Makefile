include $(ME)

WU=..
all: simple

_LINKFLAGS=-L-L$(WU)/X11 -L-lX11d -L-lX11

_OCLEAN+=simple
simple: simple.o
	$(DC) $(_LINKFLAGS) $<
