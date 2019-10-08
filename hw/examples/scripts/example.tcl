set project_dir [file dirname [file dirname [file normalize [info script]]]]
set project_name "SD_AXIS_traffic_gen_ex"
set script_dir [file dirname [file normalize [info script]]]
source $script_dir/util.tcl

create_project $project_name $project_dir/$project_name -part xczu19eg-ffvc1760-2-i
create_bd_design $project_name
set_property ip_repo_paths "${project_dir}/../ip_repo" [current_project]
update_ip_catalog -rebuild


####xmda##############################################################################
current_bd_instance "/"
create_bd_cell -type hier "xdma_wrap"
current_bd_instance "/xdma_wrap"
# Create interface pins
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_LITE
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pcie_mgt_0
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 sys

# Create pins
create_bd_pin -dir O -type clk axi_aclk
create_bd_pin -dir O -type rst axi_aresetn
create_bd_pin -dir I -type rst sys_rst_n
create_bd_pin -dir I -from 0 -to 0 usr_irq_req

# Create instance: util_ds_buf_0, and set properties
set gt_buf [create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_0]
set_property -dict [ list CONFIG.C_BUF_TYPE {IBUFDSGTE} ] "$gt_buf"

set xdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xdma:4.1 xdma_0 ]
set_property -dict [ list \
	CONFIG.PF0_DEVICE_ID_mqdma {903F} \
	CONFIG.PF2_DEVICE_ID_mqdma {903F} \
	CONFIG.PF3_DEVICE_ID_mqdma {903F} \
	CONFIG.axi_data_width {512_bit} \
	CONFIG.axilite_master_en {true} \
	CONFIG.axisten_freq {250} \
	CONFIG.cfg_mgmt_if {false} \
	CONFIG.coreclk_freq {500} \
	CONFIG.pcie_blk_locn {X1Y0} \
	CONFIG.pf0_device_id {903F} \
	CONFIG.pf0_msix_cap_pba_bir {BAR_3:2} \
	CONFIG.pf0_msix_cap_table_bir {BAR_3:2} \
	CONFIG.pl_link_cap_max_link_speed {8.0_GT/s} \
	CONFIG.pl_link_cap_max_link_width {X16} \
	CONFIG.plltype {QPLL1} \
	CONFIG.ref_clk_freq {100_MHz} \
	CONFIG.select_quad {GTH_Quad_227} \
	CONFIG.xdma_pcie_64bit_en {true} \
] $xdma_0

# Create interface connections
connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins pcie_mgt_0] [get_bd_intf_pins xdma_0/pcie_mgt]
connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M_AXI] [get_bd_intf_pins xdma_0/M_AXI]
connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins M_AXI_LITE] [get_bd_intf_pins xdma_0/M_AXI_LITE]
connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins sys] [get_bd_intf_pins util_ds_buf_0/CLK_IN_D]

# Create port connections
connect_bd_net -net sys_rst_n_1 [get_bd_pins sys_rst_n] [get_bd_pins xdma_0/sys_rst_n]
connect_bd_net -net usr_irq_req_1 [get_bd_pins usr_irq_req] [get_bd_pins xdma_0/usr_irq_req]
connect_bd_net -net util_ds_buf_0_IBUF_DS_ODIV2 [get_bd_pins util_ds_buf_0/IBUF_DS_ODIV2] [get_bd_pins xdma_0/sys_clk]
connect_bd_net -net util_ds_buf_0_IBUF_OUT [get_bd_pins util_ds_buf_0/IBUF_OUT] [get_bd_pins xdma_0/sys_clk_gt]
connect_bd_net -net xdma_0_axi_aclk [get_bd_pins axi_aclk] [get_bd_pins xdma_0/axi_aclk]
connect_bd_net -net xdma_0_axi_aresetn [get_bd_pins axi_aresetn] [get_bd_pins xdma_0/axi_aresetn]
##########################################################

##ddr#####################################################
current_bd_instance "/"
create_bd_cell -type hier "ddr_wrap"
current_bd_instance "/ddr_wrap"

# Create interface pins
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 C0_DDR4_0
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 C0_DDR4_S_AXI
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 C0_SYS_CLK_0

# Create pins
create_bd_pin -dir O -type clk c0_ddr4_ui_clk
create_bd_pin -dir O -from 0 -to 0 -type rst interconnect_aresetn
create_bd_pin -dir I -type rst sys_rst

