# dmenu version
VERSION = 5.1

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

# void linux fix
X11INC = /usr/include/X11
X11LIB = /usr/lib/X11
# normally
# X11INC = /usr/X11R6/include
# X11LIB = /usr/X11R6/lib

BDINC = /usr/include/fribidi

# Xinerama, comment if you don't want it
XINERAMALIBS  = -lXinerama
XINERAMAFLAGS = -DXINERAMA

# freetype
FREETYPELIBS = -lfontconfig -lXft
FREETYPEINC = /usr/include/freetype2
# OpenBSD (uncomment)
#FREETYPEINC = $(X11INC)/freetype2
#MANPREFIX = ${PREFIX}/man

BDLIBS = -lfribidi

# includes and libs
INCS = -I$(X11INC) -I$(FREETYPEINC) -I$(BDINC)
# void linux fix
LIBS = -L$(X11LIB) -lX11 -lXrender $(XINERAMALIBS) $(FREETYPELIBS) $(BDLIBS)
# for some reason -lXrender not present in base patch:
# LIBS = -L$(X11LIB) -lX11 $(XINERAMALIBS) $(FREETYPELIBS) $(BDLIBS)

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_POSIX_C_SOURCE=200809L -DVERSION=\"$(VERSION)\" $(XINERAMAFLAGS)
CFLAGS   = -std=c99 -pedantic -Wall -Os $(INCS) $(CPPFLAGS)
LDFLAGS  = $(LIBS)

# compiler and linker
CC = cc
