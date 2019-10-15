#include <iostream>
#include <string.h>
#include <unistd.h> //for getopt
#include "traffic_gen.h"

using namespace std;

ostream& el(ostream& o) {return o << "\n";}

void print_usage() {
	cout << "SD_AXIS_traffic_gen : the software tool for the SD_AXIS_traffic_gen IP core" << endl;
	cout << "Usage:" << endl << "\tSD_AXIS_traffic_gen -o 0x<ddr_offset> -a 0x<base_addr> [-n iteration_num] [-pci] <traffic.csv>" << endl << endl;
}
int main(int argc, char** argv) {
	if (!strcmp(argv[1],"-h") || !strcmp(argv[1],"-help") || !strcmp(argv[1],"--help")) {
		print_usage();
		return 0;
	}
	
	void *offset = NULL;
	bool offset_set = false;
	void *base_addr = NULL;
	bool base_addr_set = false;
	u32 iter_num = 1;
	
	bool PCI_mode = false;
	
	int opt;
	opterr = 0;
	while ((opt = getopt(argc, argv, "ho:a:n:")) != -1) {
		switch(opt) {
			case 'h':
				print_usage();
				return 0;
			case 'o':
				if (sscanf(optarg, "%p", &offset) < 1) {
					cout << "Error: could not parse DDR offset [" << optarg << "]" << el;
					return 1;
				}
				offset_set = true;
				break;
			case 'a':
				if (sscanf(optarg, "%p", &base_addr) < 1) {
					cout << "Error: could not parse base address [" << optarg << "]" << el;
					return 1;
				}
				base_addr_set = true;
				break;
			case 'n':
				if (sscanf(optarg, "%d", &iter_num) < 1) {
					cout << "Error: could not parse iteration number [" << optarg << "]" << el;
					return 1;
				}
				break;
			case 'p':
				cout << "PCI mode enabled" << el;
				PCI_mode = true;
				break;
			case '?':
				cout << "Unrecognized option [" << char(optopt) << "]" << el;
				return 1;
		}
	}
	
	if (optind != argc - 1) {
		cout << "Error: too many arguments" << el;
		return 1;
	}
	
	if (!base_addr_set) {
		cout << "Error: must set base address" << el;
		return 1;
	}
	
	if (!offset_set) {
		cout << "Error: must set DDR offset" << el;
		return 1;
	}
	
	cout << "Offset = " << offset << el;
	cout << "Base address = " << base_addr << el;
	
	const char* inFilePath = argv[argc-1];
	u64 total_size = 0;
	u64 actual_size = 0;
	u32 packet_num;
	
	if (PCI_mode) {
		file_to_mem(inFilePath,offset,total_size,actual_size,packet_num);
		do_test(total_size, base_addr, offset, actual_size, packet_num, iter_num);
	} else {
		file_to_mem_ps(inFilePath,offset,total_size,actual_size,packet_num);
		do_test_ps(total_size, base_addr, offset, actual_size, packet_num, iter_num);
	}
}
