set project_dir [file dirname [file dirname [file normalize [info script]]]]
set project_name "SD_AXIS_traffic_gen"
source ${project_dir}/scripts/util.tcl

create_project $project_name $project_dir/$project_name -part xczu19eg-ffvc1760-2-i
create_bd_design $project_name
set_property ip_repo_paths [list "${project_dir}/../hls_ips" "${project_dir}/../interfaces"] [current_project]
update_ip_catalog -rebuild

addip sw_interface sw_interface
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /sw_interface/rst]
addip datamover_controller datamover_controller
addip axi_datamover axi_datamover
set_property -dict [list CONFIG.c_m_axi_mm2s_data_width {512} CONFIG.c_m_axis_mm2s_tdata_width {512} CONFIG.c_mm2s_burst_size {64} CONFIG.c_mm2s_btt_used {23} CONFIG.c_include_s2mm {Omit} CONFIG.c_include_s2mm_stsfifo {false} CONFIG.c_s2mm_addr_pipe_depth {3} CONFIG.c_s2mm_include_sf {false} CONFIG.c_m_axi_s2mm_awid {1} CONFIG.c_enable_s2mm {0} CONFIG.c_addr_width {64} CONFIG.c_m_axi_mm2s_id_width {0}] [get_bd_cells axi_datamover]
addip traffic_decoder traffic_decoder
addip axis_data_fifo cross_domain_fifo
set_property -dict [list CONFIG.FIFO_DEPTH {64} CONFIG.IS_ACLK_ASYNC {1} CONFIG.SYNCHRONIZATION_STAGES {8} CONFIG.PROG_FULL_THRESH {13}] [get_bd_cells cross_domain_fifo]
addip traffic_gen_tx traffic_gen_tx
addip util_vector_logic util_vector_logic
set_property -dict [list CONFIG.C_SIZE {1} CONFIG.C_OPERATION {not} CONFIG.LOGO_FILE {data/sym_notgate.png}] [get_bd_cells util_vector_logic]
addip proc_sys_reset proc_sys_reset
set_property -dict [list CONFIG.C_EXT_RST_WIDTH {1}] [get_bd_cells proc_sys_reset]
make_bd_pins_external  [get_bd_pins sw_interface/mismatch]
make_bd_pins_external  [get_bd_pins sw_interface/rx_timeElapse]
make_bd_pins_external  [get_bd_pins sw_interface/rx_timestamp_sum]
make_bd_pins_external  [get_bd_pins sw_interface/pkt_cnt_rx]
make_bd_pins_external  [get_bd_pins sw_interface/ap_clk]
make_bd_pins_external  [get_bd_pins sw_interface/ap_rst_n]
make_bd_pins_external  [get_bd_pins sw_interface/start]
make_bd_pins_external  [get_bd_pins sw_interface/transfer_length]
make_bd_pins_external  [get_bd_pins traffic_decoder/ap_clk]
make_bd_pins_external  [get_bd_pins traffic_gen_tx/tx_timeElapse]
make_bd_pins_external  [get_bd_pins traffic_gen_tx/tx_timestamp_sum]
make_bd_pins_external  [get_bd_pins traffic_gen_tx/pkt_cnt_tx]
make_bd_pins_external  [get_bd_pins traffic_gen_tx/time_cnt]
make_bd_intf_pins_external  [get_bd_intf_pins sw_interface/s_axi_AXILiteS]
make_bd_intf_pins_external  [get_bd_intf_pins traffic_gen_tx/to_app]
make_bd_intf_pins_external  [get_bd_intf_pins axi_datamover/M_AXI_MM2S]
make_bd_intf_pins_external  [get_bd_intf_pins traffic_gen_tx/to_cmp_fifo]
make_bd_pins_external  [get_bd_pins sw_interface/rst]
set_property name rst_out [get_bd_ports rst_0]
foreach port [get_bd_ports *_0] {
        set_property name [regsub "_0" [regsub "/" $port ""] ""] $port
}
foreach port [get_bd_intf_ports *_0] {
        set_property name [regsub "_0" [regsub "/" $port ""] ""] $port
}

