#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <unistd.h>
#include <chrono>
#include <time.h>
#include <stdlib.h>
#include <string.h>
#include "do_test.h"
typedef uint64_t u64;
typedef uint32_t u32;
using namespace std;

void write_int(volatile void* map_base, int offset, int value)
{
  volatile void* virt_addr = (volatile void*)((char*)map_base + offset);
  *((uint32_t *) virt_addr) = value;
}

uint32_t read_int(volatile void* map_base, int offset)
{
  volatile void* virt_addr = (volatile void*)((char*)map_base + offset);
  return (*((uint32_t *) virt_addr));
}

int do_test(u64 mem_size, u32 actual_size, u32 packet_num, u32 iter_num) {
	const char * ctrl_device = "/dev/xdma0_user";
	int ctrl_fd =  open(ctrl_device, O_RDWR | O_SYNC);
	void* map_base = mmap(0, 0x10000, PROT_READ | PROT_WRITE, MAP_SHARED, ctrl_fd, 0);	
	u32 mem_size_low = mem_size & 0xFFFFFFFF;
	u32 mem_size_high = (mem_size >> 32) & 0xFFFFFFFF;
//timeout counter
	u32 timeout_cnt;
//stats registers
	u64 tx_timestamp_sum = 0;
	u64 rx_timestamp_sum = 0;
	double tx_timeElapse = 0;
	double rx_timeElapse = 0;
	double latency;
	cout << "launch the hardware test, sending " << (double)actual_size/1024/1024*8*iter_num << " Mbit data"<< endl;
	for (u32 i = 0; i < iter_num; i++) {
	//reset the core
		write_int(map_base, START, 0); //clear start bit
		write_int(map_base, RST, 1); //set rst to 1
		write_int(map_base, RST, 0); //set rst to 0
	//control the datamover controller
		write_int(map_base, LEN_LOW, mem_size_low);
		write_int(map_base, LEN_HIGH, mem_size_high);
		usleep(1000);
		write_int(map_base, START, 1); //set start to 1
	//check the status
		timeout_cnt = 0;
		while ((read_int(map_base, PKT_CNT_TX) != packet_num || read_int(map_base, PKT_CNT_RX) != packet_num) && timeout_cnt != 3000) {
			timeout_cnt++;
			usleep(1000);
		}
		if (read_int(map_base, MISMATCH) != 0) {
			cout << "ERROR: rx packets doesn't match tx packets at iteration #" << i << "!" << endl;
			goto close_ctrl_fd;
		}
		if (read_int(map_base, PKT_CNT_TX) != packet_num) {
			cout << "ERROR: tx channel has not finished at iteration #" << i << "!"  << endl;
			goto close_ctrl_fd;
		}
		if (read_int(map_base, PKT_CNT_RX) != packet_num) {
			cout << "ERROR: rx channel has not finished at iteration #" << i << "!" << endl;
			goto close_ctrl_fd;
		}

		tx_timestamp_sum += (u64)read_int(map_base, TX_TIMESTAMP_SUM_LOW)+(((u64)read_int(map_base, TX_TIMESTAMP_SUM_HIGH)) << 32);
		rx_timestamp_sum += (u64)read_int(map_base, RX_TIMESTAMP_SUM_LOW)+(((u64)read_int(map_base, RX_TIMESTAMP_SUM_HIGH)) << 32);
		tx_timeElapse += ((double)read_int(map_base, TX_TIME_ELAPSE))*clock_period;
		rx_timeElapse += ((double)read_int(map_base, RX_TIME_ELAPSE))*clock_period;
		//minimal transfer size for the datamover is set to 4K byte, which is 64 cycles for 64-byte datawidth, ddr clock period is around 3 ns, so we wait for 64*3=192 nano second, considered the propoganda delay, we wait for 2 us
		usleep(2000);
	}

	latency = ((double)(rx_timestamp_sum-tx_timestamp_sum))*clock_period;
	cout << "test finished, all rx packets matches tx packets!" << endl;
	cout << "tx throughput = " << (double)iter_num*(double)actual_size/tx_timeElapse*8 << " Gbit/s" << endl;
	cout << "rx throughput = " << (double)iter_num*(double)actual_size/rx_timeElapse*8 << " Gbit/s" << endl;
	cout << "latency: " << latency/(double)packet_num/iter_num << " ns" << endl;
close_ctrl_fd:
	close(ctrl_fd);
	return 0;
}
