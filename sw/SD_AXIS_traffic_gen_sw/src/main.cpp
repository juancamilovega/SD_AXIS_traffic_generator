#include <iostream>
#include <string.h>
#include "file_to_mem.h"
using namespace std;
int main(int argc, char** argv) {
	const char* inFilePath = argv[argc-1];
	DMA_to_FPGA(inFilePath, 0);
}
