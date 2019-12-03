#include <iostream>
#include "ps2pl_datamover.h"
using namespace std;
int PS2PL_DATAMOVER::init(AXIL_CONTROLLER * controller) {
	buf_allocated = 0;
	device_inited = 0;
	//initialize the AXIDMA device for PS side
	axidma_dev = axidma_init();
	device_inited = 1;
	if (axidma_dev == NULL) {
		cout << "Error: Failed to initialize the AXI DMA device!" << endl;
		clean_up();
		return 1;
	}
	//get TX Channels
	tx_chans = axidma_get_dma_tx(axidma_dev);
	if (tx_chans->len < 1) {
		cout << "Error: No transmit channels were found!" << endl;
		clean_up();
		return 1;
	}
	//initialize DMA buffer
	buf = NULL;
	//bind the axil controller
	axil_cntlr = controller;
	return 0;
}

void PS2PL_DATAMOVER::clean_up() {
	if (buf_allocated) axidma_free(axidma_dev, buf, DMA_BUFFER_SIZE);
	if (device_inited) axidma_destroy(axidma_dev);
}

int PS2PL_DATAMOVER::allocate_buf() {
	buf = axidma_malloc(axidma_dev, DMA_BUFFER_SIZE);
	buf_allocated = 1;
	if (buf == NULL) {
		cout << "Failed to allocate the buffer!" << endl;
		clean_up();
		return 1;
	}
	return 0;
}

int PS2PL_DATAMOVER::transfer(u64 offset, u32 size) {
	//check if the offset is legit
	if (offset % PAGE_SIZE) {
		cout << "ERROR : wrong offset! page alignment violated!" << endl;
		clean_up();
		return 1;
	}
	//check if the address is valid for PL DDR
	if ((offset + size) >= PLDDR_ADDR_RANGE) {
		cout << "ERROR : try to access fpga memory address : " << (offset + size) << ", but the largest valid address is " << (PLDDR_ADDR_RANGE-1) << endl;
		clean_up();
		return 1;
	}
	//check if the transfer size is bigger than DMA buffer size
	if (size > DMA_BUFFER_SIZE) {
		cout << "ERROR : transfer size cannot be bigger than DMA_BUFFER_SIZE : " << DMA_BUFFER_SIZE << endl;
		clean_up();
		return 1;
	}
	//do transfer from PS to PL
        int old_ctrl_value = axil_cntlr->read(DMA_CtrlReg_OFFSET);
        int new_ctrl_value = old_ctrl_value | DMA_CR_RUNSTOP_MASK; //Start the S2MM channel by setting the run/stop bit to 1
	axil_cntlr->write(DMA_CtrlReg_OFFSET, new_ctrl_value);
	axil_cntlr->write(DMA_MemLoc_OFFSET, low32(offset));
	axil_cntlr->write(DMA_MemLoc_MSB_OFFSET, high32(offset));
	axil_cntlr->write(DMA_BUFFLEN_OFFSET, size);
	if (axidma_oneway_transfer(axidma_dev, tx_chans->data[PS_DMA_CHANNEL_ID], (char *)buf, size, true)) {
		cout << "ERROR : PS side DMA transfer failed!" << endl;
		clean_up();
		return 1;
	}
	return 0;
}
