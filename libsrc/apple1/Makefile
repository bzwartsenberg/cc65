#
# makefile for CC65 runtime library
#

.SUFFIXES: .o .s .c

#--------------------------------------------------------------------------
# Programs and flags

SYS	= apple1

AS	= ca65
CC	= cc65
LD	= ld65

AFLAGS	= -t $(SYS) -I../../asminc
CFLAGS	= -Osir -g -T -t $(SYS) --forget-inc-paths -I . -I ../../include

#--------------------------------------------------------------------------
# Rules

%.o:   	%.c
	@$(CC) $(CFLAGS) $<
	@$(AS) -o $@ $(AFLAGS) $(*).s

%.o:	%.s
	@$(AS) -g -o $@ $(AFLAGS) $<

%.emd:	%.o ../runtime/zeropage.o
	@$(LD) -t module -o $@ $^

%.joy:	%.o ../runtime/zeropage.o
	@$(LD) -t module -o $@ $^

%.ser:	%.o ../runtime/zeropage.o
	@$(LD) -t module -o $@ $^

%.tgi:	%.o ../runtime/zeropage.o
	@$(LD) -t module -o $@ $^

#--------------------------------------------------------------------------
# Object files

S_OBJS=	_scrsize.o	\
     	cclear.o	\
     	cgetc.o		\
     	clrscr.o	\
     	cputc.o		\
     	crt0.o		\
     	ctype.o		\
	gotoxy.o	\
     	kbhit.o		\
        randomize.o

#--------------------------------------------------------------------------
# Drivers

EMDS = 

JOYS =

SERS =

TGIS =

#--------------------------------------------------------------------------
# Targets

.PHONY:	all clean zap

all: 	$(C_OBJS) $(S_OBJS) $(EMDS) $(JOYS) $(SERS) $(TGIS)

../runtime/zeropage.o:
	$(MAKE) -C $(dir $@) $(notdir $@)

clean:
	@$(RM) $(C_OBJS:.o=.s) $(C_OBJS) $(S_OBJS) $(EMDS:.emd=.o) $(JOYS:.joy=.o) $(SERS:.ser=.o) $(TGIS:.tgi=.o)

zap:	clean
	@$(RM) $(EMDS) $(JOYS) $(SERS) $(TGIS)

