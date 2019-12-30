################################################################
# This is a generated script based on design: SD_AXIS_traffic_gen_ex
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# START
################################################################

# Hierarchical cell: traffic_clk_src
proc create_hier_cell_traffic_clk_src { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_traffic_clk_src() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 traffic_clk


  # Create pins
  create_bd_pin -dir I -type rst ext_reset_in
  create_bd_pin -dir O -from 0 -to 0 -type rst interconnect_aresetn
  create_bd_pin -dir O -from 0 -to 0 -type rst peripheral_reset
  create_bd_pin -dir O -from 0 -to 0 -type clk traffic_clk

  # Create instance: BUFG, and set properties
  set BUFG [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 BUFG ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {BUFG} \
 ] $BUFG

  # Create instance: IBUFDS, and set properties
  set IBUFDS [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 IBUFDS ]

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ addip proc_sys_reset proc_sys_reset_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins traffic_clk] [get_bd_intf_pins IBUFDS/CLK_IN_D]

  # Create port connections
  connect_bd_net -net BUFG_BUFG_O [get_bd_pins traffic_clk] [get_bd_pins BUFG/BUFG_O] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
  connect_bd_net -net ext_reset_in_1 [get_bd_pins ext_reset_in] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins interconnect_aresetn] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_reset [get_bd_pins peripheral_reset] [get_bd_pins proc_sys_reset_0/peripheral_reset]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT [get_bd_pins BUFG/BUFG_I] [get_bd_pins IBUFDS/IBUF_OUT]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: software
