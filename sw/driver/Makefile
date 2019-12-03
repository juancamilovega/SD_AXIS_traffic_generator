CC = g++
C_FLAGS = -std=c++0x
HEADERS = -Iinclude -I.
OUTDIR = output
TMPDIR = tmp
OBJS_Name = axil_ctrl bin_reader data_handler ps2pldatamover libaxidma control_handler arg_parser main
TARGETS = $(addsuffix .o,$(addprefix $(TMPDIR)/,$(OBJS_Name)))

$(OUTDIR)/traffic_gen: $(TARGETS)
	$(CC) $^ -o $@

$(TMPDIR)/%.o : src/%.c include/*.h
	$(CC) -c $(C_FLAGS) $(HEADERS) -o $@ $<

$(TMPDIR)/%.o : src/%.cpp include/*.h user_def.h
	$(CC) -c $(C_FLAGS) $(HEADERS) -o $@ $<

clean:
	rm -f tmp/*.o output/traffic_gen