set_property name traffic_clk [get_bd_ports ap_clk]
set_property name rstn [get_bd_ports ap_rst_n]
set_property name ddr_clk [get_bd_ports ap_clk_1]
set_property name to_ddr [get_bd_intf_ports M_AXI_MM2S]
set_property name s_axilite_ctrl [get_bd_intf_ports s_axi_AXILiteS]

connect_bd_net [get_bd_ports traffic_clk] [get_bd_pins datamover_controller/ap_clk]
connect_bd_net [get_bd_ports traffic_clk] [get_bd_pins axi_datamover/m_axis_mm2s_cmdsts_aclk]
connect_bd_net [get_bd_ports traffic_clk] [get_bd_pins cross_domain_fifo/m_axis_aclk]
connect_bd_net [get_bd_ports traffic_clk] [get_bd_pins traffic_gen_tx/ap_clk]
connect_bd_net [get_bd_ports ddr_clk] [get_bd_pins axi_datamover/m_axi_mm2s_aclk]
connect_bd_net [get_bd_ports ddr_clk] [get_bd_pins proc_sys_reset/slowest_sync_clk]
connect_bd_net [get_bd_ports ddr_clk] [get_bd_pins cross_domain_fifo/s_axis_aclk]
connect_bd_net [get_bd_pins sw_interface/rst] [get_bd_pins traffic_gen_tx/ap_rst]
connect_bd_net [get_bd_pins sw_interface/start] [get_bd_pins datamover_controller/start]
connect_bd_net [get_bd_pins sw_interface/offset] [get_bd_pins datamover_controller/offset]
connect_bd_net [get_bd_pins sw_interface/transfer_length] [get_bd_pins datamover_controller/length]
connect_bd_net [get_bd_pins datamover_controller/ap_rst] [get_bd_pins sw_interface/rst]
connect_bd_net [get_bd_pins util_vector_logic/Op1] [get_bd_pins sw_interface/rst]
connect_bd_net [get_bd_pins proc_sys_reset/peripheral_aresetn] [get_bd_pins  axi_datamover/m_axi_mm2s_aresetn]
connect_bd_net [get_bd_pins util_vector_logic/Res] [get_bd_pins axi_datamover/m_axis_mm2s_cmdsts_aresetn]
connect_bd_intf_net [get_bd_intf_pins datamover_controller/m_axis] [get_bd_intf_pins axi_datamover/S_AXIS_MM2S_CMD]
connect_bd_intf_net [get_bd_intf_pins axi_datamover/M_AXIS_MM2S] [get_bd_intf_pins traffic_decoder/raw_packet]
connect_bd_net [get_bd_pins traffic_decoder/ap_rst] [get_bd_pins proc_sys_reset/peripheral_reset]
connect_bd_intf_net [get_bd_intf_pins traffic_decoder/decoded_packet] [get_bd_intf_pins cross_domain_fifo/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins cross_domain_fifo/M_AXIS] [get_bd_intf_pins traffic_gen_tx/from_decoder]
connect_bd_net [get_bd_pins proc_sys_reset/peripheral_aresetn] [get_bd_pins cross_domain_fifo/s_axis_aresetn]
connect_bd_net [get_bd_pins traffic_gen_tx/tx_timeElapse] [get_bd_pins sw_interface/tx_timeElapse]
connect_bd_net [get_bd_pins traffic_gen_tx/tx_timestamp_sum] [get_bd_pins sw_interface/tx_timestamp_sum]
connect_bd_net [get_bd_pins traffic_gen_tx/pkt_cnt_tx] [get_bd_pins sw_interface/pkt_cnt_tx]
connect_bd_net [get_bd_pins proc_sys_reset/ext_reset_in] [get_bd_pins sw_interface/rst]

assign_bd_address
set_property offset 0x0000000000000000 [get_bd_addr_segs {axi_datamover/Data_MM2S/SEG_to_ddr_Reg}]
set_property range 16G [get_bd_addr_segs {axi_datamover/Data_MM2S/SEG_to_ddr_Reg}]
make_wrapper -files [get_files $project_dir/$project_name/${project_name}.srcs/sources_1/bd/$project_name/${project_name}.bd] -top
save_bd_design
###################################################################################################

