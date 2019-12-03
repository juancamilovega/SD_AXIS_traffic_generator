#include <iostream>
#include "arg_parser.h"
#include "control_handler.h"
using namespace std;

int main(int argc, char** argv) {
	ARG_PARSER parser;
	if (parser.parse(argc, argv)) return 1;
//initialization
	AXIL_CONTROLLER axil_cntrl;
	if (axil_cntrl.init(MAP_BASE, MAP_SIZE)) return 1;
	DATA_HANDLER d_handler;
	if (d_handler.init(parser.inFilePath, &axil_cntrl, parser.offset)) return 1;
	CONTROL_HANDLER c_handler(&axil_cntrl, &d_handler);
//move file content to FPGA memory
	if (d_handler.move_data()) return 1;
//do test
	if (c_handler.do_test(parser.iter_num)) return 1;
	return 0;
}