proc create_hier_cell_software { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_software() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_LITE

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_clk_DS

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pcie_mgt_0


  # Create pins
  create_bd_pin -dir O -type clk axi_aclk
  create_bd_pin -dir O -type rst axi_aresetn
  create_bd_pin -dir I -type rst ext_rstn

  # Create instance: pcie_clk_buf, and set properties
  set pcie_clk_buf [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 pcie_clk_buf ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {IBUFDSGTE} \
 ] $pcie_clk_buf

  # Create instance: xdma_0, and set properties
  set xdma_0 [ addip xdma xdma_0 ]
  set_property -dict [ list \
   CONFIG.PF0_DEVICE_ID_mqdma {903F} \
   CONFIG.PF2_DEVICE_ID_mqdma {903F} \
   CONFIG.PF3_DEVICE_ID_mqdma {903F} \
   CONFIG.axi_data_width {512_bit} \
   CONFIG.axilite_master_en {true} \
   CONFIG.cfg_mgmt_if {false} \
   CONFIG.coreclk_freq {500} \
   CONFIG.pcie_blk_locn {X1Y0} \
   CONFIG.pf0_device_id {903F} \
   CONFIG.pf0_msix_cap_pba_bir {BAR_1} \
   CONFIG.pf0_msix_cap_table_bir {BAR_1} \
   CONFIG.pl_link_cap_max_link_speed {8.0_GT/s} \
   CONFIG.pl_link_cap_max_link_width {X16} \
   CONFIG.plltype {QPLL1} \
   CONFIG.select_quad {GTH_Quad_227} \
 ] $xdma_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins pcie_clk_DS] [get_bd_intf_pins pcie_clk_buf/CLK_IN_D]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M_AXI_LITE] [get_bd_intf_pins xdma_0/M_AXI_LITE]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins M_AXI] [get_bd_intf_pins xdma_0/M_AXI]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins pcie_mgt_0] [get_bd_intf_pins xdma_0/pcie_mgt]

  # Create port connections
  connect_bd_net -net ext_rstn_1 [get_bd_pins ext_rstn] [get_bd_pins xdma_0/sys_rst_n]
  connect_bd_net -net pcie_clk_buf_IBUF_DS_ODIV2 [get_bd_pins pcie_clk_buf/IBUF_DS_ODIV2] [get_bd_pins xdma_0/sys_clk]
  connect_bd_net -net pcie_clk_buf_IBUF_OUT [get_bd_pins pcie_clk_buf/IBUF_OUT] [get_bd_pins xdma_0/sys_clk_gt]
  connect_bd_net -net xdma_0_axi_aclk [get_bd_pins axi_aclk] [get_bd_pins xdma_0/axi_aclk]
  connect_bd_net -net xdma_0_axi_aresetn [get_bd_pins axi_aresetn] [get_bd_pins xdma_0/axi_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: memory
proc create_hier_cell_memory { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_memory() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 C0_DDR4_0

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 ddr_clk_DS

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 to_mem


  # Create pins
  create_bd_pin -dir O -type clk mem_clk
  create_bd_pin -dir O -from 0 -to 0 -type rst mem_rstn

  # Create instance: ddr4_0, and set properties
  set ddr4_0 [ addip ddr4 ddr4_0 ]
  set_property -dict [ list \
   CONFIG.C0.CKE_WIDTH {2} \
   CONFIG.C0.CK_WIDTH {2} \
   CONFIG.C0.CS_WIDTH {2} \
   CONFIG.C0.DDR4_AxiAddressWidth {34} \
   CONFIG.C0.DDR4_AxiDataWidth {512} \
   CONFIG.C0.DDR4_CLKOUT0_DIVIDE {5} \
   CONFIG.C0.DDR4_CasLatency {15} \
   CONFIG.C0.DDR4_DataMask {DM_NO_DBI} \
   CONFIG.C0.DDR4_DataWidth {64} \
   CONFIG.C0.DDR4_Ecc {false} \
   CONFIG.C0.DDR4_InputClockPeriod {3001} \
   CONFIG.C0.DDR4_MemoryPart {MTA16ATF2G64HZ-2G3} \
   CONFIG.C0.DDR4_MemoryType {SODIMMs} \
   CONFIG.C0.DDR4_TimePeriod {938} \
   CONFIG.C0.ODT_WIDTH {2} \
 ] $ddr4_0

  # Create instance: proc_sys_reset_1, and set properties
  set proc_sys_reset_1 [ addip proc_sys_reset proc_sys_reset_1 ]

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ addip xlconstant xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins ddr_clk_DS] [get_bd_intf_pins ddr4_0/C0_SYS_CLK]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins to_mem] [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins C0_DDR4_0] [get_bd_intf_pins ddr4_0/C0_DDR4]

  # Create port connections
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins mem_clk] [get_bd_pins ddr4_0/c0_ddr4_ui_clk] [get_bd_pins proc_sys_reset_1/slowest_sync_clk]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk_sync_rst [get_bd_pins ddr4_0/c0_ddr4_ui_clk_sync_rst] [get_bd_pins proc_sys_reset_1/ext_reset_in]
  connect_bd_net -net proc_sys_reset_1_interconnect_aresetn [get_bd_pins mem_rstn] [get_bd_pins proc_sys_reset_1/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_1_peripheral_aresetn [get_bd_pins ddr4_0/c0_ddr4_aresetn] [get_bd_pins proc_sys_reset_1/peripheral_aresetn]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins ddr4_0/sys_rst] [get_bd_pins xlconstant_0/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: app
proc create_hier_cell_app { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_app() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 from_app

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 to_app

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 traffic_clk_DS


  # Create pins
  create_bd_pin -dir I -type rst ext_reset_in
  create_bd_pin -dir O -from 0 -to 0 -type clk traffic_clk
  create_bd_pin -dir O -from 0 -to 0 -type rst traffic_clk_rst
  create_bd_pin -dir O -from 0 -to 0 -type rst traffic_clk_rstn

  # Create instance: axis_register_slice_0, and set properties
  set axis_register_slice_0 [ addip axis_register_slice axis_register_slice_0 ]

  # Create instance: axis_register_slice_1, and set properties
  set axis_register_slice_1 [ addip axis_register_slice axis_register_slice_1 ]

  # Create instance: axis_register_slice_2, and set properties
  set axis_register_slice_2 [ addip axis_register_slice axis_register_slice_2 ]

  # Create instance: axis_register_slice_3, and set properties
  set axis_register_slice_3 [ addip axis_register_slice axis_register_slice_3 ]

  # Create instance: axis_register_slice_4, and set properties
  set axis_register_slice_4 [ addip axis_register_slice axis_register_slice_4 ]

  # Create instance: axis_register_slice_5, and set properties
  set axis_register_slice_5 [ addip axis_register_slice axis_register_slice_5 ]

  # Create instance: traffic_clk_src
  create_hier_cell_traffic_clk_src $hier_obj traffic_clk_src

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins traffic_clk_DS] [get_bd_intf_pins traffic_clk_src/traffic_clk]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins to_app] [get_bd_intf_pins axis_register_slice_0/S_AXIS]
  connect_bd_intf_net -intf_net axis_register_slice_0_M_AXIS [get_bd_intf_pins axis_register_slice_0/M_AXIS] [get_bd_intf_pins axis_register_slice_1/S_AXIS]
  connect_bd_intf_net -intf_net axis_register_slice_1_M_AXIS [get_bd_intf_pins axis_register_slice_1/M_AXIS] [get_bd_intf_pins axis_register_slice_2/S_AXIS]
  connect_bd_intf_net -intf_net axis_register_slice_2_M_AXIS [get_bd_intf_pins axis_register_slice_2/M_AXIS] [get_bd_intf_pins axis_register_slice_3/S_AXIS]
  connect_bd_intf_net -intf_net axis_register_slice_3_M_AXIS [get_bd_intf_pins axis_register_slice_3/M_AXIS] [get_bd_intf_pins axis_register_slice_4/S_AXIS]
  connect_bd_intf_net -intf_net axis_register_slice_4_M_AXIS [get_bd_intf_pins axis_register_slice_4/M_AXIS] [get_bd_intf_pins axis_register_slice_5/S_AXIS]
  connect_bd_intf_net -intf_net axis_register_slice_5_M_AXIS [get_bd_intf_pins from_app] [get_bd_intf_pins axis_register_slice_5/M_AXIS]

  # Create port connections
  connect_bd_net -net aclk_1 [get_bd_pins traffic_clk] [get_bd_pins axis_register_slice_0/aclk] [get_bd_pins axis_register_slice_1/aclk] [get_bd_pins axis_register_slice_2/aclk] [get_bd_pins axis_register_slice_3/aclk] [get_bd_pins axis_register_slice_4/aclk] [get_bd_pins axis_register_slice_5/aclk] [get_bd_pins traffic_clk_src/traffic_clk]
  connect_bd_net -net ext_reset_in_1 [get_bd_pins ext_reset_in] [get_bd_pins traffic_clk_src/ext_reset_in]
  connect_bd_net -net traffic_clk_src_interconnect_aresetn [get_bd_pins traffic_clk_rstn] [get_bd_pins axis_register_slice_0/aresetn] [get_bd_pins axis_register_slice_1/aresetn] [get_bd_pins axis_register_slice_2/aresetn] [get_bd_pins axis_register_slice_3/aresetn] [get_bd_pins axis_register_slice_4/aresetn] [get_bd_pins axis_register_slice_5/aresetn] [get_bd_pins traffic_clk_src/interconnect_aresetn]
  connect_bd_net -net traffic_clk_src_peripheral_reset [get_bd_pins traffic_clk_rst] [get_bd_pins traffic_clk_src/peripheral_reset]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: SD_traffic_gen
