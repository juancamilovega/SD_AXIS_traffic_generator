//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
//Date        : Tue Oct  8 03:15:44 2019
//Host        : owl running 64-bit Ubuntu 16.04.4 LTS
//Command     : generate_target SD_AXIS_traffic_gen_loopback_wrapper.bd
//Design      : SD_AXIS_traffic_gen_loopback_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module SD_AXIS_traffic_gen_loopback_wrapper
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
  input [511:0]from_app_tdata;
  input [63:0]from_app_tkeep;
  input [0:0]from_app_tlast;
  output [0:0]from_app_tready;
  input [0:0]from_app_tvalid;
  input [511:0]from_cmp_fifo_tdata;
  input [63:0]from_cmp_fifo_tkeep;
  input [0:0]from_cmp_fifo_tlast;
  output [0:0]from_cmp_fifo_tready;
  input [0:0]from_cmp_fifo_tvalid;
  output [0:0]mismatch;
  output [31:0]pkt_cnt_rx;
  input rst;
  output [31:0]rx_timeElapse;
  output [63:0]rx_timestamp_sum;
  input [31:0]time_cnt;
  input traffic_clk;

  wire [511:0]from_app_tdata;
  wire [63:0]from_app_tkeep;
  wire [0:0]from_app_tlast;
  wire [0:0]from_app_tready;
  wire [0:0]from_app_tvalid;
  wire [511:0]from_cmp_fifo_tdata;
  wire [63:0]from_cmp_fifo_tkeep;
  wire [0:0]from_cmp_fifo_tlast;
  wire [0:0]from_cmp_fifo_tready;
  wire [0:0]from_cmp_fifo_tvalid;
  wire [0:0]mismatch;
  wire [31:0]pkt_cnt_rx;
  wire rst;
  wire [31:0]rx_timeElapse;
  wire [63:0]rx_timestamp_sum;
  wire [31:0]time_cnt;
  wire traffic_clk;

  SD_AXIS_traffic_gen_loopback SD_AXIS_traffic_gen_loopback_i
       (.from_app_tdata(from_app_tdata),
        .from_app_tkeep(from_app_tkeep),
        .from_app_tlast(from_app_tlast),
        .from_app_tready(from_app_tready),
        .from_app_tvalid(from_app_tvalid),
        .from_cmp_fifo_tdata(from_cmp_fifo_tdata),
        .from_cmp_fifo_tkeep(from_cmp_fifo_tkeep),
        .from_cmp_fifo_tlast(from_cmp_fifo_tlast),
        .from_cmp_fifo_tready(from_cmp_fifo_tready),
        .from_cmp_fifo_tvalid(from_cmp_fifo_tvalid),
        .mismatch(mismatch),
        .pkt_cnt_rx(pkt_cnt_rx),
        .rst(rst),
        .rx_timeElapse(rx_timeElapse),
        .rx_timestamp_sum(rx_timestamp_sum),
        .time_cnt(time_cnt),
        .traffic_clk(traffic_clk));
endmodule
