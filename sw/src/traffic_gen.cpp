#include <iostream>
#include <string.h>
#include "traffic_gen.h"
using namespace std;
void print_usage() {
	cout << "SD_AXIS_traffic_gen : the software tool for the SD_AXIS_traffic_gen IP core" << endl;
	cout << "Usage:" << endl << "\tSD_AXIS_traffic_gen [-n iteration_num] <traffic.csv>" << endl << endl;
}
int main(int argc, char** argv) {
	u32 iter_num = 1;
	if (argc > 2) {
		if (!strcmp(argv[1],"-n")) {
			iter_num = atoi(argv[2]);
			if (iter_num == 0) {
				print_usage();
				return 0;
			}
		} else {
			print_usage();
			return 0;
		}
	} else if (argc != 2) {
		print_usage();
		return 0;
	} else if (!strcmp(argv[1],"-h") || !strcmp(argv[1],"-help") || !strcmp(argv[1],"--help")) {
		print_usage();
		return 0;
	}
	const char* inFilePath = argv[argc-1];
	u64 total_size = 0;
	u64 actual_size = 0;
	u32 packet_num;
	file_to_mem(inFilePath,total_size,actual_size,packet_num);
	do_test(total_size, actual_size, packet_num, iter_num);
}
