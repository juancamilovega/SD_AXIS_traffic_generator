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
//stats registers
	double tx_timestamp_sum = 0;
	double rx_timestamp_sum = 0;
	double tx_timeElapse = 0;
	double rx_timeElapse = 0;
	double delivered_size = 0;

	double tx_timeElapse_tmp = 0;
	double rx_timeElapse_tmp = 0;
	double tx_delivered_size_tmp = 0;
	double rx_delivered_size_tmp = 0;
	double latency = 0;
	double tx_throughput = 0;
	double rx_throughput = 0;
	u64 tx_pkt_cnt;
	u64 rx_pkt_cnt;
	u64 mismatch_cnt = 0;
	u64 mismatch_cnt_tmp;
	u64 iter_cnt = 1;
	u64 loop_cnt;
	cout << "launching the hardware test\n";
	while (1) {
	//reset the core
		//clear start bit
		axil_cntlr->write(START, 0);
		//toggle reset
		axil_cntlr->write(RST, 1);
		axil_cntlr->write(RST, 0);
	//control the datamover controller
		axil_cntlr->write(LEN_LOW, total_size_low);
		axil_cntlr->write(LEN_HIGH, total_size_high);
		usleep(5);
		axil_cntlr->write(START, 1); //set start to 1
		loop_cnt = 0;
	//check the status
		while (1) {
			usleep(1000);
			if (loop_cnt == 0) {
				tx_timeElapse_tmp = tx_timeElapse + ((double)axil_cntlr->read(TX_TIMEELAPSE))*CLOCK_PERIOD;
				tx_delivered_size_tmp = delivered_size + (double)actual_size*8*((double)tx_pkt_cnt/(double)packet_num);
				rx_timeElapse_tmp = rx_timeElapse + ((double)axil_cntlr->read(RX_TIMEELAPSE))*CLOCK_PERIOD;
				rx_delivered_size_tmp = delivered_size + (double)actual_size*8*((double)rx_pkt_cnt/(double)packet_num);
			} else if (loop_cnt % 100 == 0) {
				tx_timeElapse_tmp += 1e8;
				tx_delivered_size_tmp = delivered_size + (double)actual_size*8*((double)tx_pkt_cnt/(double)packet_num);
				rx_timeElapse_tmp += 1e8;
				rx_delivered_size_tmp = delivered_size + (double)actual_size*8*((double)rx_pkt_cnt/(double)packet_num);
			}
			if (loop_cnt > 1000 && iter_cnt != 1 && loop_cnt % 100 == 0) { //more than one second, this must be a stall
				flush_lines(4);
				mismatch_cnt_tmp = mismatch_cnt + axil_cntlr->read(MISMATCH);
				tx_throughput = tx_delivered_size_tmp / tx_timeElapse_tmp;
				rx_throughput = rx_delivered_size_tmp / rx_timeElapse_tmp;
				cout << mismatch_cnt_tmp <<" packet error(s) encountered\n";
				cout << "tx throughput = " << tx_throughput << " Gbit/s\n";
				cout << "rx throughput = " << rx_throughput << " Gbit/s\n";
				cout << "latency: " << latency << " ns\n";
			}
			tx_pkt_cnt = axil_cntlr->read(PKT_CNT_TX);
			rx_pkt_cnt = axil_cntlr->read(PKT_CNT_RX);
			if (tx_pkt_cnt == packet_num && rx_pkt_cnt == packet_num) {
				break;
			}
			loop_cnt++;
		}
		tx_timestamp_sum += (double)(axil_cntlr->read(TX_TIMESTAMP_SUM_LOW)+(((u64)axil_cntlr->read(TX_TIMESTAMP_SUM_HIGH))<<32));
		rx_timestamp_sum += (double)(axil_cntlr->read(RX_TIMESTAMP_SUM_LOW)+(((u64)axil_cntlr->read(RX_TIMESTAMP_SUM_HIGH))<<32));
		tx_timeElapse += ((double)axil_cntlr->read(TX_TIMEELAPSE))*CLOCK_PERIOD;
		rx_timeElapse += ((double)axil_cntlr->read(RX_TIMEELAPSE))*CLOCK_PERIOD;
		delivered_size = (double)actual_size*iter_cnt*8;

		tx_throughput = delivered_size / tx_timeElapse;
		rx_throughput = delivered_size / rx_timeElapse;
		latency = (rx_timestamp_sum-tx_timestamp_sum)*CLOCK_PERIOD/(double)packet_num/(double)iter_cnt;
		mismatch_cnt += axil_cntlr->read(MISMATCH);
		if (iter_cnt != iter_num-1 && iter_cnt != 1)
			flush_lines(5);
		cout << iter_cnt;
		if (iter_num != 0) cout << "/" << iter_num;
		cout << " iterations passed. ";
		if (delivered_size/1024/1024/1024/1024 > 1)
			cout << delivered_size/1024/1024/1024/1024 << " Tbits data has been sent!\n";
		else if (delivered_size/1024/1024/1024 > 1)
			cout << delivered_size/1024/1024/1024 << " Gbits data has been sent!\n";
		else
			cout << delivered_size/1024/1024 << " Mbits data has been sent!\n";
		cout << mismatch_cnt <<" packet error(s) encountered\n";
		cout << "tx throughput = " << tx_throughput << " Gb/s\n";
		cout << "rx throughput = " << rx_throughput << " Gb/s\n";
		cout << "latency: " << latency << " ns\n";
		if ((iter_cnt==iter_num) || (iter_cnt == 0)) break;
		iter_cnt++;
	}
	return 0;
}