# Create instance: ddr4_0, and set properties
set ddr4_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4:2.2 ddr4_0 ]
set_property -dict [ list \
	CONFIG.C0.CKE_WIDTH {2} \
	CONFIG.C0.CK_WIDTH {2} \
	CONFIG.C0.CS_WIDTH {2} \
	CONFIG.C0.DDR4_AxiAddressWidth {34} \
	CONFIG.C0.DDR4_AxiDataWidth {512} \
	CONFIG.C0.DDR4_CLKOUT0_DIVIDE {5} \
	CONFIG.C0.DDR4_CasLatency {15} \
	CONFIG.C0.DDR4_DataWidth {64} \
	CONFIG.C0.DDR4_InputClockPeriod {3001} \
	CONFIG.C0.DDR4_MemoryPart {MTA16ATF2G64HZ-2G3} \
	CONFIG.C0.DDR4_MemoryType {SODIMMs} \
	CONFIG.C0.DDR4_TimePeriod {938} \
	CONFIG.C0.ODT_WIDTH {2} \
] $ddr4_0

# Create instance: proc_sys_reset_0, and set properties
set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

# Create interface connections
connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins C0_DDR4_0] [get_bd_intf_pins ddr4_0/C0_DDR4]
connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins C0_DDR4_S_AXI] [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI]
connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins C0_SYS_CLK_0] [get_bd_intf_pins ddr4_0/C0_SYS_CLK]

# Create port connections
connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins c0_ddr4_ui_clk] [get_bd_pins ddr4_0/c0_ddr4_ui_clk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
connect_bd_net -net ddr4_0_c0_ddr4_ui_clk_sync_rst [get_bd_pins ddr4_0/c0_ddr4_ui_clk_sync_rst] [get_bd_pins proc_sys_reset_0/ext_reset_in]
connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins interconnect_aresetn] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins ddr4_0/c0_ddr4_aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net -net sys_rst_1 [get_bd_pins sys_rst] [get_bd_pins ddr4_0/sys_rst]
##########################################################

##cmp fifo################################################
current_bd_instance "/"
create_bd_cell -type hier "cmp_fifo"
current_bd_instance "/cmp_fifo"
# Create interface pins
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS
# Create pins
create_bd_pin -dir I -from 0 -to 0 rst
create_bd_pin -dir I -type clk clk

create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_0
set_property -dict [list CONFIG.FIFO_DEPTH {2048}] [get_bd_cells axis_data_fifo_0]
create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0
set_property -dict [list CONFIG.C_SIZE {1} CONFIG.C_OPERATION {not} CONFIG.LOGO_FILE {data/sym_notgate.png}] [get_bd_cells util_vector_logic_0]

connect_bd_intf_net [get_bd_intf_pins S_AXIS] [get_bd_intf_pins axis_data_fifo_0/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins M_AXIS] [get_bd_intf_pins axis_data_fifo_0/M_AXIS]
connect_bd_net [get_bd_pins clk] [get_bd_pins axis_data_fifo_0/s_axis_aclk]
connect_bd_net [get_bd_pins rst] [get_bd_pins util_vector_logic_0/Op1]
connect_bd_net [get_bd_pins axis_data_fifo_0/s_axis_aresetn] [get_bd_pins util_vector_logic_0/Res]
##########################################################

##app#####################################################
current_bd_instance "/"
create_bd_cell -type hier "fake_app"
current_bd_instance "/fake_app"
# Create interface pins
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS
# Create pins
create_bd_pin -dir I -from 0 -to 0 rst
create_bd_pin -dir I -type clk clk
# Create instance: axis_register_slice_0, and set properties
set axis_register_slice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_register_slice:1.1 axis_register_slice_0 ]
# Create instance: axis_register_slice_1, and set properties
set axis_register_slice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_register_slice:1.1 axis_register_slice_1 ]
# Create instance: axis_register_slice_2, and set properties
set axis_register_slice_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_register_slice:1.1 axis_register_slice_2 ]
# Create instance: axis_register_slice_3, and set properties
set axis_register_slice_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_register_slice:1.1 axis_register_slice_3 ]
# Create instance: axis_register_slice_4, and set properties
set axis_register_slice_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_register_slice:1.1 axis_register_slice_4 ]
# Create instance: axis_register_slice_5, and set properties
set axis_register_slice_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_register_slice:1.1 axis_register_slice_5 ]
# Create instance: util_vector_logic_0, and set properties
set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
set_property -dict [ list \
	CONFIG.C_OPERATION {not} \
	CONFIG.C_SIZE {1} \
	CONFIG.LOGO_FILE {data/sym_notgate.png} \
] $util_vector_logic_0

