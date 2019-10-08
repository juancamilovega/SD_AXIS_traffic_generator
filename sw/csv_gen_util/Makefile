CC = g++
C_FLAGS = -std=c++0x
HEADERS = -I include
OUTDIR = output
TMPDIR = tmp

$(OUTDIR)/gen_traffic_file: $(TMPDIR)/main.o $(TMPDIR)/arg_parser.o $(TMPDIR)/gen_traffic.o $(TMPDIR)/packet.o
	$(CC) $(TMPDIR)/arg_parser.o $(TMPDIR)/gen_traffic.o $(TMPDIR)/packet.o $(TMPDIR)/main.o -lboost_program_options -o $(OUTDIR)/gen_traffic_file
	rm -f tmp/*

$(TMPDIR)/main.o: include/* src/*
	$(CC) -c $(C_FLAGS) $(HEADERS) -o $(TMPDIR)/main.o src/main.cpp

$(TMPDIR)/arg_parser.o: include/* src/*
	$(CC) -c $(C_FLAGS) $(HEADERS) -o $(TMPDIR)/arg_parser.o src/arg_parser.cpp

$(TMPDIR)/gen_traffic.o: include/* src/*
	$(CC) -c $(C_FLAGS) $(HEADERS) -o $(TMPDIR)/gen_traffic.o src/gen_traffic.cpp

$(TMPDIR)/packet.o: include/* src/*
	$(CC) -c $(C_FLAGS) $(HEADERS) -o $(TMPDIR)/packet.o src/packet.cpp

clean:
	rm -f tmp/* output/*
