# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1 \
    name from_decoder_tdata_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_from_decoder_tdata_V \
    op interface \
    ports { from_decoder_tdata_V { I 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name from_decoder_tkeep_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_from_decoder_tkeep_V \
    op interface \
    ports { from_decoder_tkeep_V { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name from_decoder_tlast_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_from_decoder_tlast_V \
    op interface \
    ports { from_decoder_tlast_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name from_decoder_tvalid_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_from_decoder_tvalid_V \
    op interface \
    ports { from_decoder_tvalid_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name to_app_tdata_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_to_app_tdata_V \
    op interface \
    ports { to_app_tdata_V { O 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name to_app_tkeep_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_to_app_tkeep_V \
    op interface \
    ports { to_app_tkeep_V { O 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name to_app_tlast_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_to_app_tlast_V \
    op interface \
    ports { to_app_tlast_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name to_app_tvalid_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_to_app_tvalid_V \
    op interface \
    ports { to_app_tvalid_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name to_cmp_fifo_tdata_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_to_cmp_fifo_tdata_V \
    op interface \
    ports { to_cmp_fifo_tdata_V { O 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name to_cmp_fifo_tkeep_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_to_cmp_fifo_tkeep_V \
    op interface \
    ports { to_cmp_fifo_tkeep_V { O 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name to_cmp_fifo_tlast_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_to_cmp_fifo_tlast_V \
    op interface \
    ports { to_cmp_fifo_tlast_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name to_cmp_fifo_tvalid_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_to_cmp_fifo_tvalid_V \
    op interface \
    ports { to_cmp_fifo_tvalid_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name from_decoder_tready_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_from_decoder_tready_V \
    op interface \
    ports { from_decoder_tready_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name to_app_tready_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_to_app_tready_V \
    op interface \
    ports { to_app_tready_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 15 \
    name tx_timeElapse_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_timeElapse_V \
    op interface \
    ports { tx_timeElapse_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 16 \
    name tx_timestamp_sum_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_timestamp_sum_V \
    op interface \
    ports { tx_timestamp_sum_V { O 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 17 \
    name pkt_cnt_tx_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pkt_cnt_tx_V \
    op interface \
    ports { pkt_cnt_tx_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
    name time_cnt_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_time_cnt_V \
    op interface \
    ports { time_cnt_V { O 32 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -1 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