connect_bd_intf_net [get_bd_intf_pins S_AXIS] [get_bd_intf_pins axis_register_slice_0/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_register_slice_0/M_AXIS] [get_bd_intf_pins axis_register_slice_1/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_register_slice_1/M_AXIS] [get_bd_intf_pins axis_register_slice_2/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_register_slice_2/M_AXIS] [get_bd_intf_pins axis_register_slice_3/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_register_slice_3/M_AXIS] [get_bd_intf_pins axis_register_slice_4/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_register_slice_4/M_AXIS] [get_bd_intf_pins axis_register_slice_5/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins M_AXIS] [get_bd_intf_pins axis_register_slice_5/M_AXIS]
connect_bd_net [get_bd_pins clk] [get_bd_pins axis_register_slice_0/aclk]
connect_bd_net [get_bd_pins clk] [get_bd_pins axis_register_slice_1/aclk]
connect_bd_net [get_bd_pins clk] [get_bd_pins axis_register_slice_2/aclk]
connect_bd_net [get_bd_pins clk] [get_bd_pins axis_register_slice_3/aclk]
connect_bd_net [get_bd_pins clk] [get_bd_pins axis_register_slice_4/aclk]
connect_bd_net [get_bd_pins clk] [get_bd_pins axis_register_slice_5/aclk]
connect_bd_net [get_bd_pins util_vector_logic_0/Res] [get_bd_pins axis_register_slice_0/aresetn]
connect_bd_net [get_bd_pins util_vector_logic_0/Res] [get_bd_pins axis_register_slice_1/aresetn]
connect_bd_net [get_bd_pins util_vector_logic_0/Res] [get_bd_pins axis_register_slice_2/aresetn]
connect_bd_net [get_bd_pins util_vector_logic_0/Res] [get_bd_pins axis_register_slice_3/aresetn]
connect_bd_net [get_bd_pins util_vector_logic_0/Res] [get_bd_pins axis_register_slice_4/aresetn]
connect_bd_net [get_bd_pins util_vector_logic_0/Res] [get_bd_pins axis_register_slice_5/aresetn]
connect_bd_net [get_bd_pins rst] [get_bd_pins util_vector_logic_0/Op1]
##########################################################

#connect top level logic
current_bd_instance "/"
make_bd_intf_pins_external [get_bd_intf_pins xdma_wrap/sys]
set_property name sys [get_bd_intf_ports sys_0]
make_bd_intf_pins_external [get_bd_intf_pins xdma_wrap/pcie_mgt_0]
make_bd_intf_pins_external [get_bd_intf_pins ddr_wrap/C0_DDR4_0]
set_property name C0_DDR4_0 [get_bd_intf_ports C0_DDR4_0_0]
make_bd_intf_pins_external  [get_bd_intf_pins ddr_wrap/C0_SYS_CLK_0]
set_property name C0_SYS_CLK_0 [get_bd_intf_ports C0_SYS_CLK_0_0]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 one
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 zero
set_property -dict [list CONFIG.CONST_VAL {0}] [get_bd_cells zero]
create_bd_cell -type ip -vlnv clarkshen.com:user:SD_AXIS_traffic_gen:1.0 SD_AXIS_traffic_gen_0
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0
set_property -dict [list CONFIG.NUM_SI {2} CONFIG.NUM_MI {1}] [get_bd_cells axi_interconnect_0]

connect_bd_net [get_bd_pins one/dout] [get_bd_pins xdma_wrap/sys_rst_n]
connect_bd_net [get_bd_pins zero/dout] [get_bd_pins xdma_wrap/usr_irq_req]
connect_bd_net [get_bd_pins zero/dout] [get_bd_pins ddr_wrap/sys_rst]
connect_bd_net [get_bd_pins zero/dout] [get_bd_pins SD_AXIS_traffic_gen_0/rst]

connect_bd_intf_net -boundary_type upper [get_bd_intf_pins xdma_wrap/M_AXI] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins SD_AXIS_traffic_gen_0/to_ddr] -boundary_type upper [get_bd_intf_pins axi_interconnect_0/S01_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins ddr_wrap/C0_DDR4_S_AXI]
connect_bd_intf_net [get_bd_intf_pins SD_AXIS_traffic_gen_0/to_cmp_fifo] -boundary_type upper [get_bd_intf_pins cmp_fifo/S_AXIS]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins cmp_fifo/M_AXIS] [get_bd_intf_pins SD_AXIS_traffic_gen_0/from_cmp_fifo]

