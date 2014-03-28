SOURCES = main.d

.PHONY: all clean

all: codename

codename: $(SOURCES)
	ldc2 -of=$@ $(SOURCES) -L-llua5.2

clean:
	rm -f codename