CC = g++
C_FLAGS = -Wall -fno-diagnostics-show-caret -std=c++0x
HEADERS = -I include
OUTDIR = output
TMPDIR = tmp

$(OUTDIR)/SD_AXIS_traffic_gen: $(TMPDIR)/csv_row.o $(TMPDIR)/file_to_mem.o $(TMPDIR)/traffic_gen.o $(TMPDIR)/do_test.o
	$(CC) $(TMPDIR)/csv_row.o $(TMPDIR)/file_to_mem.o $(TMPDIR)/do_test.o $(TMPDIR)/traffic_gen.o -o $(OUTDIR)/SD_AXIS_traffic_gen
	rm -f tmp/*

$(TMPDIR)/traffic_gen.o: include/* src/*
	$(CC) -c $(C_FLAGS) $(HEADERS) -o $(TMPDIR)/traffic_gen.o src/traffic_gen.cpp

$(TMPDIR)/csv_row.o: include/* src/*
	$(CC) -c $(C_FLAGS) $(HEADERS) -o $(TMPDIR)/csv_row.o src/csv_row.cpp

$(TMPDIR)/file_to_mem.o: include/* src/*
	$(CC) -c $(C_FLAGS) $(HEADERS) -o $(TMPDIR)/file_to_mem.o src/file_to_mem.cpp

$(TMPDIR)/do_test.o: include/* src/*
	$(CC) -c $(C_FLAGS) $(HEADERS) -o $(TMPDIR)/do_test.o src/do_test.cpp

clean:
	rm -f tmp/*.o output/*
