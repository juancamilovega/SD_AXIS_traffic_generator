#include "traffic_gen_tx.h"
void traffic_gen_tx(
	AXIS & from_decoder,
	AXIS & to_app,
	AXIS & to_cmp_fifo,
	ap_uint<1> & from_decoder_tready,
	ap_uint<1> to_app_tready,
	ap_uint<32> & tx_timeElapse,
	ap_uint<64> & tx_timestamp_sum,
	ap_uint<32> & pkt_cnt_tx,
	ap_uint<32> & time_cnt
) {
	#pragma HLS INTERFACE ap_ctrl_none port=return
	#pragma HLS INTERFACE ap_none port=from_decoder
	#pragma HLS INTERFACE ap_none port=from_decoder_tready
	#pragma HLS INTERFACE ap_none port=to_app
	#pragma HLS INTERFACE ap_none port=to_app_tready
	#pragma HLS INTERFACE ap_none port=to_cmp_fifo
	#pragma HLS INTERFACE ap_none port=tx_timeElapse
	#pragma HLS INTERFACE ap_none port=tx_timestamp_sum
	#pragma HLS INTERFACE ap_none port=pkt_cnt_tx
	#pragma HLS INTERFACE ap_none port=time_cnt
	#pragma HLS data_pack variable=to_app.tkeep
	#pragma HLS data_pack variable=to_cmp_fifo.tkeep
        static ap_uint<1> core_on, start_flag, start_initialized;
        static ap_uint<32> pkt_cnt_tx_reg;
        static ap_uint<32> tx_start, tx_end, tx_timeElapse_reg;
        static ap_uint<32> time_cnt_reg;
        static ap_uint<64> tx_timestamp_sum_reg;

	tx_timeElapse = tx_timeElapse_reg;
	tx_timestamp_sum = tx_timestamp_sum_reg;
	pkt_cnt_tx = pkt_cnt_tx_reg;

	//wait for 32 cycles to launch the tx core, this is in order to avoid the launch glitch of the ddr4
	if (start_flag && to_app_tready && from_decoder.tvalid && from_decoder.tlast && from_decoder.tkeep != 0) {
		tx_timeElapse_reg = time_cnt_reg - tx_start;
		tx_timestamp_sum_reg += time_cnt_reg;
		pkt_cnt_tx_reg++;
	}

	if (!start_initialized) tx_start = time_cnt_reg;
	if (start_flag && to_app_tready && from_decoder.tvalid && from_decoder.tkeep != 0) start_initialized = 1;

	from_decoder_tready = to_app_tready & start_flag;
	if (start_flag && from_decoder.tvalid && from_decoder.tkeep != 0) {
		to_app = from_decoder;
	} else {
		to_app = AXIS_IDLE;
	}
	if (start_flag && from_decoder.tvalid && from_decoder.tkeep != 0 && to_app_tready) {
		to_cmp_fifo = from_decoder;
	} else {
		to_cmp_fifo = AXIS_IDLE;
	}
	time_cnt = time_cnt_reg;
	if (time_cnt_reg[5]) start_flag = 1;

	if (core_on) {
		time_cnt_reg++;
	} else if (from_decoder.tvalid) {
		core_on = 1;
	}
}
