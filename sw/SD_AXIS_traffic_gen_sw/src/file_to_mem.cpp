#include <iomanip>
#include <cstdlib>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <unistd.h>
#include <chrono>
#include <iterator>
#include <string>
#include <cstring>
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <sys/stat.h>
#include "csv_row.h"
#include "file_to_mem.h"
typedef uint64_t u64;
typedef uint32_t u32;
using namespace std;

int file_to_mem(const char* inFilePath, u64 & total_size, u64 & actual_size, u32 & packet_num) {
	ifstream inFile;
	struct stat stat_buf;
	stat(inFilePath, &stat_buf);
	inFile.open(inFilePath);
	if (!inFile.good()) {
		cout << "ERROR : input file is invalid!" << endl;
		return 1;
	}

	csv_row row;
	inFile >> row; //skip line 1
	//get first line size
	u32 size_fisrt_line = 0;
	for (int i = 0; i < row.size(); i++) {
		size_fisrt_line += row[i].size() + 1;
	}
	////////////////////
	//use line 2 to get line size for the rest content, so that we can calculate the line number
	inFile >> row; 
	u32 dwidth = (row[2].size()-2)/2;
	u32 size_per_line = dwidth + dwidth/4 + 14;
	u32 line_num = (stat_buf.st_size - size_fisrt_line) / size_per_line;
	u32 burst_num = (line_num-1)/63+1; //calculate how many burst we need;
	total_size = burst_num*64*64; //total transfer size
	//////////////////////////////////////////////////////////////////////

	unsigned char * alloc = NULL;

	if (total_size < RW_MAX_SIZE) {
		posix_memalign((void **)&alloc, 4096 , total_size + 4096);
	} else {
		posix_memalign((void **)&alloc, 4096 , RW_MAX_SIZE + 4096);
	}

	const char * dma_to_device = "/dev/xdma0_h2c_0";
	unsigned char *buf;
	int dma_to_device_fd = open((const char *)dma_to_device, O_RDWR | O_NONBLOCK | O_SYNC);
	u32 count = 0;
	u32 offset = 0;
	u64 remain_size = total_size;
	u32 curr_burst_num;
	unsigned char meta[63];
	unsigned char data[63][64];
	u64 current_trans_size;
	cout << "reading file into FPGA memory ..." << endl;
	inFile.seekg(0,inFile.beg); //go back to SOF
	inFile >> row; //skip line 1 again
	while (1) {
		current_trans_size = remain_size > RW_MAX_SIZE ? RW_MAX_SIZE : remain_size;
		curr_burst_num = (current_trans_size - 1) / 4096 + 1;
		memset(alloc, 0, current_trans_size);
		for (int i = 0; i < curr_burst_num; i++) {
			memset(meta,0,63);
			memset(data,0,63*64);
			for (int j = 0; j < 63; j++) {
				if (inFile >> row) {
					actual_size += row.write_meta(meta[62-j]);
					row.write_data(data[j]);
				} else break;
			}
			memcpy(alloc+i*64*64+1,meta,63);
			memcpy(alloc+i*64*64+64,data,63*64);
		}
		if (offset > 0) lseek(dma_to_device_fd, offset, SEEK_SET);
		write(dma_to_device_fd, alloc, current_trans_size);
		if (remain_size > RW_MAX_SIZE) {
			remain_size -= RW_MAX_SIZE;
			offset += RW_MAX_SIZE;
		}
		else break;
	}
	packet_num = 1+stoi(row[1],0,10);
	free(alloc);
	close(dma_to_device_fd);
	cout << "done moving packets to FPGA DDR" << endl;
//////////////////////////////////////////////////////
	return 0;
}
