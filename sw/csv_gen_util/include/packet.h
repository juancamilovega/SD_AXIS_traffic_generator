#include <fstream>
#include <iostream>
//#define KEEP_FULL 0b11111111
//#define KEEP(n) ((KEEP_FULL<<(8-n)) & KEEP_FULL)
using namespace std;
class PACKET {
public:
	unsigned char data[64];
	unsigned char keep[64];
	unsigned char valid;
	unsigned char last;
	int data_width;
	void rand_init();
	void set_idle();
	void random_gen(int len);
	void append_to_file(ofstream & outFile, int cycle_id, int packet_id);
};
