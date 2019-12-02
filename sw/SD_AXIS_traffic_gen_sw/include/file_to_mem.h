#include <fstream>
#include "const.h"
#include "arch.h"
using namespace std;
#if ARCH == ARM
	#include "libaxidma.h" // Interface of the AXI DMA library
	#include "axidma_ctrl_func.h" //PS2PL util 
#else
	#include <stdlib.h>
#endif

class BIN_READER {
public:
	u64 total_size;
	u64 actual_size;
	u64 packet_num;
	ifstream inFile;
	int init(const char* inFilePath);
	int read_param();
	int dump_a_page(volatile void * mem_ptr, int offset);
};

int DMA_to_FPGA(const char* inFilePath, u64 offset);
/*
class DMA_ENGINE {
public:
	void *buf;
	int init(u64 offset);
	int allocate_buf();
	int transfer(int size);
private:
	u64 dst_addr;
#if ARCH == ARCH_ARM
	axidma_dev_t axidma_dev;
	array_t *rx_chans;
	void *pldma_vptr;
#else
};
*/
