DC = dmd
DFLAGS = -debug -gc -L-llua5.2
SOURCES = main.d lua/c_api.d lua/lua.d

.PHONY: all clean

all: codename

codename: $(SOURCES)
	$(DC) -of$@ $(SOURCES) $(DFLAGS)

clean:
	rm -f codename