proc create_hier_cell_SD_traffic_gen { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_SD_traffic_gen() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 from_app

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_clk_DS

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pcie_mgt_0

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 to_app

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 to_mem


  # Create pins
  create_bd_pin -dir I -type rst ext_rstn
  create_bd_pin -dir I -type clk mem_clk
  create_bd_pin -dir I -type rst mem_rstn
  create_bd_pin -dir I -type clk traffic_clk
  create_bd_pin -dir I -type rst traffic_clk_rst
  create_bd_pin -dir I -from 0 -to 0 -type rst traffic_clk_rstn

  # Create instance: SD_AXIS_traffic_gen_0, and set properties
  set SD_AXIS_traffic_gen_0 [ addip SD_AXIS_traffic_gen SD_AXIS_traffic_gen_0 ]

  # Create instance: axi_clock_converter_0, and set properties
  set axi_clock_converter_0 [ addip axi_clock_converter axi_clock_converter_0 ]

  # Create instance: axi_interconnect_2, and set properties
  set axi_interconnect_2 [ addip axi_interconnect axi_interconnect_2 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {2} \
 ] $axi_interconnect_2

  # Create instance: cmp_fifo, and set properties
  set cmp_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 cmp_fifo ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {64} \
 ] $cmp_fifo

  # Create instance: software
  create_hier_cell_software $hier_obj software

  # Create instance: system_ila_0, and set properties
  set system_ila_0 [ addip system_ila system_ila_0 ]
  set_property -dict [ list \
   CONFIG.C_BRAM_CNT {42} \
   CONFIG.C_NUM_MONITOR_SLOTS {4} \
   CONFIG.C_SLOT {3} \
   CONFIG.C_SLOT_0_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
   CONFIG.C_SLOT_1_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
   CONFIG.C_SLOT_2_INTF_TYPE {clarkshen.com:user:SD_AXIS_dbg_rtl:1.0} \
   CONFIG.C_SLOT_3_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
 ] $system_ila_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins to_mem] [get_bd_intf_pins axi_interconnect_2/M00_AXI]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins pcie_clk_DS] [get_bd_intf_pins software/pcie_clk_DS]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins pcie_mgt_0] [get_bd_intf_pins software/pcie_mgt_0]
  connect_bd_intf_net -intf_net Conn7 [get_bd_intf_pins from_app] [get_bd_intf_pins SD_AXIS_traffic_gen_0/from_app]
  connect_bd_intf_net -intf_net [get_bd_intf_nets Conn7] [get_bd_intf_pins from_app] [get_bd_intf_pins system_ila_0/SLOT_1_AXIS]
  connect_bd_intf_net -intf_net Conn8 [get_bd_intf_pins to_app] [get_bd_intf_pins SD_AXIS_traffic_gen_0/to_app]
  connect_bd_intf_net -intf_net [get_bd_intf_nets Conn8] [get_bd_intf_pins to_app] [get_bd_intf_pins system_ila_0/SLOT_0_AXIS]
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins axi_interconnect_2/S00_AXI] [get_bd_intf_pins software/M_AXI]
  connect_bd_intf_net -intf_net S01_AXI_1 [get_bd_intf_pins SD_AXIS_traffic_gen_0/to_mem] [get_bd_intf_pins axi_interconnect_2/S01_AXI]
  connect_bd_intf_net -intf_net SD_AXIS_traffic_gen_0_to_cmp_fifo [get_bd_intf_pins SD_AXIS_traffic_gen_0/to_cmp_fifo] [get_bd_intf_pins cmp_fifo/S_AXIS]
  connect_bd_intf_net -intf_net SD_AXIS_traffic_gen_0_user_SD_AXIS_dbg [get_bd_intf_pins SD_AXIS_traffic_gen_0/user_SD_AXIS_dbg] [get_bd_intf_pins system_ila_0/SLOT_2_SD_AXIS_DBG]
  connect_bd_intf_net -intf_net axi_clock_converter_0_M_AXI [get_bd_intf_pins SD_AXIS_traffic_gen_0/s_axilite_ctrl] [get_bd_intf_pins axi_clock_converter_0/M_AXI]
  connect_bd_intf_net -intf_net cmp_fifo_M_AXIS [get_bd_intf_pins SD_AXIS_traffic_gen_0/from_cmp_fifo] [get_bd_intf_pins cmp_fifo/M_AXIS]
  connect_bd_intf_net -intf_net [get_bd_intf_nets cmp_fifo_M_AXIS] [get_bd_intf_pins cmp_fifo/M_AXIS] [get_bd_intf_pins system_ila_0/SLOT_3_AXIS]
  connect_bd_intf_net -intf_net software_M_AXI_LITE [get_bd_intf_pins axi_clock_converter_0/S_AXI] [get_bd_intf_pins software/M_AXI_LITE]

  # Create port connections
  connect_bd_net -net DDR_c0_ddr4_ui_clk [get_bd_pins mem_clk] [get_bd_pins SD_AXIS_traffic_gen_0/mem_clk] [get_bd_pins axi_interconnect_2/ACLK] [get_bd_pins axi_interconnect_2/M00_ACLK] [get_bd_pins axi_interconnect_2/S01_ACLK]
  connect_bd_net -net DDR_interconnect_aresetn [get_bd_pins mem_rstn] [get_bd_pins axi_interconnect_2/ARESETN] [get_bd_pins axi_interconnect_2/M00_ARESETN] [get_bd_pins axi_interconnect_2/S01_ARESETN]
  connect_bd_net -net M02_ARESETN_1 [get_bd_pins traffic_clk_rstn] [get_bd_pins axi_clock_converter_0/m_axi_aresetn] [get_bd_pins cmp_fifo/s_axis_aresetn] [get_bd_pins system_ila_0/resetn]
  connect_bd_net -net S00_ACLK_1 [get_bd_pins axi_clock_converter_0/s_axi_aclk] [get_bd_pins axi_interconnect_2/S00_ACLK] [get_bd_pins software/axi_aclk]
  connect_bd_net -net S00_ARESETN_1 [get_bd_pins axi_clock_converter_0/s_axi_aresetn] [get_bd_pins axi_interconnect_2/S00_ARESETN] [get_bd_pins software/axi_aresetn]
  connect_bd_net -net ext_rstn_1 [get_bd_pins ext_rstn] [get_bd_pins software/ext_rstn]
  connect_bd_net -net rst_1 [get_bd_pins traffic_clk_rst] [get_bd_pins SD_AXIS_traffic_gen_0/rst]
  connect_bd_net -net traffic_clk_1 [get_bd_pins traffic_clk] [get_bd_pins SD_AXIS_traffic_gen_0/traffic_clk] [get_bd_pins axi_clock_converter_0/m_axi_aclk] [get_bd_pins cmp_fifo/s_axis_aclk] [get_bd_pins system_ila_0/clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set C0_DDR4_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 C0_DDR4_0 ]

  set ddr_clk_DS [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 ddr_clk_DS ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {333111111} \
   ] $ddr_clk_DS

  set pcie_clk_DS [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_clk_DS ]

  set pcie_mgt_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pcie_mgt_0 ]

  set traffic_clk_DS [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 traffic_clk_DS ]


  # Create ports
  set ext_rstn [ create_bd_port -dir I -type rst ext_rstn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $ext_rstn

  # Create instance: SD_traffic_gen
  create_hier_cell_SD_traffic_gen [current_bd_instance .] SD_traffic_gen

  # Create instance: app
  create_hier_cell_app [current_bd_instance .] app

  # Create instance: memory
  create_hier_cell_memory [current_bd_instance .] memory

  # Create interface connections
  connect_bd_intf_net -intf_net C0_DDR4_S_AXI_1 [get_bd_intf_pins SD_traffic_gen/to_mem] [get_bd_intf_pins memory/to_mem]
  connect_bd_intf_net -intf_net C0_SYS_CLK_0_1 [get_bd_intf_ports ddr_clk_DS] [get_bd_intf_pins memory/ddr_clk_DS]
  connect_bd_intf_net -intf_net CLK_IN_D_0_1 [get_bd_intf_ports pcie_clk_DS] [get_bd_intf_pins SD_traffic_gen/pcie_clk_DS]
  connect_bd_intf_net -intf_net DDR_C0_DDR4_0 [get_bd_intf_ports C0_DDR4_0] [get_bd_intf_pins memory/C0_DDR4_0]
  connect_bd_intf_net -intf_net SD_AXIS_traffic_gen_0_to_app [get_bd_intf_pins SD_traffic_gen/to_app] [get_bd_intf_pins app/to_app]
  connect_bd_intf_net -intf_net SD_traffic_gen_pcie_mgt_0 [get_bd_intf_ports pcie_mgt_0] [get_bd_intf_pins SD_traffic_gen/pcie_mgt_0]
  connect_bd_intf_net -intf_net fake_app_M_AXIS [get_bd_intf_pins SD_traffic_gen/from_app] [get_bd_intf_pins app/from_app]
  connect_bd_intf_net -intf_net traffic_clk_DS_1 [get_bd_intf_ports traffic_clk_DS] [get_bd_intf_pins app/traffic_clk_DS]

  # Create port connections
  connect_bd_net -net DDR_c0_ddr4_ui_clk [get_bd_pins SD_traffic_gen/mem_clk] [get_bd_pins memory/mem_clk]
  connect_bd_net -net DDR_interconnect_aresetn [get_bd_pins SD_traffic_gen/mem_rstn] [get_bd_pins memory/mem_rstn]
  connect_bd_net -net M02_ARESETN_1 [get_bd_pins SD_traffic_gen/traffic_clk_rstn] [get_bd_pins app/traffic_clk_rstn]
  connect_bd_net -net Net [get_bd_pins SD_traffic_gen/traffic_clk] [get_bd_pins app/traffic_clk]
  connect_bd_net -net ext_reset_in_0_1 [get_bd_ports ext_rstn] [get_bd_pins SD_traffic_gen/ext_rstn] [get_bd_pins app/ext_reset_in]
  connect_bd_net -net rst_1 [get_bd_pins SD_traffic_gen/traffic_clk_rst] [get_bd_pins app/traffic_clk_rst]

  # Create address segments
  create_bd_addr_seg -range 0x000400000000 -offset 0x00000000 [get_bd_addr_spaces SD_traffic_gen/SD_AXIS_traffic_gen_0/to_mem] [get_bd_addr_segs memory/ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] SEG_ddr4_0_C0_DDR4_ADDRESS_BLOCK
  create_bd_addr_seg -range 0x00010000 -offset 0x00000000 [get_bd_addr_spaces SD_traffic_gen/software/xdma_0/M_AXI_LITE] [get_bd_addr_segs SD_traffic_gen/SD_AXIS_traffic_gen_0/s_axilite_ctrl/reg0] SEG_SD_AXIS_traffic_gen_0_reg0
  create_bd_addr_seg -range 0x000400000000 -offset 0x00000000 [get_bd_addr_spaces SD_traffic_gen/software/xdma_0/M_AXI] [get_bd_addr_segs memory/ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] SEG_ddr4_0_C0_DDR4_ADDRESS_BLOCK


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""

