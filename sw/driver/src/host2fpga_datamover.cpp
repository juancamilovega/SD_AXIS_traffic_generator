#include <iostream>
#include "host2fpga_datamover.h"
using namespace std;
int HOST2FPGA_DATAMOVER::init(AXIL_CONTROLLER * controller) {
	buf_allocated = 0;
	device_inited = 0;
	//initialize the XDMA device for SW side
	dma_to_device_fd = open((const char *)XDMA_H2C_DEV, O_RDWR | O_NONBLOCK | O_SYNC);
	if (dma_to_device_fd == -1) {
		cout << "Failed to open dma char device" << endl;
		return 1;
	}
	device_inited = 1;
	//initialize DMA buffer
	buf = NULL;
	//bind the axil controller
	axil_cntlr = controller;
	return 0;
}

void inline HOST2FPGA_DATAMOVER::clean_up() {
	if (buf_allocated) free(buf);
	if (device_inited) close(dma_to_device_fd)
}

int HOST2FPGA_DATAMOVER::allocate_buf() {
	buf = posix_memalign((void **)&buf, PAGE_SIZE , DMA_BUFFER_SIZE + PAGE_SIZE);
	buf_allocated = 1;
	if (buf == NULL) {
		cout << "Failed to allocate the buffer!" << endl;
		clean_up();
		return 1;
	}
	return 0;
}

int HOST2FPGA_DATAMOVER::transfer(u64 offset, u32 size) {
	//check if the offset is legit
	if (offset % PAGE_SIZE) {
		cout << "ERROR : wrong offset! page alignment violated!" << endl;
		clean_up();
		return 1;
	}
	//check if the address is valid for HW DDR
	if ((offset + size) >= HWDDR_ADDR_RANGE) {
		cout << "ERROR : try to access fpga memory address : " << (offset + size) << ", but the largest valid address is " << (HWDDR_ADDR_RANGE-1) << endl;
		clean_up();
		return 1;
	}
	//check if the transfer size is bigger than DMA buffer size
	if (size > DMA_BUFFER_SIZE) {
		cout << "ERROR : transfer size cannot be bigger than DMA_BUFFER_SIZE : " << DMA_BUFFER_SIZE << endl;
		clean_up();
		return 1;
	}
	//do transfer from SW to HW
	if (offset > 0) lseek64(dma_to_device_fd, offset, SEEK_SET);
	if (write(dma_to_device_fd, buf, size) == -1) {
		cout << "ERROR : SW side DMA transfer failed!" << endl;
		clean_up();
		return 1;
	}
	return 0;
}
