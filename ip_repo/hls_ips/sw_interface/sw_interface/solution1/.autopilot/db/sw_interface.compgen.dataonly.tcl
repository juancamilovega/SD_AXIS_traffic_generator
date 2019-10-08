# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_AXILiteS {
axil_start_V { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
axil_rst_V { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
axil_len_low_V { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
axil_len_high_V { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
axil_mismatch_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 48
	offset_end 55
}
axil_tx_timeElapse_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 56
	offset_end 63
}
axil_rx_timeElapse_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 64
	offset_end 71
}
axil_tx_timestamp_sum_low_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 72
	offset_end 79
}
axil_tx_timestamp_sum_high_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 80
	offset_end 87
}
axil_rx_timestamp_sum_low_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 88
	offset_end 95
}
axil_rx_timestamp_sum_high_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 96
	offset_end 103
}
axil_pkt_cnt_tx_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 104
	offset_end 111
}
axil_pkt_cnt_rx_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 112
	offset_end 119
}
}
dict set axilite_register_dict AXILiteS $port_AXILiteS


