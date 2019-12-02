ARCH ?= X86
CC = g++
C_FLAGS = -std=c++0x -D ARCH=$(ARCH)
HEADERS = -I include
OUTDIR = output
TMPDIR = tmp

$(OUTDIR)/test: $(TMPDIR)/file_to_mem.o $(TMPDIR)/main.o
	$(CC) $^ -o $@

$(TMPDIR)/%.o : src/%.cpp include/*.h
	$(CC) -c $(CFLAGS) $(HEADERS) -o $@ $<

clean:
	rm -f tmp/*.o output/*
