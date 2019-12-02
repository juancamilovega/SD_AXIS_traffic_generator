#include <iomanip>
#include <cstdlib>
#include <iostream>
#include "arch.h"
#include "file_to_mem.h"
using namespace std;

int BIN_READER::init(const char* inFilePath) {
	inFile.open(inFilePath, ios::in | ios::binary);
	if (!inFile.good()) {
		cout << "ERROR : input file is invalid!" << endl;
		return 1;
	}
	return 0;
}

int BIN_READER::read_param() {
	if (!inFile.good()) {
		cout << "ERROR : input file is invalid!" << endl;
		return 1;
	}
	inFile.read((char*)&total_size,sizeof(u64));
	inFile.read((char*)&actual_size,sizeof(u64));
	inFile.read((char*)&packet_num,sizeof(u64));
	if (total_size <= 0 || actual_size <= 0 || packet_num <= 0) {
		cout << "ERROR : got wrong parameters from binary file!" << endl;
		return 1;
	}
	return 0;
}

int BIN_READER::dump_a_page(volatile void * mem_ptr, int offset) {
	volatile void * loc_to_write = (volatile void*)((char*)mem_ptr + offset);
	inFile.read((char*)loc_to_write, PAGE_SIZE);
	return 0;
}

#if ARCH == ARM
int DMA_ENGINE::init(u64 offset) {
        //Initialize the AXIDMA device for PS side/////////////////////////////////////////////
	axidma_dev = axidma_init();
	if (axidma_dev == NULL) {
		axidma_destroy(axidma_dev);
		cout << "Error: Failed to initialize the AXI DMA device!" << endl;
		return 1;
        }
        ////////////////////////////////////////////////////////////////////////////

        // Get TX Channel//////////////////////////////////////////////////////////////
        tx_chans = axidma_get_dma_tx(axidma_dev);
        if (tx_chans->len < 1) {
		cout << "Error: No transmit channels were found!" << endl;
		axidma_destroy(axidma_dev);
		return 1;
        }
        ////////////////////////////////////////////////////////////////////////////

	//Initialize the AXIDMA device for PL side/////////////////////////////////////////////
	#if AXIL_CHAR_DEV_TYPE == 0
		const char* AXIL_CHAR_DEV = "/dev/mem";
	#else
		const char* AXIL_CHAR_DEV = "/dev/mpsoc_axiregs";
	#endif

	int fd = open(AXIL_CHAR_DEV, O_RDWR | O_SYNC);
	if (fd == -1) {
		cout << "memory map error!" << endl;
		close(fd);
		return 1;
	}
	pldma_vptr = mmap(NULL, 0x1000, PROT_READ|PROT_WRITE, MAP_SHARED, fd, PLDMA_MM_ADDR);
	if (pldma_vptr == NULL) {
		cout << "memory map error!" << endl;
		close(fd);
		return 1;
	}
	////////////////////////////////////////////////////////////////////////////

	//Initialize DMA buffer
	buf = NULL;
	//set the start address
	dst_addr = offset;
}

int DMA_ENGINE::allocate_buf() {
	buf = axidma_malloc(axidma_dev, DMA_BUFFER_SIZE);
        if (buf == NULL) {
                cout << "Failed to allocate the buffer!" << endl;
		axidma_free(buf);
		return 1;
	} 
}

int DMA_ENGINE::transfer(int size) {
	DDR_PL2PS(tx_chans[CHANNEL_TO_USE],
		axidma_dev,
		PLDMA_ADDR,
		dst_addr,
		size,
		buf);

}
#else
#endif
int DMA_to_FPGA(const char* inFilePath, u64 offset, u64 & actual_size, u64 & packet_num) {
	if (offset % PAGE_SIZE != 0) {
		cout << "ERROR : wrong offset! page alignment violated!" << endl;
		return 1;
	}

	BIN_READER bin_reader;
	if (bin_reader.init(inFilePath)) return 1;
	if (bin_reader.read_param()) return 1;

	DMA_ENGINE dma_engine;
	if (dma_engine.init(offset)) return 1;
	if (dma_engine.allocate_buf()) return 1;

	cout << "reading file into FPGA memory" << endl;
	for (u64 i = 0; i < bin_reader.total_size; i+=DMA_BUFFER_SIZE_IN_PAGE) {
		u64 j;
		for (j = 0; j < DMA_BUFFER_SIZE_IN_PAGE; j++) {
			if (i+j == bin_reader.total_size) break;
			bin_reader.dump_a_page(dma_engine.buf, j*PAGE_SIZE);
		}
		if (dma_engine.transfer(PAGE_SIZE*j)) return 1;
	}
	cout << "done moving packets to FPGA memory" << endl;
	return 0;
}
