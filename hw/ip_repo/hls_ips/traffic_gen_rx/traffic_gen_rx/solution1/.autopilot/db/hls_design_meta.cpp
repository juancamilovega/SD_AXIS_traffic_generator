#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("from_app_tdata_V", 512, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("from_app_tkeep_V", 64, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("from_app_tlast_V", 1, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("from_app_tvalid_V", 1, hls_in, 3, "ap_none", "in_data", 1),
	Port_Property("from_app_tready_V", 1, hls_out, 4, "ap_none", "out_data", 1),
	Port_Property("from_cmp_fifo_tdata_V", 512, hls_in, 5, "ap_none", "in_data", 1),
	Port_Property("from_cmp_fifo_tkeep_V", 64, hls_in, 6, "ap_none", "in_data", 1),
	Port_Property("from_cmp_fifo_tlast_V", 1, hls_in, 7, "ap_none", "in_data", 1),
	Port_Property("from_cmp_fifo_tvalid_V", 1, hls_in, 8, "ap_none", "in_data", 1),
	Port_Property("from_cmp_fifo_tready_V", 1, hls_out, 9, "ap_none", "out_data", 1),
	Port_Property("time_cnt_V", 32, hls_in, 10, "ap_none", "in_data", 1),
	Port_Property("mismatch_V", 1, hls_out, 11, "ap_none", "out_data", 1),
	Port_Property("rx_timeElapse_V", 32, hls_out, 12, "ap_none", "out_data", 1),
	Port_Property("rx_timestamp_sum_V", 64, hls_out, 13, "ap_none", "out_data", 1),
	Port_Property("pkt_cnt_rx_V", 32, hls_out, 14, "ap_none", "out_data", 1),
};
const char* HLS_Design_Meta::dut_name = "traffic_gen_rx";
