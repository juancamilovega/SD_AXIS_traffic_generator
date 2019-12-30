#include <iostream>
#include <fcntl.h>
#include <sys/mman.h>
#include "hw.h"
#include "axil_ctrl.h"
using namespace std;
int AXIL_CONTROLLER::init() {
	int fd;
	fd = open((const char*)XDMA_USER_DEV, O_RDWR | O_SYNC);
	if (fd == -1) {
		cout << "memory map error!" << endl;
		return 1;
	}
	base_vptr = mmap64(0, 0x10000, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	if (base_vptr == NULL) {
		cout << "memory map error!" << endl;
		return 1;
	}
	return 0;
}

u32 AXIL_CONTROLLER::read(u64 offset) {
	volatile void* target_vptr = (volatile void*)((char*)base_vptr + offset);
	return *((u32 *)target_vptr);
}

void AXIL_CONTROLLER::write(u64 offset, u32 val) {
	volatile void* target_vptr = (volatile void*)((char*)base_vptr + offset);
	*((u32 *)target_vptr) = val;
}
