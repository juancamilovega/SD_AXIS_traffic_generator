#include "ps2pl_datamover.h"
#include "bin_reader.h"

class DATA_HANDLER {
public:
	int init(const char* inFilePath, AXIL_CONTROLLER * controller, u64 offset);
	int move_data();
	u64 actual_size;
	u64 packet_num;
private:
	u64 pl_offset;
	PS2PL_DATAMOVER data_mover;
	BIN_READER bin_reader;
};
