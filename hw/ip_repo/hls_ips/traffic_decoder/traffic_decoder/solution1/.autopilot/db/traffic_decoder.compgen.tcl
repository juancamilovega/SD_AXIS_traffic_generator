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
    name raw_packet_tdata_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_raw_packet_tdata_V \
    op interface \
    ports { raw_packet_tdata_V { I 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name raw_packet_tvalid_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_raw_packet_tvalid_V \
    op interface \
    ports { raw_packet_tvalid_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name raw_packet_tready_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_raw_packet_tready_V \
    op interface \
    ports { raw_packet_tready_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name decoded_packet_tdata_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_decoded_packet_tdata_V \
    op interface \
    ports { decoded_packet_tdata_V { O 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name decoded_packet_tkeep_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_decoded_packet_tkeep_V \
    op interface \
    ports { decoded_packet_tkeep_V { O 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name decoded_packet_tlast_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_decoded_packet_tlast_V \
    op interface \
    ports { decoded_packet_tlast_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name decoded_packet_tvalid_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_decoded_packet_tvalid_V \
    op interface \
    ports { decoded_packet_tvalid_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name decoded_packet_tready_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_decoded_packet_tready_V \
    op interface \
    ports { decoded_packet_tready_V { I 1 vector } } \
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


