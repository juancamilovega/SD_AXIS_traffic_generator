// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="traffic_gen_tx,hls_ip_2019_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xczu19eg-ffvc1760-2-i,HLS_INPUT_CLOCK=4.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.031000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=196,HLS_SYN_LUT=1379,HLSERSION=2019_1}" *)

module traffic_gen_tx (
        ap_clk,
        ap_rst,
        from_decoder_tdata,
        from_decoder_tkeep,
        from_decoder_tlast,
        from_decoder_tvalid,
        to_app_tdata,
        to_app_tkeep,
        to_app_tlast,
        to_app_tvalid,
        to_cmp_fifo_tdata,
        to_cmp_fifo_tkeep,
        to_cmp_fifo_tlast,
        to_cmp_fifo_tvalid,
        from_decoder_tready,
        to_app_tready,
        tx_timeElapse,
        tx_timestamp_sum,
        pkt_cnt_tx,
        time_cnt
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input  [511:0] from_decoder_tdata;
input  [63:0] from_decoder_tkeep;
input  [0:0] from_decoder_tlast;
input  [0:0] from_decoder_tvalid;
output  [511:0] to_app_tdata;
output  [63:0] to_app_tkeep;
output  [0:0] to_app_tlast;
output  [0:0] to_app_tvalid;
output  [511:0] to_cmp_fifo_tdata;
output  [63:0] to_cmp_fifo_tkeep;
output  [0:0] to_cmp_fifo_tlast;
output  [0:0] to_cmp_fifo_tvalid;
output  [0:0] from_decoder_tready;
input  [0:0] to_app_tready;
output  [31:0] tx_timeElapse;
output  [63:0] tx_timestamp_sum;
output  [31:0] pkt_cnt_tx;
output  [31:0] time_cnt;

reg   [31:0] tx_timeElapse_reg;
reg   [63:0] tx_timestamp_sum_reg;
reg   [31:0] pkt_cnt_tx_reg;
reg   [0:0] start_flag;
reg   [31:0] time_cnt_reg;
reg   [31:0] tx_start;
reg   [0:0] start_initialized;
reg   [0:0] core_on;
wire   [31:0] sub_ln214_fu_276_p2;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] and_ln36_3_fu_266_p2;
wire   [63:0] add_ln700_fu_292_p2;
wire   [31:0] add_ln700_1_fu_304_p2;
wire   [0:0] tmp_fu_420_p3;
wire   [31:0] add_ln700_2_fu_444_p2;
wire   [0:0] core_on_load_load_fu_434_p1;
wire   [0:0] start_initialized_s_load_fu_316_p1;
wire   [0:0] and_ln43_1_fu_332_p2;
wire   [0:0] from_decoder_tvalid_s_read_fu_123_p2;
wire   [0:0] ret_fu_236_p2;
wire   [0:0] and_ln883_fu_350_p2;
wire   [0:0] and_ln51_1_fu_388_p2;
wire   [0:0] and_ln36_1_fu_248_p2;
wire   [0:0] and_ln36_2_fu_254_p2;
wire   [0:0] icmp_ln883_fu_260_p2;
wire   [63:0] zext_ln700_fu_288_p1;
wire   [0:0] and_ln43_fu_326_p2;
wire   [0:0] and_ln544_fu_344_p2;
wire   [0:0] and_ln51_fu_382_p2;
reg   [0:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 tx_timeElapse_reg = 32'd0;
#0 tx_timestamp_sum_reg = 64'd0;
#0 pkt_cnt_tx_reg = 32'd0;
#0 start_flag = 1'd0;
#0 time_cnt_reg = 32'd0;
#0 tx_start = 32'd0;
#0 start_initialized = 1'd0;
#0 core_on = 1'd0;
#0 ap_CS_fsm = 1'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        core_on <= 1'd0;
    end else begin
        if (((from_decoder_tvalid_s_read_fu_123_p2 == 1'd1) & (core_on_load_load_fu_434_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
            core_on <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        pkt_cnt_tx_reg <= 32'd0;
    end else begin
        if (((1'd1 == and_ln36_3_fu_266_p2) & (1'b1 == ap_CS_fsm_state1))) begin
            pkt_cnt_tx_reg <= add_ln700_1_fu_304_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_flag <= 1'd0;
    end else begin
        if (((tmp_fu_420_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
            start_flag <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_initialized <= 1'd0;
    end else begin
        if (((1'd1 == and_ln43_1_fu_332_p2) & (1'b1 == ap_CS_fsm_state1))) begin
            start_initialized <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        time_cnt_reg <= 32'd0;
    end else begin
        if (((core_on_load_load_fu_434_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
            time_cnt_reg <= add_ln700_2_fu_444_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        tx_start <= 32'd0;
    end else begin
        if (((start_initialized_s_load_fu_316_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
            tx_start <= time_cnt_reg;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        tx_timeElapse_reg <= 32'd0;
    end else begin
        if (((1'd1 == and_ln36_3_fu_266_p2) & (1'b1 == ap_CS_fsm_state1))) begin
            tx_timeElapse_reg <= sub_ln214_fu_276_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        tx_timestamp_sum_reg <= 64'd0;
    end else begin
        if (((1'd1 == and_ln36_3_fu_266_p2) & (1'b1 == ap_CS_fsm_state1))) begin
            tx_timestamp_sum_reg <= add_ln700_fu_292_p2;
        end
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln700_1_fu_304_p2 = (pkt_cnt_tx_reg + 32'd1);

assign add_ln700_2_fu_444_p2 = (time_cnt_reg + 32'd1);

assign add_ln700_fu_292_p2 = (tx_timestamp_sum_reg + zext_ln700_fu_288_p1);

assign and_ln36_1_fu_248_p2 = (ret_fu_236_p2 & from_decoder_tlast);

assign and_ln36_2_fu_254_p2 = (from_decoder_tvalid & and_ln36_1_fu_248_p2);

assign and_ln36_3_fu_266_p2 = (icmp_ln883_fu_260_p2 & and_ln36_2_fu_254_p2);

assign and_ln43_1_fu_332_p2 = (icmp_ln883_fu_260_p2 & and_ln43_fu_326_p2);

assign and_ln43_fu_326_p2 = (ret_fu_236_p2 & from_decoder_tvalid);

assign and_ln51_1_fu_388_p2 = (icmp_ln883_fu_260_p2 & and_ln51_fu_382_p2);

assign and_ln51_fu_382_p2 = (to_app_tready & and_ln544_fu_344_p2);

assign and_ln544_fu_344_p2 = (start_flag & from_decoder_tvalid);

assign and_ln883_fu_350_p2 = (icmp_ln883_fu_260_p2 & and_ln544_fu_344_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign core_on_load_load_fu_434_p1 = core_on;

assign from_decoder_tready = ret_fu_236_p2;

assign from_decoder_tvalid_s_read_fu_123_p2 = from_decoder_tvalid;

assign icmp_ln883_fu_260_p2 = ((from_decoder_tkeep != 64'd0) ? 1'b1 : 1'b0);

assign pkt_cnt_tx = pkt_cnt_tx_reg;

assign ret_fu_236_p2 = (to_app_tready & start_flag);

assign start_initialized_s_load_fu_316_p1 = start_initialized;

assign sub_ln214_fu_276_p2 = (time_cnt_reg - tx_start);

assign time_cnt = time_cnt_reg;

assign tmp_fu_420_p3 = time_cnt_reg[32'd5];

assign to_app_tdata = ((and_ln883_fu_350_p2[0:0] === 1'b1) ? from_decoder_tdata : 512'd0);

assign to_app_tkeep = ((and_ln883_fu_350_p2[0:0] === 1'b1) ? from_decoder_tkeep : 64'd0);

assign to_app_tlast = (from_decoder_tlast & and_ln883_fu_350_p2);

assign to_app_tvalid = and_ln883_fu_350_p2;

assign to_cmp_fifo_tdata = ((and_ln51_1_fu_388_p2[0:0] === 1'b1) ? from_decoder_tdata : 512'd0);

assign to_cmp_fifo_tkeep = ((and_ln51_1_fu_388_p2[0:0] === 1'b1) ? from_decoder_tkeep : 64'd0);

assign to_cmp_fifo_tlast = (from_decoder_tlast & and_ln51_1_fu_388_p2);

assign to_cmp_fifo_tvalid = and_ln51_1_fu_388_p2;

assign tx_timeElapse = tx_timeElapse_reg;

assign tx_timestamp_sum = tx_timestamp_sum_reg;

assign zext_ln700_fu_288_p1 = time_cnt_reg;

endmodule //traffic_gen_tx