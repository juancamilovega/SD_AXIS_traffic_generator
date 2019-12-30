#include <ap_int.h>
void sw_interface (
//AXI Lite interface, to software
	ap_uint<1>	axil_start,
	ap_uint<1>	axil_rst,
	//datamover controller
	ap_uint<32>	axil_offset_low,
	ap_uint<32>	axil_offset_high,
	ap_uint<32>	axil_len_low,
	ap_uint<32>	axil_len_high,
	//pkt_gen_core
	ap_uint<32>	&axil_mismatch,
	ap_uint<32>	&axil_tx_timeElapse,
	ap_uint<32>	&axil_rx_timeElapse,
	ap_uint<32>	&axil_tx_timestamp_sum_low,
	ap_uint<32>	&axil_tx_timestamp_sum_high,
	ap_uint<32>     &axil_rx_timestamp_sum_low,
	ap_uint<32>     &axil_rx_timestamp_sum_high,
	ap_uint<32>	&axil_pkt_cnt_tx,
	ap_uint<32>	&axil_pkt_cnt_rx,
//PL interfaces
	ap_uint<1>	&start,
	ap_uint<1>	&rst,
	ap_uint<64>	&offset,
	ap_uint<64>	&transfer_length,
	ap_uint<1>	mismatch,
	ap_uint<32>	tx_timeElapse,
	ap_uint<32>	rx_timeElapse,
	ap_uint<64>	tx_timestamp_sum,
	ap_uint<64>     rx_timestamp_sum,
	ap_uint<32>	pkt_cnt_tx,
	ap_uint<32>	pkt_cnt_rx
//////////////
) {
	#pragma HLS INTERFACE ap_ctrl_none port=return
	#pragma HLS INTERFACE s_axilite port=axil_start
	#pragma HLS INTERFACE s_axilite port=axil_rst
	#pragma HLS INTERFACE s_axilite port=axil_offset_low
	#pragma HLS INTERFACE s_axilite port=axil_offset_high
	#pragma HLS INTERFACE s_axilite port=axil_len_low
	#pragma HLS INTERFACE s_axilite port=axil_len_high
	#pragma HLS INTERFACE s_axilite port=axil_mismatch
	#pragma HLS INTERFACE s_axilite port=axil_tx_timeElapse
	#pragma HLS INTERFACE s_axilite port=axil_rx_timeElapse
	#pragma HLS INTERFACE s_axilite port=axil_tx_timestamp_sum_low
	#pragma HLS INTERFACE s_axilite port=axil_tx_timestamp_sum_high
	#pragma HLS INTERFACE s_axilite port=axil_rx_timestamp_sum_low
	#pragma HLS INTERFACE s_axilite port=axil_rx_timestamp_sum_high
	#pragma HLS INTERFACE s_axilite port=axil_pkt_cnt_tx
	#pragma HLS INTERFACE s_axilite port=axil_pkt_cnt_rx
	#pragma HLS INTERFACE ap_none port=start
	#pragma HLS INTERFACE ap_none port=rst
	#pragma HLS INTERFACE ap_none port=offset
	#pragma HLS INTERFACE ap_none port=transfer_length
	#pragma HLS INTERFACE ap_none port=mismatch
	#pragma HLS INTERFACE ap_none port=tx_timeElapse
	#pragma HLS INTERFACE ap_none port=rx_timeElapse
	#pragma HLS INTERFACE ap_none port=tx_timestamp_sum
	#pragma HLS INTERFACE ap_none port=rx_timestamp_sum
	#pragma HLS INTERFACE ap_none port=pkt_cnt_tx
	#pragma HLS INTERFACE ap_none port=pkt_cnt_rx

	start = axil_start;
	rst = axil_rst;
	offset = (axil_offset_high, axil_offset_low);
	transfer_length = (axil_len_high,axil_len_low);
	axil_mismatch = mismatch;
	axil_tx_timeElapse = tx_timeElapse;
	axil_rx_timeElapse = rx_timeElapse;
	axil_tx_timestamp_sum_low = tx_timestamp_sum(31,0);
	axil_tx_timestamp_sum_high = tx_timestamp_sum(63,32);
	axil_rx_timestamp_sum_low = rx_timestamp_sum(31,0);
	axil_rx_timestamp_sum_high = rx_timestamp_sum(63,32);
	axil_pkt_cnt_tx = pkt_cnt_tx;
	axil_pkt_cnt_rx = pkt_cnt_rx;
}
