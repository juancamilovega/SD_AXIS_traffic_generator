#include <iostream>
#include "data_handler.h"
using namespace std;

int DATA_HANDLER::init(const char* inFilePath, AXIL_CONTROLLER * controller, u64 offset) {
	hw_offset = offset;
	if (bin_reader.init(inFilePath)) return 1;
	if (data_mover.init(controller)) return 1;
	if (bin_reader.read_param()) return 1;
	page_num = bin_reader.page_num;
	actual_size = bin_reader.actual_size;
	packet_num = bin_reader.packet_num;
	if (data_mover.allocate_buf()) return 1;
	return 0;
}

int DATA_HANDLER::move_data() {
	cout << "Reading file into FPGA memory" << endl;
	u64 total_transfer_size = bin_reader.page_num*PAGE_SIZE;
	while (1) {
		u32 size_to_transfer = total_transfer_size > DMA_BUFFER_SIZE ? DMA_BUFFER_SIZE : total_transfer_size;
		//file to HOST DDR
		if (bin_reader.dump_to_buffer(data_mover.buf, size_to_transfer)) return 1;
		//HOST DDR to FPGA DDR
		if (data_mover.transfer(hw_offset, size_to_transfer)) return 1;
		hw_offset += DMA_BUFFER_SIZE;
		if (total_transfer_size <= DMA_BUFFER_SIZE) break;
		total_transfer_size -= DMA_BUFFER_SIZE;
	}
	cout << "Done reading file into FPGA memory" << endl;
	return 0;
}
