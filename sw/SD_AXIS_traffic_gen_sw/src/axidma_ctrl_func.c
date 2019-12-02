#include "axidma_ctrl_func.h"
#include "libaxidma.h"
#include <assert.h>
int axilite_read(volatile void* map_base, int offset) {
	volatile void* virt_addr = (volatile void*)((char*)map_base + offset);
	int value = *((unsigned int *) virt_addr);
	return value;
}

void axilite_write(volatile void* map_base, int offset, int value) {
	volatile void* virt_addr = (volatile void*)((char*)map_base + offset);
	*((unsigned int *) virt_addr) = value;
}

void DMA_MM2S(volatile void* map_base, int address_low, int address_high, int size) {
	axilite_write(map_base, DMA_MM2S_OFFSET+DMA_CtrlReg_OFFSET, axilite_read(map_base, DMA_MM2S_OFFSET+DMA_CtrlReg_OFFSET) | XAXIDMA_CR_RUNSTOP_MASK); /* Start the MM2S channel running by setting the run/stop bit to 1*/
	axilite_write(map_base, DMA_MM2S_OFFSET+DMA_MemLoc_OFFSET, address_low);
	axilite_write(map_base, DMA_MM2S_OFFSET+DMA_MemLoc_MSB_OFFSET, address_high);
	axilite_write(map_base, DMA_MM2S_OFFSET+DMA_BUFFLEN_OFFSET, size);
}

void DMA_S2MM(volatile void* map_base, int address_low, int address_high, int size) {
	axilite_write(map_base, DMA_S2MM_OFFSET+DMA_CtrlReg_OFFSET, axilite_read(map_base, DMA_S2MM_OFFSET+DMA_CtrlReg_OFFSET) | XAXIDMA_CR_RUNSTOP_MASK); /* Start the S2MM channel running by setting the run/stop bit to 1*/
	axilite_write(map_base, DMA_S2MM_OFFSET+DMA_MemLoc_OFFSET, address_low);
	axilite_write(map_base, DMA_S2MM_OFFSET+DMA_MemLoc_MSB_OFFSET, address_high);
	axilite_write(map_base, DMA_S2MM_OFFSET+DMA_BUFFLEN_OFFSET, size);
}

int DDR_PS2PL( const array_t *tx_chans,
		axidma_dev_t axidma_dev,
		void *dma_vptr,
		uint64_t start_addr,
		int total_size,
		void *input_buf)
{
	if (start_addr + total_size >= 0x400000000) { //out of 16G range
		return 1;
	}      
	int size;
	int left_bytes = total_size;
	char * input_buf_dummy = (char *)input_buf;
	do {    
		size = left_bytes > BUFFER_SIZE ? BUFFER_SIZE : left_bytes;
		DMA_S2MM(dma_vptr, low32(start_addr), high32(start_addr), size);
		axidma_oneway_transfer(axidma_dev, tx_chans->data[0], input_buf_dummy, size, true);
		input_buf_dummy += size;
		start_addr += size;
		left_bytes -= size;
	} while (left_bytes != 0);
	return 0;
}

void DDR_PL2PS( const array_t *rx_chans,
		axidma_dev_t axidma_dev,
		void *dma_vptr,
		uint64_t start_addr,
		int total_size,
		void *output_buf)
{      
	if (start_addr + total_size >= 0x400000000) { //out of 16G range
		return 1;
	} 
	int size;
	int left_bytes = total_size;
	char * output_buf_dummy = (char *)output_buf;
	do {    
		size = left_bytes > BUFFER_SIZE ? BUFFER_SIZE : left_bytes;
		DMA_MM2S(dma_vptr, low32(start_addr), high32(start_addr), size);
		axidma_oneway_transfer(axidma_dev, rx_chans->data[0], output_buf_dummy, size, true);
		output_buf_dummy += size;
		start_addr += size;
		left_bytes -= size;
	} while (left_bytes != 0);
	return 0;
}
