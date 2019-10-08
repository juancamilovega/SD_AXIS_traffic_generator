// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module sw_interface_AXILiteS_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 7,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire [0:0]                    axil_start,
    output wire [0:0]                    axil_rst,
    output wire [31:0]                   axil_len_low,
    output wire [31:0]                   axil_len_high,
    input  wire [31:0]                   axil_mismatch,
    input  wire                          axil_mismatch_ap_vld,
    input  wire [31:0]                   axil_tx_timeElapse,
    input  wire                          axil_tx_timeElapse_ap_vld,
    input  wire [31:0]                   axil_rx_timeElapse,
    input  wire                          axil_rx_timeElapse_ap_vld,
    input  wire [31:0]                   axil_tx_timestamp_sum_low,
    input  wire                          axil_tx_timestamp_sum_low_ap_vld,
    input  wire [31:0]                   axil_tx_timestamp_sum_high,
    input  wire                          axil_tx_timestamp_sum_high_ap_vld,
    input  wire [31:0]                   axil_rx_timestamp_sum_low,
    input  wire                          axil_rx_timestamp_sum_low_ap_vld,
    input  wire [31:0]                   axil_rx_timestamp_sum_high,
    input  wire                          axil_rx_timestamp_sum_high_ap_vld,
    input  wire [31:0]                   axil_pkt_cnt_tx,
    input  wire                          axil_pkt_cnt_tx_ap_vld,
    input  wire [31:0]                   axil_pkt_cnt_rx,
    input  wire                          axil_pkt_cnt_rx_ap_vld
);
//------------------------Address Info-------------------
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of axil_start
//        bit 0  - axil_start[0] (Read/Write)
//        others - reserved
// 0x14 : reserved
// 0x18 : Data signal of axil_rst
//        bit 0  - axil_rst[0] (Read/Write)
//        others - reserved
// 0x1c : reserved
// 0x20 : Data signal of axil_len_low
//        bit 31~0 - axil_len_low[31:0] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of axil_len_high
//        bit 31~0 - axil_len_high[31:0] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of axil_mismatch
//        bit 31~0 - axil_mismatch[31:0] (Read)
// 0x34 : Control signal of axil_mismatch
//        bit 0  - axil_mismatch_ap_vld (Read/COR)
//        others - reserved
// 0x38 : Data signal of axil_tx_timeElapse
//        bit 31~0 - axil_tx_timeElapse[31:0] (Read)
// 0x3c : Control signal of axil_tx_timeElapse
//        bit 0  - axil_tx_timeElapse_ap_vld (Read/COR)
//        others - reserved
// 0x40 : Data signal of axil_rx_timeElapse
//        bit 31~0 - axil_rx_timeElapse[31:0] (Read)
// 0x44 : Control signal of axil_rx_timeElapse
//        bit 0  - axil_rx_timeElapse_ap_vld (Read/COR)
//        others - reserved
// 0x48 : Data signal of axil_tx_timestamp_sum_low
//        bit 31~0 - axil_tx_timestamp_sum_low[31:0] (Read)
// 0x4c : Control signal of axil_tx_timestamp_sum_low
//        bit 0  - axil_tx_timestamp_sum_low_ap_vld (Read/COR)
//        others - reserved
// 0x50 : Data signal of axil_tx_timestamp_sum_high
//        bit 31~0 - axil_tx_timestamp_sum_high[31:0] (Read)
// 0x54 : Control signal of axil_tx_timestamp_sum_high
//        bit 0  - axil_tx_timestamp_sum_high_ap_vld (Read/COR)
//        others - reserved
// 0x58 : Data signal of axil_rx_timestamp_sum_low
//        bit 31~0 - axil_rx_timestamp_sum_low[31:0] (Read)
// 0x5c : Control signal of axil_rx_timestamp_sum_low
//        bit 0  - axil_rx_timestamp_sum_low_ap_vld (Read/COR)
//        others - reserved
// 0x60 : Data signal of axil_rx_timestamp_sum_high
//        bit 31~0 - axil_rx_timestamp_sum_high[31:0] (Read)
// 0x64 : Control signal of axil_rx_timestamp_sum_high
//        bit 0  - axil_rx_timestamp_sum_high_ap_vld (Read/COR)
//        others - reserved
// 0x68 : Data signal of axil_pkt_cnt_tx
//        bit 31~0 - axil_pkt_cnt_tx[31:0] (Read)
// 0x6c : Control signal of axil_pkt_cnt_tx
//        bit 0  - axil_pkt_cnt_tx_ap_vld (Read/COR)
//        others - reserved
// 0x70 : Data signal of axil_pkt_cnt_rx
//        bit 31~0 - axil_pkt_cnt_rx[31:0] (Read)
// 0x74 : Control signal of axil_pkt_cnt_rx
//        bit 0  - axil_pkt_cnt_rx_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AXIL_START_DATA_0                 = 7'h10,
    ADDR_AXIL_START_CTRL                   = 7'h14,
    ADDR_AXIL_RST_DATA_0                   = 7'h18,
    ADDR_AXIL_RST_CTRL                     = 7'h1c,
    ADDR_AXIL_LEN_LOW_DATA_0               = 7'h20,
    ADDR_AXIL_LEN_LOW_CTRL                 = 7'h24,
    ADDR_AXIL_LEN_HIGH_DATA_0              = 7'h28,
    ADDR_AXIL_LEN_HIGH_CTRL                = 7'h2c,
    ADDR_AXIL_MISMATCH_DATA_0              = 7'h30,
    ADDR_AXIL_MISMATCH_CTRL                = 7'h34,
    ADDR_AXIL_TX_TIMEELAPSE_DATA_0         = 7'h38,
    ADDR_AXIL_TX_TIMEELAPSE_CTRL           = 7'h3c,
    ADDR_AXIL_RX_TIMEELAPSE_DATA_0         = 7'h40,
    ADDR_AXIL_RX_TIMEELAPSE_CTRL           = 7'h44,
    ADDR_AXIL_TX_TIMESTAMP_SUM_LOW_DATA_0  = 7'h48,
    ADDR_AXIL_TX_TIMESTAMP_SUM_LOW_CTRL    = 7'h4c,
    ADDR_AXIL_TX_TIMESTAMP_SUM_HIGH_DATA_0 = 7'h50,
    ADDR_AXIL_TX_TIMESTAMP_SUM_HIGH_CTRL   = 7'h54,
    ADDR_AXIL_RX_TIMESTAMP_SUM_LOW_DATA_0  = 7'h58,
    ADDR_AXIL_RX_TIMESTAMP_SUM_LOW_CTRL    = 7'h5c,
    ADDR_AXIL_RX_TIMESTAMP_SUM_HIGH_DATA_0 = 7'h60,
    ADDR_AXIL_RX_TIMESTAMP_SUM_HIGH_CTRL   = 7'h64,
    ADDR_AXIL_PKT_CNT_TX_DATA_0            = 7'h68,
    ADDR_AXIL_PKT_CNT_TX_CTRL              = 7'h6c,
    ADDR_AXIL_PKT_CNT_RX_DATA_0            = 7'h70,
    ADDR_AXIL_PKT_CNT_RX_CTRL              = 7'h74,
    WRIDLE                                   = 2'd0,
    WRDATA                                   = 2'd1,
    WRRESP                                   = 2'd2,
    WRRESET                                  = 2'd3,
    RDIDLE                                   = 2'd0,
    RDDATA                                   = 2'd1,
    RDRESET                                  = 2'd2,
    ADDR_BITS         = 7;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [31:0]                   wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [31:0]                   rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg  [0:0]                    int_axil_start = 'b0;
    reg  [0:0]                    int_axil_rst = 'b0;
    reg  [31:0]                   int_axil_len_low = 'b0;
    reg  [31:0]                   int_axil_len_high = 'b0;
    reg  [31:0]                   int_axil_mismatch = 'b0;
    reg                           int_axil_mismatch_ap_vld;
    reg  [31:0]                   int_axil_tx_timeElapse = 'b0;
    reg                           int_axil_tx_timeElapse_ap_vld;
    reg  [31:0]                   int_axil_rx_timeElapse = 'b0;
    reg                           int_axil_rx_timeElapse_ap_vld;
    reg  [31:0]                   int_axil_tx_timestamp_sum_low = 'b0;
    reg                           int_axil_tx_timestamp_sum_low_ap_vld;
    reg  [31:0]                   int_axil_tx_timestamp_sum_high = 'b0;
    reg                           int_axil_tx_timestamp_sum_high_ap_vld;
    reg  [31:0]                   int_axil_rx_timestamp_sum_low = 'b0;
    reg                           int_axil_rx_timestamp_sum_low_ap_vld;
    reg  [31:0]                   int_axil_rx_timestamp_sum_high = 'b0;
    reg                           int_axil_rx_timestamp_sum_high_ap_vld;
    reg  [31:0]                   int_axil_pkt_cnt_tx = 'b0;
    reg                           int_axil_pkt_cnt_tx_ap_vld;
    reg  [31:0]                   int_axil_pkt_cnt_rx = 'b0;
    reg                           int_axil_pkt_cnt_rx_ap_vld;

