DIR=/Library/Frameworks/Python.framework/Versions/2.7/include/python2.7/
CC=gcc
CFLAGS=-I$(DIR)
ODIR=.

LIBS_DIR=/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/config/
LIBS=-lpython2.7

_DEPS =
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = hellomodule.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hellomodule: $(OBJ)
	gcc -shared $^ $(CFLAGS) -I$(LIBS_DIR) $(LIBS) -o $@

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 
