#include <iostream>
#include <unistd.h>
#include "control_handler.h"
using namespace std;
void flush_lines(int n) {
	for (int i = 0; i < n; i++) {
		cout << (char)(0x1B) << "[2K" << (char)(0x1B) << "[1A";
	}
}

int CONTROL_HANDLER::do_test(int iter_num) {
//timeout counter
	u32 timeout_cnt;
//stats registers
	double tx_timestamp_sum = 0;
	double rx_timestamp_sum = 0;
	double tx_timeElapse = 0;
	double rx_timeElapse = 0;
	double latency;
	cout << "launching the hardware test, sending " << (double)actual_size/1024/1024*8*iter_num << " Mbit data"<< endl;
	for (int i = 0; i < iter_num; i++) {
	//reset the core
		//clear start bit
		axil_cntlr->write(START, 0);
		//toggle reset
		axil_cntlr->write(RST, 1);
		axil_cntlr->write(RST, 0);
	//control the datamover controller
		axil_cntlr->write(LEN_LOW, total_size_low);
		axil_cntlr->write(LEN_HIGH, total_size_high);
		usleep(1000);
		axil_cntlr->write(START, 1); //set start to 1
	//check the status
		timeout_cnt = 0;

		while ((axil_cntlr->read(PKT_CNT_TX) != packet_num || axil_cntlr->read(PKT_CNT_RX) != packet_num) && timeout_cnt != 3000) {
			timeout_cnt++;
			usleep(1000);
		}
		if (axil_cntlr->read(MISMATCH) != 0) {
			cout << "ERROR: rx packets doesn't match tx packets at iteration #" << i << "!" << endl;
			return 1;
		}
		if (axil_cntlr->read(PKT_CNT_TX) != packet_num) {
			cout << "ERROR: tx channel has not finished at iteration #" << i << "!"  << endl;
			return 1;
		}
		if (axil_cntlr->read(PKT_CNT_RX) != packet_num) {
			cout << "ERROR: rx channel has not finished at iteration #" << i << "!" << endl;
			return 1;
		}

		tx_timestamp_sum += (double)(axil_cntlr->read(TX_TIMESTAMP_SUM_LOW)+(((u64)axil_cntlr->read(TX_TIMESTAMP_SUM_HIGH))<<32));
		rx_timestamp_sum += (double)(axil_cntlr->read(RX_TIMESTAMP_SUM_LOW)+(((u64)axil_cntlr->read(RX_TIMESTAMP_SUM_HIGH))<<32));
		tx_timeElapse += ((double)axil_cntlr->read(TX_TIMEELAPSE))*CLOCK_PERIOD;
		rx_timeElapse += ((double)axil_cntlr->read(RX_TIMEELAPSE))*CLOCK_PERIOD;
        	latency = (rx_timestamp_sum-tx_timestamp_sum)*CLOCK_PERIOD;
	        cout << (i+1) << "/" << iter_num << " iterations passed, all rx packets matches tx packets!\n";
		cout << "tx throughput = " << (double)(i+1)*(double)actual_size/tx_timeElapse*8 << " Gbit/s\n";
		cout << "rx throughput = " << (double)(i+1)*(double)actual_size/rx_timeElapse*8 << " Gbit/s\n";
		cout << "latency: " << latency/(double)packet_num/(i+1) << " ns\n";
		if (i != iter_num-1) flush_lines(4);
		//minimal transfer size for the datamover is set to 4K byte, which is 64 cycles for 64-byte datawidth, ddr clock period is around 3 ns, so we wait for 64*3=192 nano second, considered the propoganda delay, we wait for 2 us
		usleep(2000);
	}
	return 0;
}
