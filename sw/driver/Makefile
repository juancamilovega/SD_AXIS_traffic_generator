CC = g++
C_FLAGS = -std=c++0x
HEADERS = -Iinclude -I.
OUTDIR = output
TMPDIR = tmp
OBJS_Name = axil_ctrl bin_reader data_handler ps2pldatamover libaxidma main
TARGETS = $(addsuffix .o,$(addprefix $(TMPDIR)/,$(OBJS_Name)))
MACROs= -D USE_USER_DEF

$(OUTDIR)/test: $(TARGETS)
	$(CC) $^ -o $@

$(TMPDIR)/%.o : src/%.c include/*.h
	$(CC) -c $(C_FLAGS) $(HEADERS) $(MACROs) -o $@ $<

$(TMPDIR)/%.o : src/%.cpp include/*.h
	$(CC) -c $(C_FLAGS) $(HEADERS) $(MACROs) -o $@ $<

clean:
	rm -f tmp/*.o output/*
