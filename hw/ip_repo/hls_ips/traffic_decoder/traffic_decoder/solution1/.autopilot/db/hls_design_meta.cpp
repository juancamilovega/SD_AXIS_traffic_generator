#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("raw_packet_tdata_V", 512, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("raw_packet_tvalid_V", 1, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("raw_packet_tready_V", 1, hls_out, 2, "ap_none", "out_data", 1),
	Port_Property("decoded_packet_tdata_V", 512, hls_out, 3, "ap_none", "out_data", 1),
	Port_Property("decoded_packet_tkeep_V", 64, hls_out, 4, "ap_none", "out_data", 1),
	Port_Property("decoded_packet_tlast_V", 1, hls_out, 5, "ap_none", "out_data", 1),
	Port_Property("decoded_packet_tvalid_V", 1, hls_out, 6, "ap_none", "out_data", 1),
	Port_Property("decoded_packet_tready_V", 1, hls_in, 7, "ap_none", "in_data", 1),
};
const char* HLS_Design_Meta::dut_name = "traffic_decoder";
