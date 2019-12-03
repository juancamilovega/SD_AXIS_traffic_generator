#include <iostream>
#include <fcntl.h>
#include <sys/mman.h>
#include "axil_ctrl.h"
using namespace std;
int AXIL_CONTROLLER::init(u64 map_base, u32 map_size) {
	u64 map_base_real;
	int fd;
#ifdef USE_AXIREGS
	fd = open("/dev/mpsoc_axiregs", O_RDWR | O_SYNC);
	map_base_real = map_base - 0xA0000000;
#else
	fd = open("/dev/mem", O_RDWR | O_SYNC);
	map_base_real = map_base;
#endif
	if (fd == -1) {
		cout << "memory map error!" << endl;
		return 1;
	}
	base_vptr = mmap64(NULL, map_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, map_base_real);
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