//------------------------Instantiation------------------

//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 1'b0;
            case (raddr)
                ADDR_AXIL_START_DATA_0: begin
                    rdata <= int_axil_start[0:0];
                end
                ADDR_AXIL_RST_DATA_0: begin
                    rdata <= int_axil_rst[0:0];
                end
                ADDR_AXIL_LEN_LOW_DATA_0: begin
                    rdata <= int_axil_len_low[31:0];
                end
                ADDR_AXIL_LEN_HIGH_DATA_0: begin
                    rdata <= int_axil_len_high[31:0];
                end
                ADDR_AXIL_MISMATCH_DATA_0: begin
                    rdata <= int_axil_mismatch[31:0];
                end
                ADDR_AXIL_MISMATCH_CTRL: begin
                    rdata[0] <= int_axil_mismatch_ap_vld;
                end
                ADDR_AXIL_TX_TIMEELAPSE_DATA_0: begin
                    rdata <= int_axil_tx_timeElapse[31:0];
                end
                ADDR_AXIL_TX_TIMEELAPSE_CTRL: begin
                    rdata[0] <= int_axil_tx_timeElapse_ap_vld;
                end
                ADDR_AXIL_RX_TIMEELAPSE_DATA_0: begin
                    rdata <= int_axil_rx_timeElapse[31:0];
                end
                ADDR_AXIL_RX_TIMEELAPSE_CTRL: begin
                    rdata[0] <= int_axil_rx_timeElapse_ap_vld;
                end
                ADDR_AXIL_TX_TIMESTAMP_SUM_LOW_DATA_0: begin
                    rdata <= int_axil_tx_timestamp_sum_low[31:0];
                end
                ADDR_AXIL_TX_TIMESTAMP_SUM_LOW_CTRL: begin
                    rdata[0] <= int_axil_tx_timestamp_sum_low_ap_vld;
                end
                ADDR_AXIL_TX_TIMESTAMP_SUM_HIGH_DATA_0: begin
                    rdata <= int_axil_tx_timestamp_sum_high[31:0];
                end
                ADDR_AXIL_TX_TIMESTAMP_SUM_HIGH_CTRL: begin
                    rdata[0] <= int_axil_tx_timestamp_sum_high_ap_vld;
                end
                ADDR_AXIL_RX_TIMESTAMP_SUM_LOW_DATA_0: begin
                    rdata <= int_axil_rx_timestamp_sum_low[31:0];
                end
                ADDR_AXIL_RX_TIMESTAMP_SUM_LOW_CTRL: begin
                    rdata[0] <= int_axil_rx_timestamp_sum_low_ap_vld;
                end
                ADDR_AXIL_RX_TIMESTAMP_SUM_HIGH_DATA_0: begin
                    rdata <= int_axil_rx_timestamp_sum_high[31:0];
                end
                ADDR_AXIL_RX_TIMESTAMP_SUM_HIGH_CTRL: begin
                    rdata[0] <= int_axil_rx_timestamp_sum_high_ap_vld;
                end
                ADDR_AXIL_PKT_CNT_TX_DATA_0: begin
                    rdata <= int_axil_pkt_cnt_tx[31:0];
                end
                ADDR_AXIL_PKT_CNT_TX_CTRL: begin
                    rdata[0] <= int_axil_pkt_cnt_tx_ap_vld;
                end
                ADDR_AXIL_PKT_CNT_RX_DATA_0: begin
                    rdata <= int_axil_pkt_cnt_rx[31:0];
                end
                ADDR_AXIL_PKT_CNT_RX_CTRL: begin
                    rdata[0] <= int_axil_pkt_cnt_rx_ap_vld;
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign axil_start    = int_axil_start;
assign axil_rst      = int_axil_rst;
assign axil_len_low  = int_axil_len_low;
assign axil_len_high = int_axil_len_high;
// int_axil_start[0:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_start[0:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AXIL_START_DATA_0)
            int_axil_start[0:0] <= (WDATA[31:0] & wmask) | (int_axil_start[0:0] & ~wmask);
    end
