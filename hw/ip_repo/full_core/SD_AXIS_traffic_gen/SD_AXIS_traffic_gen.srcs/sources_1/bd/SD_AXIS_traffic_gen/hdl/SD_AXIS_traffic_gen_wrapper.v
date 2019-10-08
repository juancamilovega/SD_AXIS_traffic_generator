//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
//Date        : Tue Oct  8 03:15:44 2019
//Host        : owl running 64-bit Ubuntu 16.04.4 LTS
//Command     : generate_target SD_AXIS_traffic_gen_wrapper.bd
//Design      : SD_AXIS_traffic_gen_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module SD_AXIS_traffic_gen_wrapper
   (ddr_clk,
    mismatch,
    pkt_cnt_rx,
    pkt_cnt_tx,
    rst_out,
    rstn,
    rx_timeElapse,
    rx_timestamp_sum,
    s_axilite_ctrl_araddr,
    s_axilite_ctrl_arready,
    s_axilite_ctrl_arvalid,
    s_axilite_ctrl_awaddr,
    s_axilite_ctrl_awready,
    s_axilite_ctrl_awvalid,
    s_axilite_ctrl_bready,
    s_axilite_ctrl_bresp,
    s_axilite_ctrl_bvalid,
    s_axilite_ctrl_rdata,
    s_axilite_ctrl_rready,
    s_axilite_ctrl_rresp,
    s_axilite_ctrl_rvalid,
    s_axilite_ctrl_wdata,
    s_axilite_ctrl_wready,
    s_axilite_ctrl_wstrb,
    s_axilite_ctrl_wvalid,
    start,
    time_cnt,
    to_app_tdata,
    to_app_tkeep,
    to_app_tlast,
    to_app_tready,
    to_app_tvalid,
    to_cmp_fifo_tdata,
    to_cmp_fifo_tkeep,
    to_cmp_fifo_tlast,
    to_cmp_fifo_tvalid,
    to_ddr_araddr,
    to_ddr_arburst,
    to_ddr_arcache,
    to_ddr_arlen,
    to_ddr_arprot,
    to_ddr_arready,
    to_ddr_arsize,
    to_ddr_aruser,
    to_ddr_arvalid,
    to_ddr_rdata,
    to_ddr_rlast,
    to_ddr_rready,
    to_ddr_rresp,
    to_ddr_rvalid,
    traffic_clk,
    transfer_length,
    tx_timeElapse,
    tx_timestamp_sum);
  input ddr_clk;
  input [0:0]mismatch;
  input [31:0]pkt_cnt_rx;
  output [31:0]pkt_cnt_tx;
  output [0:0]rst_out;
  input rstn;
  input [31:0]rx_timeElapse;
  input [63:0]rx_timestamp_sum;
  input [6:0]s_axilite_ctrl_araddr;
  output s_axilite_ctrl_arready;
  input s_axilite_ctrl_arvalid;
  input [6:0]s_axilite_ctrl_awaddr;
  output s_axilite_ctrl_awready;
  input s_axilite_ctrl_awvalid;
  input s_axilite_ctrl_bready;
  output [1:0]s_axilite_ctrl_bresp;
  output s_axilite_ctrl_bvalid;
  output [31:0]s_axilite_ctrl_rdata;
  input s_axilite_ctrl_rready;
  output [1:0]s_axilite_ctrl_rresp;
  output s_axilite_ctrl_rvalid;
  input [31:0]s_axilite_ctrl_wdata;
  output s_axilite_ctrl_wready;
  input [3:0]s_axilite_ctrl_wstrb;
  input s_axilite_ctrl_wvalid;
  output [0:0]start;
  output [31:0]time_cnt;
  output [511:0]to_app_tdata;
  output [63:0]to_app_tkeep;
  output [0:0]to_app_tlast;
  input [0:0]to_app_tready;
  output [0:0]to_app_tvalid;
  output [511:0]to_cmp_fifo_tdata;
  output [63:0]to_cmp_fifo_tkeep;
  output [0:0]to_cmp_fifo_tlast;
  output [0:0]to_cmp_fifo_tvalid;
  output [63:0]to_ddr_araddr;
  output [1:0]to_ddr_arburst;
  output [3:0]to_ddr_arcache;
  output [7:0]to_ddr_arlen;
  output [2:0]to_ddr_arprot;
  input to_ddr_arready;
  output [2:0]to_ddr_arsize;
  output [3:0]to_ddr_aruser;
  output to_ddr_arvalid;
  input [511:0]to_ddr_rdata;
  input to_ddr_rlast;
  output to_ddr_rready;
  input [1:0]to_ddr_rresp;
  input to_ddr_rvalid;
  input traffic_clk;
  output [63:0]transfer_length;
  output [31:0]tx_timeElapse;
  output [63:0]tx_timestamp_sum;

  wire ddr_clk;
  wire [0:0]mismatch;
  wire [31:0]pkt_cnt_rx;
  wire [31:0]pkt_cnt_tx;
  wire [0:0]rst_out;
  wire rstn;
  wire [31:0]rx_timeElapse;
  wire [63:0]rx_timestamp_sum;
  wire [6:0]s_axilite_ctrl_araddr;
  wire s_axilite_ctrl_arready;
  wire s_axilite_ctrl_arvalid;
  wire [6:0]s_axilite_ctrl_awaddr;
  wire s_axilite_ctrl_awready;
  wire s_axilite_ctrl_awvalid;
  wire s_axilite_ctrl_bready;
  wire [1:0]s_axilite_ctrl_bresp;
  wire s_axilite_ctrl_bvalid;
  wire [31:0]s_axilite_ctrl_rdata;
  wire s_axilite_ctrl_rready;
  wire [1:0]s_axilite_ctrl_rresp;
  wire s_axilite_ctrl_rvalid;
  wire [31:0]s_axilite_ctrl_wdata;
  wire s_axilite_ctrl_wready;
  wire [3:0]s_axilite_ctrl_wstrb;
  wire s_axilite_ctrl_wvalid;
  wire [0:0]start;
  wire [31:0]time_cnt;
  wire [511:0]to_app_tdata;
  wire [63:0]to_app_tkeep;
  wire [0:0]to_app_tlast;
  wire [0:0]to_app_tready;
  wire [0:0]to_app_tvalid;
  wire [511:0]to_cmp_fifo_tdata;
  wire [63:0]to_cmp_fifo_tkeep;
  wire [0:0]to_cmp_fifo_tlast;
  wire [0:0]to_cmp_fifo_tvalid;
  wire [63:0]to_ddr_araddr;
  wire [1:0]to_ddr_arburst;
  wire [3:0]to_ddr_arcache;
  wire [7:0]to_ddr_arlen;
  wire [2:0]to_ddr_arprot;
  wire to_ddr_arready;
  wire [2:0]to_ddr_arsize;
  wire [3:0]to_ddr_aruser;
  wire to_ddr_arvalid;
  wire [511:0]to_ddr_rdata;
  wire to_ddr_rlast;
  wire to_ddr_rready;
  wire [1:0]to_ddr_rresp;
  wire to_ddr_rvalid;
  wire traffic_clk;
  wire [63:0]transfer_length;
  wire [31:0]tx_timeElapse;
  wire [63:0]tx_timestamp_sum;

  SD_AXIS_traffic_gen SD_AXIS_traffic_gen_i
       (.ddr_clk(ddr_clk),
        .mismatch(mismatch),
        .pkt_cnt_rx(pkt_cnt_rx),
        .pkt_cnt_tx(pkt_cnt_tx),
        .rst_out(rst_out),
        .rstn(rstn),
        .rx_timeElapse(rx_timeElapse),
        .rx_timestamp_sum(rx_timestamp_sum),
        .s_axilite_ctrl_araddr(s_axilite_ctrl_araddr),
        .s_axilite_ctrl_arready(s_axilite_ctrl_arready),
        .s_axilite_ctrl_arvalid(s_axilite_ctrl_arvalid),
        .s_axilite_ctrl_awaddr(s_axilite_ctrl_awaddr),
        .s_axilite_ctrl_awready(s_axilite_ctrl_awready),
        .s_axilite_ctrl_awvalid(s_axilite_ctrl_awvalid),
        .s_axilite_ctrl_bready(s_axilite_ctrl_bready),
        .s_axilite_ctrl_bresp(s_axilite_ctrl_bresp),
        .s_axilite_ctrl_bvalid(s_axilite_ctrl_bvalid),
        .s_axilite_ctrl_rdata(s_axilite_ctrl_rdata),
        .s_axilite_ctrl_rready(s_axilite_ctrl_rready),
        .s_axilite_ctrl_rresp(s_axilite_ctrl_rresp),
        .s_axilite_ctrl_rvalid(s_axilite_ctrl_rvalid),
        .s_axilite_ctrl_wdata(s_axilite_ctrl_wdata),
        .s_axilite_ctrl_wready(s_axilite_ctrl_wready),
        .s_axilite_ctrl_wstrb(s_axilite_ctrl_wstrb),
        .s_axilite_ctrl_wvalid(s_axilite_ctrl_wvalid),
        .start(start),
        .time_cnt(time_cnt),
        .to_app_tdata(to_app_tdata),
        .to_app_tkeep(to_app_tkeep),
        .to_app_tlast(to_app_tlast),
        .to_app_tready(to_app_tready),
        .to_app_tvalid(to_app_tvalid),
        .to_cmp_fifo_tdata(to_cmp_fifo_tdata),
        .to_cmp_fifo_tkeep(to_cmp_fifo_tkeep),
        .to_cmp_fifo_tlast(to_cmp_fifo_tlast),
        .to_cmp_fifo_tvalid(to_cmp_fifo_tvalid),
        .to_ddr_araddr(to_ddr_araddr),
        .to_ddr_arburst(to_ddr_arburst),
        .to_ddr_arcache(to_ddr_arcache),
        .to_ddr_arlen(to_ddr_arlen),
        .to_ddr_arprot(to_ddr_arprot),
        .to_ddr_arready(to_ddr_arready),
        .to_ddr_arsize(to_ddr_arsize),
        .to_ddr_aruser(to_ddr_aruser),
        .to_ddr_arvalid(to_ddr_arvalid),
        .to_ddr_rdata(to_ddr_rdata),
        .to_ddr_rlast(to_ddr_rlast),
        .to_ddr_rready(to_ddr_rready),
        .to_ddr_rresp(to_ddr_rresp),
        .to_ddr_rvalid(to_ddr_rvalid),
        .traffic_clk(traffic_clk),
        .transfer_length(transfer_length),
        .tx_timeElapse(tx_timeElapse),
        .tx_timestamp_sum(tx_timestamp_sum));
endmodule
