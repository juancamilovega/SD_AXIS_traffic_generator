#include "traffic_decoder.h"
void traffic_decoder(
	AXIS_MEM & raw_packet,
	AXIS_APP & decoded_packet
) {
	#pragma HLS INTERFACE ap_ctrl_none port=return
	#pragma HLS INTERFACE ap_none port=raw_packet
	#pragma HLS INTERFACE ap_none port=decoded_packet
	#pragma HLS data_pack variable=decoded_packet.tkeep
	static ap_uint<6> meta_count;
	static ap_uint<512> meta;

	raw_packet.tready = decoded_packet.tready;
	decoded_packet.tdata = raw_packet.tdata;
	for (int i = 0; i < 64; i++) {
	#pragma HLS unroll
		decoded_packet.tkeep[i] = meta(511,511-6) > (63 - i) ? ap_uint<1>("1",2) : ap_uint<1>("0",2);
	}
	decoded_packet.tlast = meta[504];;
	decoded_packet.tvalid = raw_packet.tvalid && (meta_count != 0);

	if (raw_packet.tvalid & decoded_packet.tready) {
		if (meta_count == 0) meta = raw_packet.tdata;
		else meta = meta << 8;
		meta_count++;
	}
}