end

// int_axil_rst[0:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rst[0:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AXIL_RST_DATA_0)
            int_axil_rst[0:0] <= (WDATA[31:0] & wmask) | (int_axil_rst[0:0] & ~wmask);
    end
end

// int_axil_len_low[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_len_low[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AXIL_LEN_LOW_DATA_0)
            int_axil_len_low[31:0] <= (WDATA[31:0] & wmask) | (int_axil_len_low[31:0] & ~wmask);
    end
end

// int_axil_len_high[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_len_high[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AXIL_LEN_HIGH_DATA_0)
            int_axil_len_high[31:0] <= (WDATA[31:0] & wmask) | (int_axil_len_high[31:0] & ~wmask);
    end
end

// int_axil_mismatch
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_mismatch <= 0;
    else if (ACLK_EN) begin
        if (axil_mismatch_ap_vld)
            int_axil_mismatch <= axil_mismatch;
    end
end

// int_axil_mismatch_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_mismatch_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_mismatch_ap_vld)
            int_axil_mismatch_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_MISMATCH_CTRL)
            int_axil_mismatch_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_tx_timeElapse
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_tx_timeElapse <= 0;
    else if (ACLK_EN) begin
        if (axil_tx_timeElapse_ap_vld)
            int_axil_tx_timeElapse <= axil_tx_timeElapse;
    end
