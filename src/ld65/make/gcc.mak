#
# gcc Makefile for ld65
#

# Library dir
COMMON	= ../common

# Default for the compiler lib search path as compiler define
CDEFS=-DCC65_LIB=\"/usr/lib/cc65/lib/\"
CFLAGS = -g -O2 -Wall -I$(COMMON) $(CDEFS)
CC=gcc
EBIND=emxbind
LDFLAGS=

# Perl script for config file conversion
CVT=cfg/cvt-cfg.pl

# -----------------------------------------------------------------------------
# List of all object files

OBJS = 	bin.o		\
	binfmt.o	\
	condes.o	\
	config.o	\
	dbginfo.o	\
	dbgsyms.o	\
	error.o		\
	exports.o	\
	expr.o		\
	extsyms.o	\
	fileinfo.o	\
	fileio.o	\
	fragment.o	\
	global.o        \
	library.o	\
	lineinfo.o	\
	main.o	       	\
	mapfile.o	\
	o65.o		\
	objdata.o	\
	objfile.o	\
	scanner.o	\
	segments.o	\
	tgtcfg.o

# -----------------------------------------------------------------------------
# List of all config includes

INCS =	apple2.inc	\
	atari.inc	\
	bbc.inc		\
	c64.inc		\
	c128.inc	\
	cbm510.inc	\
	cbm610.inc	\
	geos.inc	\
	none.inc	\
	pet.inc		\
	plus4.inc

# -----------------------------------------------------------------------------
#

LIBS = $(COMMON)/common.a


EXECS = ld65

.PHONY: all
ifeq (.depend,$(wildcard .depend))
all : $(EXECS)
include .depend
else
all:	depend
	@$(MAKE) -f make/gcc.mak all
endif



ld65:   $(INCS) $(OBJS) $(LIBS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LIBS)
	@if [ $(OS2_SHELL) ] ;	then $(EBIND) $@ ; fi

inc:	$(INCS)

clean:
	rm -f *~ core *.map

zap:   	clean
	rm -f *.o $(INCS) $(EXECS) .depend


# ------------------------------------------------------------------------------
# Make the dependencies

.PHONY: depend dep
depend dep:	$(OBJS:.o=.c)
	@echo "Creating dependency information"
	$(CC) -I$(COMMON) -MM -MG $^ > .depend

# -----------------------------------------------------------------------------
# Rules to make config includes

apple2.inc:	cfg/apple2.cfg
	@$(CVT) $< $@ CfgApple2

atari.inc:     	cfg/atari.cfg
	@$(CVT) $< $@ CfgAtari

bbc.inc:     	cfg/bbc.cfg
	@$(CVT) $< $@ CfgBBC

c64.inc:     	cfg/c64.cfg
	@$(CVT) $< $@ CfgC64

c128.inc:     	cfg/c128.cfg
	@$(CVT) $< $@ CfgC128

cbm510.inc:	cfg/cbm510.cfg
	@$(CVT) $< $@ CfgCBM510

cbm610.inc:	cfg/cbm610.cfg
	@$(CVT) $< $@ CfgCBM610

geos.inc:	cfg/geos.cfg
	@$(CVT) $< $@ CfgGeos

none.inc:	cfg/none.cfg
	@$(CVT) $< $@ CfgNone

pet.inc:       	cfg/pet.cfg
	@$(CVT) $< $@ CfgPET

plus4.inc:     	cfg/plus4.cfg
	@$(CVT) $< $@ CfgPlus4