##loopback components
create_bd_design "${project_name}_loopback"
current_bd_design [get_bd_designs ]
addip traffic_gen_rx traffic_gen_rx
make_bd_pins_external  [get_bd_cells traffic_gen_rx]
make_bd_intf_pins_external  [get_bd_cells traffic_gen_rx]
foreach port [get_bd_ports *_0] {
        set_property name [regsub "_0" [regsub "/" $port ""] ""] $port
}
foreach port [get_bd_intf_ports *_0] {
        set_property name [regsub "_0" [regsub "/" $port ""] ""] $port
}
set_property name traffic_clk [get_bd_ports ap_clk]
set_property name rst [get_bd_ports ap_rst]
###################################################################################################
make_wrapper -files [get_files $project_dir/$project_name/${project_name}.srcs/sources_1/bd/${project_name}_loopback/${project_name}_loopback.bd] -top
save_bd_design
import_files -norecurse "$project_dir/../verilogs/dwidth_adjust.v"
import_files -norecurse "$project_dir/../verilogs/traffic_gen_top.v"
#config IP parameters
ipx::package_project -root_dir $project_dir/$project_name/${project_name}.srcs/sources_1 -vendor clarkshen.com -library user -taxonomy /UserIP
set_property vendor_display_name {clarkshen.com} [ipx::current_core]
set_property name $project_name [ipx::current_core]
set_property display_name $project_name [ipx::current_core]
set_property description $project_name [ipx::current_core]
ipx::associate_bus_interfaces -busif from_app -clock traffic_clk [ipx::current_core]
ipx::associate_bus_interfaces -busif to_app -clock traffic_clk [ipx::current_core]
ipx::associate_bus_interfaces -busif s_axilite_ctrl -clock traffic_clk [ipx::current_core]
ipx::associate_bus_interfaces -busif to_ddr -clock ddr_clk [ipx::current_core]
ipx::associate_bus_interfaces -clock traffic_clk -reset rst [ipx::current_core]
ipx::associate_bus_interfaces -busif from_cmp_fifo -clock traffic_clk [ipx::current_core]
ipx::associate_bus_interfaces -busif to_cmp_fifo -clock traffic_clk [ipx::current_core]

