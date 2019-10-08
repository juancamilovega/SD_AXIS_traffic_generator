#include <cstdlib>
#include <ctime>
#include <string.h>
#include <iomanip>
#include "packet.h"

void PACKET::rand_init() {
	srand(time(NULL));
	data_width=64;
}

void PACKET::set_idle() {
	memset(data,0,sizeof(data));
	memset(keep,0,sizeof(keep));
	valid = 0;
	last = 0;
}

void PACKET::random_gen(int len) {
	int actual_len = min(len, data_width);
	memset(data,0,sizeof(data));
	memset(keep,0,sizeof(keep));
	for (int i = 0; i < actual_len; i++) {
		data[i] = rand()%256;
		keep[i] = 1;
	}
	valid = 1;
	last = len <= data_width;
}

void PACKET::append_to_file(ofstream & outFile, int cycle_id, int packet_id) {
	outFile << dec << cycle_id << "," << packet_id << ",0x";
	for(int i = 0; i < data_width; i++) {
		outFile << setfill('0') << setw(2) << hex << (int)data[i];
	}
	outFile << ",0x";
	int keep_hex;
	for(int i = 0; i < data_width; i++) {
		if (i % 4 == 0) {
			keep_hex = (int)keep[i];
		} else{
			keep_hex = (keep_hex << 1) + (int)keep[i];
		}
		if (i % 4 == 3) {
			outFile << setw(1) << hex << keep_hex;
		}
	}
	outFile << dec << "," << (int)last << "," << (int)valid << endl;
}