end

// int_axil_tx_timeElapse_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_tx_timeElapse_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_tx_timeElapse_ap_vld)
            int_axil_tx_timeElapse_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_TX_TIMEELAPSE_CTRL)
            int_axil_tx_timeElapse_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_rx_timeElapse
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rx_timeElapse <= 0;
    else if (ACLK_EN) begin
        if (axil_rx_timeElapse_ap_vld)
            int_axil_rx_timeElapse <= axil_rx_timeElapse;
    end
end

// int_axil_rx_timeElapse_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rx_timeElapse_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_rx_timeElapse_ap_vld)
            int_axil_rx_timeElapse_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_RX_TIMEELAPSE_CTRL)
            int_axil_rx_timeElapse_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_tx_timestamp_sum_low
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_tx_timestamp_sum_low <= 0;
    else if (ACLK_EN) begin
        if (axil_tx_timestamp_sum_low_ap_vld)
            int_axil_tx_timestamp_sum_low <= axil_tx_timestamp_sum_low;
    end
end

// int_axil_tx_timestamp_sum_low_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_tx_timestamp_sum_low_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_tx_timestamp_sum_low_ap_vld)
            int_axil_tx_timestamp_sum_low_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_TX_TIMESTAMP_SUM_LOW_CTRL)
            int_axil_tx_timestamp_sum_low_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_tx_timestamp_sum_high
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_tx_timestamp_sum_high <= 0;
    else if (ACLK_EN) begin
        if (axil_tx_timestamp_sum_high_ap_vld)
            int_axil_tx_timestamp_sum_high <= axil_tx_timestamp_sum_high;
    end
end

// int_axil_tx_timestamp_sum_high_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_tx_timestamp_sum_high_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_tx_timestamp_sum_high_ap_vld)
            int_axil_tx_timestamp_sum_high_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_TX_TIMESTAMP_SUM_HIGH_CTRL)
            int_axil_tx_timestamp_sum_high_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_rx_timestamp_sum_low
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rx_timestamp_sum_low <= 0;
    else if (ACLK_EN) begin
        if (axil_rx_timestamp_sum_low_ap_vld)
            int_axil_rx_timestamp_sum_low <= axil_rx_timestamp_sum_low;
    end
end

// int_axil_rx_timestamp_sum_low_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rx_timestamp_sum_low_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_rx_timestamp_sum_low_ap_vld)
            int_axil_rx_timestamp_sum_low_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_RX_TIMESTAMP_SUM_LOW_CTRL)
            int_axil_rx_timestamp_sum_low_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_rx_timestamp_sum_high
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rx_timestamp_sum_high <= 0;
    else if (ACLK_EN) begin
        if (axil_rx_timestamp_sum_high_ap_vld)
            int_axil_rx_timestamp_sum_high <= axil_rx_timestamp_sum_high;
    end
end

// int_axil_rx_timestamp_sum_high_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rx_timestamp_sum_high_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_rx_timestamp_sum_high_ap_vld)
            int_axil_rx_timestamp_sum_high_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_RX_TIMESTAMP_SUM_HIGH_CTRL)
            int_axil_rx_timestamp_sum_high_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_pkt_cnt_tx
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_pkt_cnt_tx <= 0;
    else if (ACLK_EN) begin
        if (axil_pkt_cnt_tx_ap_vld)
            int_axil_pkt_cnt_tx <= axil_pkt_cnt_tx;
    end
end

// int_axil_pkt_cnt_tx_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_pkt_cnt_tx_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_pkt_cnt_tx_ap_vld)
            int_axil_pkt_cnt_tx_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_PKT_CNT_TX_CTRL)
            int_axil_pkt_cnt_tx_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_pkt_cnt_rx
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_pkt_cnt_rx <= 0;
    else if (ACLK_EN) begin
        if (axil_pkt_cnt_rx_ap_vld)
            int_axil_pkt_cnt_rx <= axil_pkt_cnt_rx;
    end
end

// int_axil_pkt_cnt_rx_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_pkt_cnt_rx_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_pkt_cnt_rx_ap_vld)
            int_axil_pkt_cnt_rx_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_PKT_CNT_RX_CTRL)
            int_axil_pkt_cnt_rx_ap_vld <= 1'b0; // clear on read
    end
end


//------------------------Memory logic-------------------

endmodule