ipx::add_user_parameter ENDIANNESS [ipx::current_core]
set_property value_resolve_type user [ipx::get_user_parameters ENDIANNESS -of_objects [ipx::current_core]]
ipgui::add_param -name {ENDIANNESS} -component [ipx::current_core]
set_property display_name {Traffic Endianness} [ipgui::get_guiparamspec -name "ENDIANNESS" -component [ipx::current_core] ]
set_property widget {radioGroup} [ipgui::get_guiparamspec -name "ENDIANNESS" -component [ipx::current_core] ]
set_property layout {horizontal} [ipgui::get_guiparamspec -name "ENDIANNESS" -component [ipx::current_core] ]
set_property value 1 [ipx::get_user_parameters ENDIANNESS -of_objects [ipx::current_core]]
set_property value_validation_type pairs [ipx::get_user_parameters ENDIANNESS -of_objects [ipx::current_core]]
set_property value_validation_pairs {{Big Endian} 1 {Little Endian} 0} [ipx::get_user_parameters ENDIANNESS -of_objects [ipx::current_core]]
set_property value true [ipx::get_user_parameters BIGENDIAN -of_objects [ipx::current_core]]
set_property value true [ipx::get_hdl_parameters BIGENDIAN -of_objects [ipx::current_core]]
set_property enablement_value false [ipx::get_user_parameters BIGENDIAN -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_user_parameters BIGENDIAN -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_hdl_parameters BIGENDIAN -of_objects [ipx::current_core]]
set_property value_tcl_expr {$ENDIANNESS == 1} [ipx::get_user_parameters BIGENDIAN -of_objects [ipx::current_core]]
ipgui::remove_param -component [ipx::current_core] [ipgui::get_guiparamspec -name "BIGENDIAN" -component [ipx::current_core]]
set_property widget {checkBox} [ipgui::get_guiparamspec -name "EN_LOOPBACK" -component [ipx::current_core] ]
set_property value true [ipx::get_user_parameters EN_LOOPBACK -of_objects [ipx::current_core]]
set_property value true [ipx::get_hdl_parameters EN_LOOPBACK -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_user_parameters EN_LOOPBACK -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_hdl_parameters EN_LOOPBACK -of_objects [ipx::current_core]]
set_property widget {checkBox} [ipgui::get_guiparamspec -name "EN_KEEP" -component [ipx::current_core] ]
set_property value true [ipx::get_user_parameters EN_KEEP -of_objects [ipx::current_core]]
set_property value true [ipx::get_hdl_parameters EN_KEEP -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_user_parameters EN_KEEP -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_hdl_parameters EN_KEEP -of_objects [ipx::current_core]]
set_property widget {checkBox} [ipgui::get_guiparamspec -name "EN_DATA" -component [ipx::current_core] ]
set_property value true [ipx::get_user_parameters EN_DATA -of_objects [ipx::current_core]]
set_property value true [ipx::get_hdl_parameters EN_DATA -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_user_parameters EN_DATA -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_hdl_parameters EN_DATA -of_objects [ipx::current_core]]
set_property widget {checkBox} [ipgui::get_guiparamspec -name "EN_LAST" -component [ipx::current_core] ]
set_property value true [ipx::get_user_parameters EN_LAST -of_objects [ipx::current_core]]
set_property value true [ipx::get_hdl_parameters EN_LAST -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_user_parameters EN_LAST -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_hdl_parameters EN_LAST -of_objects [ipx::current_core]]
set_property widget {checkBox} [ipgui::get_guiparamspec -name "EN_READY" -component [ipx::current_core] ]
set_property value true [ipx::get_user_parameters EN_READY -of_objects [ipx::current_core]]
set_property value true [ipx::get_hdl_parameters EN_READY -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_user_parameters EN_READY -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_hdl_parameters EN_READY -of_objects [ipx::current_core]]
ipx::add_user_parameter DATAWIDTH [ipx::current_core]
set_property value_resolve_type user [ipx::get_user_parameters DATAWIDTH -of_objects [ipx::current_core]]
ipgui::add_param -name {DATAWIDTH} -component [ipx::current_core]
set_property display_name {Datawidth} [ipgui::get_guiparamspec -name "DATAWIDTH" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "DATAWIDTH" -component [ipx::current_core] ]
set_property value 64 [ipx::get_user_parameters DATAWIDTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_user_parameters DATAWIDTH -of_objects [ipx::current_core]]
set_property value_validation_type range_long [ipx::get_user_parameters DATAWIDTH -of_objects [ipx::current_core]]
set_property value_validation_range_minimum 0 [ipx::get_user_parameters DATAWIDTH -of_objects [ipx::current_core]]
set_property value_validation_range_maximum 64 [ipx::get_user_parameters DATAWIDTH -of_objects [ipx::current_core]]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "DWIDTH" -component [ipx::current_core] ]
set_property enablement_value false [ipx::get_user_parameters DWIDTH -of_objects [ipx::current_core]]
set_property value_tcl_expr {$DATAWIDTH*8} [ipx::get_user_parameters DWIDTH -of_objects [ipx::current_core]]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "DWIDTH" -component [ipx::current_core] ]
set_property display_name {Datawidth (in bytes)} [ipgui::get_guiparamspec -name "DATAWIDTH" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "DATAWIDTH" -component [ipx::current_core] ]
set_property display_name {Enable Data} [ipgui::get_guiparamspec -name "EN_DATA" -component [ipx::current_core] ]
set_property widget {checkBox} [ipgui::get_guiparamspec -name "EN_DATA" -component [ipx::current_core] ]
set_property display_name {Enable Keep} [ipgui::get_guiparamspec -name "EN_KEEP" -component [ipx::current_core] ]
set_property widget {checkBox} [ipgui::get_guiparamspec -name "EN_KEEP" -component [ipx::current_core] ]
set_property display_name {Enable Last} [ipgui::get_guiparamspec -name "EN_LAST" -component [ipx::current_core] ]
set_property widget {checkBox} [ipgui::get_guiparamspec -name "EN_LAST" -component [ipx::current_core] ]
set_property display_name {Enable Ready} [ipgui::get_guiparamspec -name "EN_READY" -component [ipx::current_core] ]
set_property widget {checkBox} [ipgui::get_guiparamspec -name "EN_READY" -component [ipx::current_core] ]
set_property display_name {Enable Loopback} [ipgui::get_guiparamspec -name "EN_LOOPBACK" -component [ipx::current_core] ]
set_property widget {checkBox} [ipgui::get_guiparamspec -name "EN_LOOPBACK" -component [ipx::current_core] ]
ipgui::remove_param -component [ipx::current_core] [ipgui::get_guiparamspec -name "DWIDTH" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 0 [ipgui::get_guiparamspec -name "DATAWIDTH" -component [ipx::current_core]] -parent [ipgui::get_pagespec -name "Page 0" -component [ipx::current_core]]
set_property enablement_dependency {$EN_LOOPBACK = true} [ipx::get_bus_interfaces from_app -of_objects [ipx::current_core]]
set_property driver_value 0 [ipx::get_ports rx_timeElapse_dbg -of_objects [ipx::current_core]]
set_property enablement_dependency {$EN_LOOPBACK = true} [ipx::get_ports rx_timeElapse_dbg -of_objects [ipx::current_core]]
set_property driver_value 0 [ipx::get_ports rx_timestamp_sum_dbg -of_objects [ipx::current_core]]
set_property enablement_dependency {$EN_LOOPBACK = true} [ipx::get_ports rx_timestamp_sum_dbg -of_objects [ipx::current_core]]
set_property driver_value 0 [ipx::get_ports pkt_cnt_rx_dbg -of_objects [ipx::current_core]]
set_property enablement_dependency {$EN_LOOPBACK = true} [ipx::get_ports pkt_cnt_rx_dbg -of_objects [ipx::current_core]]
set_property driver_value 0 [ipx::get_ports mismatch_dbg -of_objects [ipx::current_core]]
set_property enablement_dependency {$EN_LOOPBACK = true} [ipx::get_ports mismatch_dbg -of_objects [ipx::current_core]]
set_property enablement_dependency {$EN_DATA = true && $EN_LOOPBACK == true} [ipx::get_ports from_app_tdata -of_objects [ipx::current_core]]
set_property enablement_dependency {$EN_KEEP = true && $EN_LOOPBACK == true} [ipx::get_ports from_app_tkeep -of_objects [ipx::current_core]]
set_property driver_value 1 [ipx::get_ports to_app_tkeep -of_objects [ipx::current_core]]
set_property enablement_dependency {$EN_KEEP = true} [ipx::get_ports to_app_tkeep -of_objects [ipx::current_core]]
set_property driver_value 0 [ipx::get_ports to_app_tdata -of_objects [ipx::current_core]]
set_property enablement_dependency {$EN_DATA = true} [ipx::get_ports to_app_tdata -of_objects [ipx::current_core]]
set_property enablement_dependency {$EN_LAST = true && $EN_LOOPBACK == true} [ipx::get_ports from_app_tlast -of_objects [ipx::current_core]]
set_property driver_value 0 [ipx::get_ports to_app_tlast -of_objects [ipx::current_core]]
set_property enablement_dependency {$EN_LAST = true} [ipx::get_ports to_app_tlast -of_objects [ipx::current_core]]
set_property driver_value 1 [ipx::get_ports from_app_tready -of_objects [ipx::current_core]]
set_property enablement_dependency {$EN_READY = true && $EN_LOOPBACK == true} [ipx::get_ports from_app_tready -of_objects [ipx::current_core]]
set_property enablement_dependency {$EN_READY = true} [ipx::get_ports to_app_tready -of_objects [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 0 [ipgui::get_guiparamspec -name "EN_LOOPBACK" -component [ipx::current_core]]
set_property supported_families {virtexu Beta virtexuplus Beta virtexuplusHBM Beta zynquplus Beta kintexu Beta kintexuplus Beta} [ipx::current_core]
set_property enablement_dependency {$EN_LOOPBACK = true} [ipx::get_bus_interfaces to_cmp_fifo -of_objects [ipx::current_core]]
set_property enablement_dependency {$EN_LOOPBACK = true} [ipx::get_bus_interfaces from_cmp_fifo -of_objects [ipx::current_core]]
set_property core_revision 2 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
set_property ip_repo_paths [list "${project_dir}/../hls_ips" "${project_dir}/../interfaces"] [current_project]
update_ip_catalog
ipx::merge_project_changes files [ipx::current_core]
ipx::check_integrity -quiet [ipx::current_core]
ipx::archive_core $project_dir/$project_name/${project_name}.srcs/sources_1/bd/${project_name}/${project_name}_1.0.zip [ipx::current_core]
#close_project
#exit
