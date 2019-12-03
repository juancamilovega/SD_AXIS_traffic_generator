#include <iostream>
#include "bin_reader.h"
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
	inFile.read((char*)&page_num,sizeof(u64));
	inFile.read((char*)&actual_size,sizeof(u64));
	inFile.read((char*)&packet_num,sizeof(u64));
	if (page_num <= 0 || actual_size <= 0 || packet_num <= 0) {
		cout << "ERROR : got wrong parameters from binary file!" << endl;
		return 1;
	}
	return 0;
}

int BIN_READER::dump_to_buffer(volatile void * buffer_ptr, int size) {
	inFile.read((char*)buffer_ptr, size);
	return 0;
}
