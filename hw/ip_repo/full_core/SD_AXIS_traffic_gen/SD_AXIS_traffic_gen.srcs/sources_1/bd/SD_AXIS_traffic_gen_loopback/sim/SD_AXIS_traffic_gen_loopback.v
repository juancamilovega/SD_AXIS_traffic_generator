//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
//Date        : Tue Oct  8 03:15:44 2019
//Host        : owl running 64-bit Ubuntu 16.04.4 LTS
//Command     : generate_target SD_AXIS_traffic_gen_loopback.bd
//Design      : SD_AXIS_traffic_gen_loopback
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "SD_AXIS_traffic_gen_loopback,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SD_AXIS_traffic_gen_loopback,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "SD_AXIS_traffic_gen_loopback.hwdef" *) 
module SD_AXIS_traffic_gen_loopback
   (from_app_tdata,
    from_app_tkeep,
    from_app_tlast,
    from_app_tready,
    from_app_tvalid,
    from_cmp_fifo_tdata,
    from_cmp_fifo_tkeep,
    from_cmp_fifo_tlast,
    from_cmp_fifo_tready,
    from_cmp_fifo_tvalid,
    mismatch,
    pkt_cnt_rx,
    rst,
    rx_timeElapse,
    rx_timestamp_sum,
    time_cnt,
    traffic_clk);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_app " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME from_app, CLK_DOMAIN SD_AXIS_traffic_gen_loopback_ap_clk_0, FREQ_HZ 100000000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [511:0]from_app_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_app " *) input [63:0]from_app_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_app " *) input [0:0]from_app_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_app " *) output [0:0]from_app_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_app " *) input [0:0]from_app_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_cmp_fifo " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME from_cmp_fifo, CLK_DOMAIN SD_AXIS_traffic_gen_loopback_ap_clk_0, FREQ_HZ 100000000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [511:0]from_cmp_fifo_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_cmp_fifo " *) input [63:0]from_cmp_fifo_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_cmp_fifo " *) input [0:0]from_cmp_fifo_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_cmp_fifo " *) output [0:0]from_cmp_fifo_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_cmp_fifo " *) input [0:0]from_cmp_fifo_tvalid;
  output [0:0]mismatch;
  output [31:0]pkt_cnt_rx;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst;
  output [31:0]rx_timeElapse;
  output [63:0]rx_timestamp_sum;
  input [31:0]time_cnt;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.TRAFFIC_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.TRAFFIC_CLK, ASSOCIATED_BUSIF from_app:from_cmp_fifo, ASSOCIATED_RESET rst, CLK_DOMAIN SD_AXIS_traffic_gen_loopback_ap_clk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input traffic_clk;

  wire ap_clk_0_1;
  wire ap_rst_0_1;
  wire [511:0]from_app_0_1_TDATA;
  wire [63:0]from_app_0_1_TKEEP;
  wire [0:0]from_app_0_1_TLAST;
  wire [0:0]from_app_0_1_TREADY;
  wire [0:0]from_app_0_1_TVALID;
  wire [511:0]from_cmp_fifo_0_1_TDATA;
  wire [63:0]from_cmp_fifo_0_1_TKEEP;
  wire [0:0]from_cmp_fifo_0_1_TLAST;
  wire [0:0]from_cmp_fifo_0_1_TREADY;
  wire [0:0]from_cmp_fifo_0_1_TVALID;
  wire [31:0]time_cnt_0_1;
  wire [0:0]traffic_gen_rx_mismatch;
  wire [31:0]traffic_gen_rx_pkt_cnt_rx;
  wire [31:0]traffic_gen_rx_rx_timeElapse;
  wire [63:0]traffic_gen_rx_rx_timestamp_sum;

  assign ap_clk_0_1 = traffic_clk;
  assign ap_rst_0_1 = rst;
  assign from_app_0_1_TDATA = from_app_tdata[511:0];
  assign from_app_0_1_TKEEP = from_app_tkeep[63:0];
  assign from_app_0_1_TLAST = from_app_tlast[0];
  assign from_app_0_1_TVALID = from_app_tvalid[0];
  assign from_app_tready[0] = from_app_0_1_TREADY;
  assign from_cmp_fifo_0_1_TDATA = from_cmp_fifo_tdata[511:0];
  assign from_cmp_fifo_0_1_TKEEP = from_cmp_fifo_tkeep[63:0];
  assign from_cmp_fifo_0_1_TLAST = from_cmp_fifo_tlast[0];
  assign from_cmp_fifo_0_1_TVALID = from_cmp_fifo_tvalid[0];
  assign from_cmp_fifo_tready[0] = from_cmp_fifo_0_1_TREADY;
  assign mismatch[0] = traffic_gen_rx_mismatch;
  assign pkt_cnt_rx[31:0] = traffic_gen_rx_pkt_cnt_rx;
  assign rx_timeElapse[31:0] = traffic_gen_rx_rx_timeElapse;
  assign rx_timestamp_sum[63:0] = traffic_gen_rx_rx_timestamp_sum;
  assign time_cnt_0_1 = time_cnt[31:0];
  SD_AXIS_traffic_gen_loopback_traffic_gen_rx_0 traffic_gen_rx
       (.ap_clk(ap_clk_0_1),
        .ap_rst(ap_rst_0_1),
        .from_app_tdata(from_app_0_1_TDATA),
        .from_app_tkeep(from_app_0_1_TKEEP),
        .from_app_tlast(from_app_0_1_TLAST),
        .from_app_tready(from_app_0_1_TREADY),
        .from_app_tvalid(from_app_0_1_TVALID),
        .from_cmp_fifo_tdata(from_cmp_fifo_0_1_TDATA),
        .from_cmp_fifo_tkeep(from_cmp_fifo_0_1_TKEEP),
        .from_cmp_fifo_tlast(from_cmp_fifo_0_1_TLAST),
        .from_cmp_fifo_tready(from_cmp_fifo_0_1_TREADY),
        .from_cmp_fifo_tvalid(from_cmp_fifo_0_1_TVALID),
        .mismatch(traffic_gen_rx_mismatch),
        .pkt_cnt_rx(traffic_gen_rx_pkt_cnt_rx),
        .rx_timeElapse(traffic_gen_rx_rx_timeElapse),
        .rx_timestamp_sum(traffic_gen_rx_rx_timestamp_sum),
        .time_cnt(time_cnt_0_1));
endmodule
