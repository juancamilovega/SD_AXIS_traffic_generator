//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
//Date        : Tue Oct  8 03:15:43 2019
//Host        : owl running 64-bit Ubuntu 16.04.4 LTS
//Command     : generate_target SD_AXIS_traffic_gen.bd
//Design      : SD_AXIS_traffic_gen
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "SD_AXIS_traffic_gen,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SD_AXIS_traffic_gen,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=8,numReposBlks=8,numNonXlnxBlks=4,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "SD_AXIS_traffic_gen.hwdef" *) 
module SD_AXIS_traffic_gen
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.DDR_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.DDR_CLK, ASSOCIATED_BUSIF to_ddr, CLK_DOMAIN SD_AXIS_traffic_gen_ap_clk_1, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input ddr_clk;
  input [0:0]mismatch;
  input [31:0]pkt_cnt_rx;
  output [31:0]pkt_cnt_tx;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_OUT RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_OUT, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) output [0:0]rst_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RSTN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RSTN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rstn;
  input [31:0]rx_timeElapse;
  input [63:0]rx_timestamp_sum;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axilite_ctrl, ADDR_WIDTH 12, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN SD_AXIS_traffic_gen_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [6:0]s_axilite_ctrl_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) output s_axilite_ctrl_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) input s_axilite_ctrl_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) input [6:0]s_axilite_ctrl_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) output s_axilite_ctrl_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) input s_axilite_ctrl_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) input s_axilite_ctrl_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) output [1:0]s_axilite_ctrl_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) output s_axilite_ctrl_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) output [31:0]s_axilite_ctrl_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) input s_axilite_ctrl_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) output [1:0]s_axilite_ctrl_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) output s_axilite_ctrl_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) input [31:0]s_axilite_ctrl_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) output s_axilite_ctrl_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) input [3:0]s_axilite_ctrl_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite_ctrl " *) input s_axilite_ctrl_wvalid;
  output [0:0]start;
  output [31:0]time_cnt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_app " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME to_app, CLK_DOMAIN SD_AXIS_traffic_gen_ap_clk_0, FREQ_HZ 100000000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [511:0]to_app_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_app " *) output [63:0]to_app_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_app " *) output [0:0]to_app_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_app " *) input [0:0]to_app_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_app " *) output [0:0]to_app_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_cmp_fifo " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME to_cmp_fifo, CLK_DOMAIN SD_AXIS_traffic_gen_ap_clk_0, FREQ_HZ 100000000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [511:0]to_cmp_fifo_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_cmp_fifo " *) output [63:0]to_cmp_fifo_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_cmp_fifo " *) output [0:0]to_cmp_fifo_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_cmp_fifo " *) output [0:0]to_cmp_fifo_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 to_ddr " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME to_ddr, ADDR_WIDTH 64, ARUSER_WIDTH 4, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN SD_AXIS_traffic_gen_ap_clk_1, DATA_WIDTH 512, FREQ_HZ 100000000, HAS_BRESP 0, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 0, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 64, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_ONLY, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [63:0]to_ddr_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 to_ddr " *) output [1:0]to_ddr_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 to_ddr " *) output [3:0]to_ddr_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 to_ddr " *) output [7:0]to_ddr_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 to_ddr " *) output [2:0]to_ddr_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 to_ddr " *) input to_ddr_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 to_ddr " *) output [2:0]to_ddr_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 to_ddr " *) output [3:0]to_ddr_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 to_ddr " *) output to_ddr_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 to_ddr " *) input [511:0]to_ddr_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 to_ddr " *) input to_ddr_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 to_ddr " *) output to_ddr_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 to_ddr " *) input [1:0]to_ddr_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 to_ddr " *) input to_ddr_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.TRAFFIC_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.TRAFFIC_CLK, ASSOCIATED_BUSIF s_axilite_ctrl:to_app:to_cmp_fifo, ASSOCIATED_RESET rstn, CLK_DOMAIN SD_AXIS_traffic_gen_ap_clk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input traffic_clk;
  output [63:0]transfer_length;
  output [31:0]tx_timeElapse;
  output [63:0]tx_timestamp_sum;

  wire ap_clk_0_1;
  wire ap_clk_1_1;
  wire ap_rst_n_0_1;
  wire [511:0]axi_datamover_M_AXIS_MM2S_TDATA;
  wire [0:0]axi_datamover_M_AXIS_MM2S_TREADY;
  wire axi_datamover_M_AXIS_MM2S_TVALID;
  wire [63:0]axi_datamover_M_AXI_MM2S_ARADDR;
  wire [1:0]axi_datamover_M_AXI_MM2S_ARBURST;
  wire [3:0]axi_datamover_M_AXI_MM2S_ARCACHE;
  wire [7:0]axi_datamover_M_AXI_MM2S_ARLEN;
  wire [2:0]axi_datamover_M_AXI_MM2S_ARPROT;
  wire axi_datamover_M_AXI_MM2S_ARREADY;
  wire [2:0]axi_datamover_M_AXI_MM2S_ARSIZE;
  wire [3:0]axi_datamover_M_AXI_MM2S_ARUSER;
  wire axi_datamover_M_AXI_MM2S_ARVALID;
  wire [511:0]axi_datamover_M_AXI_MM2S_RDATA;
  wire axi_datamover_M_AXI_MM2S_RLAST;
  wire axi_datamover_M_AXI_MM2S_RREADY;
  wire [1:0]axi_datamover_M_AXI_MM2S_RRESP;
  wire axi_datamover_M_AXI_MM2S_RVALID;
  wire [511:0]cross_domain_fifo_M_AXIS_TDATA;
  wire [63:0]cross_domain_fifo_M_AXIS_TKEEP;
  wire cross_domain_fifo_M_AXIS_TLAST;
  wire [0:0]cross_domain_fifo_M_AXIS_TREADY;
  wire cross_domain_fifo_M_AXIS_TVALID;
  wire [103:0]datamover_controller_m_axis_TDATA;
  wire datamover_controller_m_axis_TREADY;
  wire [0:0]datamover_controller_m_axis_TVALID;
  wire [0:0]mismatch_0_1;
  wire [31:0]pkt_cnt_rx_0_1;
  wire [0:0]proc_sys_reset_peripheral_aresetn;
  wire [0:0]proc_sys_reset_peripheral_reset;
  wire [31:0]rx_timeElapse_0_1;
  wire [63:0]rx_timestamp_sum_0_1;
  wire [6:0]s_axi_AXILiteS_0_1_ARADDR;
  wire s_axi_AXILiteS_0_1_ARREADY;
  wire s_axi_AXILiteS_0_1_ARVALID;
  wire [6:0]s_axi_AXILiteS_0_1_AWADDR;
  wire s_axi_AXILiteS_0_1_AWREADY;
  wire s_axi_AXILiteS_0_1_AWVALID;
  wire s_axi_AXILiteS_0_1_BREADY;
  wire [1:0]s_axi_AXILiteS_0_1_BRESP;
  wire s_axi_AXILiteS_0_1_BVALID;
  wire [31:0]s_axi_AXILiteS_0_1_RDATA;
  wire s_axi_AXILiteS_0_1_RREADY;
  wire [1:0]s_axi_AXILiteS_0_1_RRESP;
  wire s_axi_AXILiteS_0_1_RVALID;
  wire [31:0]s_axi_AXILiteS_0_1_WDATA;
  wire s_axi_AXILiteS_0_1_WREADY;
  wire [3:0]s_axi_AXILiteS_0_1_WSTRB;
  wire s_axi_AXILiteS_0_1_WVALID;
  wire [0:0]sw_interface_rst;
  wire [0:0]sw_interface_start;
  wire [63:0]sw_interface_transfer_length;
  wire [511:0]traffic_decoder_decoded_packet_TDATA;
  wire [63:0]traffic_decoder_decoded_packet_TKEEP;
  wire [0:0]traffic_decoder_decoded_packet_TLAST;
  wire traffic_decoder_decoded_packet_TREADY;
  wire [0:0]traffic_decoder_decoded_packet_TVALID;
  wire [31:0]traffic_gen_tx_pkt_cnt_tx;
  wire [31:0]traffic_gen_tx_time_cnt;
  wire [511:0]traffic_gen_tx_to_app_TDATA;
  wire [63:0]traffic_gen_tx_to_app_TKEEP;
  wire [0:0]traffic_gen_tx_to_app_TLAST;
  wire [0:0]traffic_gen_tx_to_app_TREADY;
  wire [0:0]traffic_gen_tx_to_app_TVALID;
  wire [511:0]traffic_gen_tx_to_cmp_fifo_TDATA;
  wire [63:0]traffic_gen_tx_to_cmp_fifo_TKEEP;
  wire [0:0]traffic_gen_tx_to_cmp_fifo_TLAST;
  wire [0:0]traffic_gen_tx_to_cmp_fifo_TVALID;
  wire [31:0]traffic_gen_tx_tx_timeElapse;
  wire [63:0]traffic_gen_tx_tx_timestamp_sum;
  wire [0:0]util_vector_logic_Res;

  assign ap_clk_0_1 = traffic_clk;
  assign ap_clk_1_1 = ddr_clk;
  assign ap_rst_n_0_1 = rstn;
  assign axi_datamover_M_AXI_MM2S_ARREADY = to_ddr_arready;
  assign axi_datamover_M_AXI_MM2S_RDATA = to_ddr_rdata[511:0];
  assign axi_datamover_M_AXI_MM2S_RLAST = to_ddr_rlast;
  assign axi_datamover_M_AXI_MM2S_RRESP = to_ddr_rresp[1:0];
  assign axi_datamover_M_AXI_MM2S_RVALID = to_ddr_rvalid;
  assign mismatch_0_1 = mismatch[0];
  assign pkt_cnt_rx_0_1 = pkt_cnt_rx[31:0];
  assign pkt_cnt_tx[31:0] = traffic_gen_tx_pkt_cnt_tx;
  assign rst_out[0] = sw_interface_rst;
  assign rx_timeElapse_0_1 = rx_timeElapse[31:0];
  assign rx_timestamp_sum_0_1 = rx_timestamp_sum[63:0];
  assign s_axi_AXILiteS_0_1_ARADDR = s_axilite_ctrl_araddr[6:0];
  assign s_axi_AXILiteS_0_1_ARVALID = s_axilite_ctrl_arvalid;
  assign s_axi_AXILiteS_0_1_AWADDR = s_axilite_ctrl_awaddr[6:0];
  assign s_axi_AXILiteS_0_1_AWVALID = s_axilite_ctrl_awvalid;
  assign s_axi_AXILiteS_0_1_BREADY = s_axilite_ctrl_bready;
  assign s_axi_AXILiteS_0_1_RREADY = s_axilite_ctrl_rready;
  assign s_axi_AXILiteS_0_1_WDATA = s_axilite_ctrl_wdata[31:0];
  assign s_axi_AXILiteS_0_1_WSTRB = s_axilite_ctrl_wstrb[3:0];
  assign s_axi_AXILiteS_0_1_WVALID = s_axilite_ctrl_wvalid;
  assign s_axilite_ctrl_arready = s_axi_AXILiteS_0_1_ARREADY;
  assign s_axilite_ctrl_awready = s_axi_AXILiteS_0_1_AWREADY;
  assign s_axilite_ctrl_bresp[1:0] = s_axi_AXILiteS_0_1_BRESP;
  assign s_axilite_ctrl_bvalid = s_axi_AXILiteS_0_1_BVALID;
  assign s_axilite_ctrl_rdata[31:0] = s_axi_AXILiteS_0_1_RDATA;
  assign s_axilite_ctrl_rresp[1:0] = s_axi_AXILiteS_0_1_RRESP;
  assign s_axilite_ctrl_rvalid = s_axi_AXILiteS_0_1_RVALID;
  assign s_axilite_ctrl_wready = s_axi_AXILiteS_0_1_WREADY;
  assign start[0] = sw_interface_start;
  assign time_cnt[31:0] = traffic_gen_tx_time_cnt;
  assign to_app_tdata[511:0] = traffic_gen_tx_to_app_TDATA;
  assign to_app_tkeep[63:0] = traffic_gen_tx_to_app_TKEEP;
  assign to_app_tlast[0] = traffic_gen_tx_to_app_TLAST;
  assign to_app_tvalid[0] = traffic_gen_tx_to_app_TVALID;
  assign to_cmp_fifo_tdata[511:0] = traffic_gen_tx_to_cmp_fifo_TDATA;
  assign to_cmp_fifo_tkeep[63:0] = traffic_gen_tx_to_cmp_fifo_TKEEP;
  assign to_cmp_fifo_tlast[0] = traffic_gen_tx_to_cmp_fifo_TLAST;
  assign to_cmp_fifo_tvalid[0] = traffic_gen_tx_to_cmp_fifo_TVALID;
  assign to_ddr_araddr[63:0] = axi_datamover_M_AXI_MM2S_ARADDR;
  assign to_ddr_arburst[1:0] = axi_datamover_M_AXI_MM2S_ARBURST;
  assign to_ddr_arcache[3:0] = axi_datamover_M_AXI_MM2S_ARCACHE;
  assign to_ddr_arlen[7:0] = axi_datamover_M_AXI_MM2S_ARLEN;
  assign to_ddr_arprot[2:0] = axi_datamover_M_AXI_MM2S_ARPROT;
  assign to_ddr_arsize[2:0] = axi_datamover_M_AXI_MM2S_ARSIZE;
  assign to_ddr_aruser[3:0] = axi_datamover_M_AXI_MM2S_ARUSER;
  assign to_ddr_arvalid = axi_datamover_M_AXI_MM2S_ARVALID;
  assign to_ddr_rready = axi_datamover_M_AXI_MM2S_RREADY;
  assign traffic_gen_tx_to_app_TREADY = to_app_tready[0];
  assign transfer_length[63:0] = sw_interface_transfer_length;
  assign tx_timeElapse[31:0] = traffic_gen_tx_tx_timeElapse;
  assign tx_timestamp_sum[63:0] = traffic_gen_tx_tx_timestamp_sum;
  SD_AXIS_traffic_gen_axi_datamover_0 axi_datamover
       (.m_axi_mm2s_aclk(ap_clk_1_1),
        .m_axi_mm2s_araddr(axi_datamover_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(axi_datamover_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(axi_datamover_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_aresetn(proc_sys_reset_peripheral_aresetn),
        .m_axi_mm2s_arlen(axi_datamover_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(axi_datamover_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(axi_datamover_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(axi_datamover_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_aruser(axi_datamover_M_AXI_MM2S_ARUSER),
        .m_axi_mm2s_arvalid(axi_datamover_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(axi_datamover_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(axi_datamover_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(axi_datamover_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(axi_datamover_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(axi_datamover_M_AXI_MM2S_RVALID),
        .m_axis_mm2s_cmdsts_aclk(ap_clk_0_1),
        .m_axis_mm2s_cmdsts_aresetn(util_vector_logic_Res),
        .m_axis_mm2s_sts_tready(1'b1),
        .m_axis_mm2s_tdata(axi_datamover_M_AXIS_MM2S_TDATA),
        .m_axis_mm2s_tready(axi_datamover_M_AXIS_MM2S_TREADY),
        .m_axis_mm2s_tvalid(axi_datamover_M_AXIS_MM2S_TVALID),
        .s_axis_mm2s_cmd_tdata(datamover_controller_m_axis_TDATA),
        .s_axis_mm2s_cmd_tready(datamover_controller_m_axis_TREADY),
        .s_axis_mm2s_cmd_tvalid(datamover_controller_m_axis_TVALID));
  SD_AXIS_traffic_gen_cross_domain_fifo_0 cross_domain_fifo
       (.m_axis_aclk(ap_clk_0_1),
        .m_axis_tdata(cross_domain_fifo_M_AXIS_TDATA),
        .m_axis_tkeep(cross_domain_fifo_M_AXIS_TKEEP),
        .m_axis_tlast(cross_domain_fifo_M_AXIS_TLAST),
        .m_axis_tready(cross_domain_fifo_M_AXIS_TREADY),
        .m_axis_tvalid(cross_domain_fifo_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1_1),
        .s_axis_aresetn(proc_sys_reset_peripheral_aresetn),
        .s_axis_tdata(traffic_decoder_decoded_packet_TDATA),
        .s_axis_tkeep(traffic_decoder_decoded_packet_TKEEP),
        .s_axis_tlast(traffic_decoder_decoded_packet_TLAST),
        .s_axis_tready(traffic_decoder_decoded_packet_TREADY),
        .s_axis_tvalid(traffic_decoder_decoded_packet_TVALID));
  SD_AXIS_traffic_gen_datamover_controller_0 datamover_controller
       (.ap_clk(ap_clk_0_1),
        .ap_rst(sw_interface_rst),
        .length(sw_interface_transfer_length),
        .m_axis_tdata(datamover_controller_m_axis_TDATA),
        .m_axis_tready(datamover_controller_m_axis_TREADY),
        .m_axis_tvalid(datamover_controller_m_axis_TVALID),
        .start(sw_interface_start));
  SD_AXIS_traffic_gen_proc_sys_reset_0 proc_sys_reset
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(sw_interface_rst),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_peripheral_aresetn),
        .peripheral_reset(proc_sys_reset_peripheral_reset),
        .slowest_sync_clk(ap_clk_1_1));
  SD_AXIS_traffic_gen_sw_interface_0 sw_interface
       (.ap_clk(ap_clk_0_1),
        .ap_rst_n(ap_rst_n_0_1),
        .mismatch(mismatch_0_1),
        .pkt_cnt_rx(pkt_cnt_rx_0_1),
        .pkt_cnt_tx(traffic_gen_tx_pkt_cnt_tx),
        .rst(sw_interface_rst),
        .rx_timeElapse(rx_timeElapse_0_1),
        .rx_timestamp_sum(rx_timestamp_sum_0_1),
        .s_axi_AXILiteS_ARADDR(s_axi_AXILiteS_0_1_ARADDR),
        .s_axi_AXILiteS_ARREADY(s_axi_AXILiteS_0_1_ARREADY),
        .s_axi_AXILiteS_ARVALID(s_axi_AXILiteS_0_1_ARVALID),
        .s_axi_AXILiteS_AWADDR(s_axi_AXILiteS_0_1_AWADDR),
        .s_axi_AXILiteS_AWREADY(s_axi_AXILiteS_0_1_AWREADY),
        .s_axi_AXILiteS_AWVALID(s_axi_AXILiteS_0_1_AWVALID),
        .s_axi_AXILiteS_BREADY(s_axi_AXILiteS_0_1_BREADY),
        .s_axi_AXILiteS_BRESP(s_axi_AXILiteS_0_1_BRESP),
        .s_axi_AXILiteS_BVALID(s_axi_AXILiteS_0_1_BVALID),
        .s_axi_AXILiteS_RDATA(s_axi_AXILiteS_0_1_RDATA),
        .s_axi_AXILiteS_RREADY(s_axi_AXILiteS_0_1_RREADY),
        .s_axi_AXILiteS_RRESP(s_axi_AXILiteS_0_1_RRESP),
        .s_axi_AXILiteS_RVALID(s_axi_AXILiteS_0_1_RVALID),
        .s_axi_AXILiteS_WDATA(s_axi_AXILiteS_0_1_WDATA),
        .s_axi_AXILiteS_WREADY(s_axi_AXILiteS_0_1_WREADY),
        .s_axi_AXILiteS_WSTRB(s_axi_AXILiteS_0_1_WSTRB),
        .s_axi_AXILiteS_WVALID(s_axi_AXILiteS_0_1_WVALID),
        .start(sw_interface_start),
        .transfer_length(sw_interface_transfer_length),
        .tx_timeElapse(traffic_gen_tx_tx_timeElapse),
        .tx_timestamp_sum(traffic_gen_tx_tx_timestamp_sum));
  SD_AXIS_traffic_gen_traffic_decoder_0 traffic_decoder
       (.ap_clk(ap_clk_1_1),
        .ap_rst(proc_sys_reset_peripheral_reset),
        .decoded_packet_tdata(traffic_decoder_decoded_packet_TDATA),
        .decoded_packet_tkeep(traffic_decoder_decoded_packet_TKEEP),
        .decoded_packet_tlast(traffic_decoder_decoded_packet_TLAST),
        .decoded_packet_tready(traffic_decoder_decoded_packet_TREADY),
        .decoded_packet_tvalid(traffic_decoder_decoded_packet_TVALID),
        .raw_packet_tdata(axi_datamover_M_AXIS_MM2S_TDATA),
        .raw_packet_tready(axi_datamover_M_AXIS_MM2S_TREADY),
        .raw_packet_tvalid(axi_datamover_M_AXIS_MM2S_TVALID));
  SD_AXIS_traffic_gen_traffic_gen_tx_0 traffic_gen_tx
       (.ap_clk(ap_clk_0_1),
        .ap_rst(sw_interface_rst),
        .from_decoder_tdata(cross_domain_fifo_M_AXIS_TDATA),
        .from_decoder_tkeep(cross_domain_fifo_M_AXIS_TKEEP),
        .from_decoder_tlast(cross_domain_fifo_M_AXIS_TLAST),
        .from_decoder_tready(cross_domain_fifo_M_AXIS_TREADY),
        .from_decoder_tvalid(cross_domain_fifo_M_AXIS_TVALID),
        .pkt_cnt_tx(traffic_gen_tx_pkt_cnt_tx),
        .time_cnt(traffic_gen_tx_time_cnt),
        .to_app_tdata(traffic_gen_tx_to_app_TDATA),
        .to_app_tkeep(traffic_gen_tx_to_app_TKEEP),
        .to_app_tlast(traffic_gen_tx_to_app_TLAST),
        .to_app_tready(traffic_gen_tx_to_app_TREADY),
        .to_app_tvalid(traffic_gen_tx_to_app_TVALID),
        .to_cmp_fifo_tdata(traffic_gen_tx_to_cmp_fifo_TDATA),
        .to_cmp_fifo_tkeep(traffic_gen_tx_to_cmp_fifo_TKEEP),
        .to_cmp_fifo_tlast(traffic_gen_tx_to_cmp_fifo_TLAST),
        .to_cmp_fifo_tvalid(traffic_gen_tx_to_cmp_fifo_TVALID),
        .tx_timeElapse(traffic_gen_tx_tx_timeElapse),
        .tx_timestamp_sum(traffic_gen_tx_tx_timestamp_sum));
  SD_AXIS_traffic_gen_util_vector_logic_0 util_vector_logic
       (.Op1(sw_interface_rst),
        .Res(util_vector_logic_Res));
endmodule
