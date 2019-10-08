#include "traffic_gen_rx.h"
void traffic_gen_rx(
	AXIS & from_app,
	AXIS & from_cmp_fifo,
	ap_uint<32> time_cnt,
	ap_uint<1> & mismatch,
	ap_uint<32> & rx_timeElapse,
	ap_uint<64> & rx_timestamp_sum,
	ap_uint<32> & pkt_cnt_rx
) {
	#pragma HLS INTERFACE ap_ctrl_none port=return
	#pragma HLS INTERFACE ap_none port=from_app
	#pragma HLS INTERFACE ap_none port=from_cmp_fifo
	#pragma HLS INTERFACE ap_none port=time_cnt
	#pragma HLS INTERFACE ap_none port=mismatch
	#pragma HLS INTERFACE ap_none port=rx_timeElapse
	#pragma HLS INTERFACE ap_none port=rx_timestamp_sum
	#pragma HLS INTERFACE ap_none port=pkt_cnt_rx

	static ap_uint<1> mismatch_reg, start_initialized;
	static ap_uint<32> pkt_cnt_rx_reg;
	static ap_uint<32> rx_start, rx_timeElapse_reg;
	static ap_uint<64> rx_timestamp_sum_reg;

	rx_timeElapse = rx_timeElapse_reg;
	rx_timestamp_sum = rx_timestamp_sum_reg;
	pkt_cnt_rx = pkt_cnt_rx_reg;

	if (from_app.tvalid & from_app.tlast) {
		rx_timeElapse_reg = time_cnt - rx_start;
		rx_timestamp_sum_reg += time_cnt;
		pkt_cnt_rx_reg++;
	}

	if (!start_initialized) rx_start = time_cnt;
	if (from_app.tvalid) start_initialized = 1;

	//correctness//////////
	mismatch = mismatch_reg;
	from_app.tready = 1;
	from_cmp_fifo.tready = from_app.tvalid;
	ap_uint<512> mask;
	getMask(from_cmp_fifo.tkeep, mask);
	if (from_app.tvalid && 
		(!from_cmp_fifo.tvalid || 
		((from_app.tdata & mask) != (from_cmp_fifo.tdata & mask)) || 
		(from_app.tkeep != from_cmp_fifo.tkeep) ||
		(from_app.tlast != from_cmp_fifo.tlast))
	) {
		mismatch_reg = 1;
	}
	////////////////////////
}