connect_bd_intf_net [get_bd_intf_pins SD_AXIS_traffic_gen_0/to_app] -boundary_type upper [get_bd_intf_pins fake_app/S_AXIS]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins fake_app/M_AXIS] [get_bd_intf_pins SD_AXIS_traffic_gen_0/from_app]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins xdma_wrap/M_AXI_LITE] [get_bd_intf_pins SD_AXIS_traffic_gen_0/s_axilite_ctrl]

connect_bd_net [get_bd_pins xdma_wrap/axi_aclk] [get_bd_pins axi_interconnect_0/S00_ACLK] -boundary_type upper
connect_bd_net [get_bd_pins SD_AXIS_traffic_gen_0/traffic_clk] [get_bd_pins xdma_wrap/axi_aclk]
connect_bd_net [get_bd_pins fake_app/clk] [get_bd_pins xdma_wrap/axi_aclk] -boundary_type upper
connect_bd_net [get_bd_pins cmp_fifo/clk] [get_bd_pins xdma_wrap/axi_aclk] -boundary_type upper

connect_bd_net [get_bd_pins ddr_wrap/c0_ddr4_ui_clk] [get_bd_pins axi_interconnect_0/ACLK] -boundary_type upper
connect_bd_net [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins ddr_wrap/c0_ddr4_ui_clk] -boundary_type upper
connect_bd_net [get_bd_pins axi_interconnect_0/S01_ACLK] [get_bd_pins ddr_wrap/c0_ddr4_ui_clk] -boundary_type upper
connect_bd_net [get_bd_pins ddr_wrap/c0_ddr4_ui_clk] [get_bd_pins SD_AXIS_traffic_gen_0/ddr_clk]

connect_bd_net [get_bd_pins ddr_wrap/interconnect_aresetn] [get_bd_pins axi_interconnect_0/ARESETN] -boundary_type upper
connect_bd_net [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins ddr_wrap/interconnect_aresetn] -boundary_type upper
connect_bd_net [get_bd_pins axi_interconnect_0/S01_ARESETN] [get_bd_pins ddr_wrap/interconnect_aresetn] -boundary_type upper

connect_bd_net [get_bd_pins xdma_wrap/axi_aresetn] [get_bd_pins axi_interconnect_0/S00_ARESETN] -boundary_type upper

connect_bd_net [get_bd_pins SD_AXIS_traffic_gen_0/rst_out] [get_bd_pins cmp_fifo/rst]
connect_bd_net [get_bd_pins SD_AXIS_traffic_gen_0/rst_out] [get_bd_pins fake_app/rst]

create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 system_ila_0
set_property -dict [list CONFIG.C_SLOT {1} CONFIG.C_BRAM_CNT {6.5} CONFIG.C_NUM_MONITOR_SLOTS {2} CONFIG.C_SLOT_0_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} CONFIG.C_SLOT_1_INTF_TYPE {clarkshen.com:user:SD_AXIS_dbg_rtl:1.0}] [get_bd_cells system_ila_0]
connect_bd_intf_net [get_bd_intf_pins system_ila_0/SLOT_0_AXIS] -boundary_type upper [get_bd_intf_pins fake_app/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins system_ila_0/SLOT_1_SD_AXIS_DBG] [get_bd_intf_pins SD_AXIS_traffic_gen_0/user_SD_AXIS_dbg]
connect_bd_net [get_bd_pins system_ila_0/clk] [get_bd_pins xdma_wrap/axi_aclk]
connect_bd_net [get_bd_pins system_ila_0/resetn] [get_bd_pins one/dout]
set_property CONFIG.FREQ_HZ 333111111 [get_bd_intf_ports /C0_SYS_CLK_0]
assign_bd_address
set_property offset 0x00000000 [get_bd_addr_segs {xdma_wrap/xdma_0/M_AXI_LITE/SEG_SD_AXIS_traffic_gen_0_reg0}]
validate_bd_design
make_wrapper -files [get_files $project_dir/$project_name/${project_name}.srcs/sources_1/bd/${project_name}/${project_name}.bd] -top
add_files -norecurse $project_dir/$project_name/${project_name}.srcs/sources_1/bd/${project_name}/hdl/${project_name}_wrapper.v
save_bd_design
add_files -fileset constrs_1 -norecurse $project_dir/constraints/sidewinder100.xdc
close_project
exit
