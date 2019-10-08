# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

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


# Native S_AXILite:
if {${::AESL::PGuard_simmodel_gen}} {
	if {[info proc ::AESL_LIB_XILADAPTER::s_axilite_gen] == "::AESL_LIB_XILADAPTER::s_axilite_gen"} {
		eval "::AESL_LIB_XILADAPTER::s_axilite_gen { \
			id 1 \
			corename sw_interface_AXILiteS_axilite \
			name sw_interface_AXILiteS_s_axi \
			ports {$port_AXILiteS} \
			op interface \
			is_flushable 0 \ 
		} "
	} else {
		puts "@W \[IMPL-110\] Cannot find AXI Lite interface model in the library. Ignored generation of AXI Lite  interface for 'AXILiteS'"
	}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler sw_interface_AXILiteS_s_axi
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name start_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_start_V \
    op interface \
    ports { start_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name rst_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_rst_V \
    op interface \
    ports { rst_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name transfer_length_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_transfer_length_V \
    op interface \
    ports { transfer_length_V { O 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name mismatch_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_mismatch_V \
    op interface \
    ports { mismatch_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name tx_timeElapse_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_tx_timeElapse_V \
    op interface \
    ports { tx_timeElapse_V { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name rx_timeElapse_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_rx_timeElapse_V \
    op interface \
    ports { rx_timeElapse_V { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name tx_timestamp_sum_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_tx_timestamp_sum_V \
    op interface \
    ports { tx_timestamp_sum_V { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name rx_timestamp_sum_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_rx_timestamp_sum_V \
    op interface \
    ports { rx_timestamp_sum_V { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name pkt_cnt_tx_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_pkt_cnt_tx_V \
    op interface \
    ports { pkt_cnt_tx_V { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name pkt_cnt_rx_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_pkt_cnt_rx_V \
    op interface \
    ports { pkt_cnt_rx_V { I 32 vector } } \
} "
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


