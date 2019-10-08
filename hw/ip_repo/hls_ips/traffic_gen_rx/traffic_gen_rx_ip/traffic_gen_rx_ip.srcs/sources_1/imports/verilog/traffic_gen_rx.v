// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="traffic_gen_rx,hls_ip_2019_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xczu19eg-ffvc1760-2-i,HLS_INPUT_CLOCK=3.103000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.715000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=163,HLS_SYN_LUT=1511,HLSERSION=2019_1}" *)

module traffic_gen_rx (
        ap_clk,
        ap_rst,
        from_app_tdata,
        from_app_tkeep,
        from_app_tlast,
        from_app_tvalid,
        from_app_tready,
        from_cmp_fifo_tdata,
        from_cmp_fifo_tkeep,
        from_cmp_fifo_tlast,
        from_cmp_fifo_tvalid,
        from_cmp_fifo_tready,
        time_cnt,
        mismatch,
        rx_timeElapse,
        rx_timestamp_sum,
        pkt_cnt_rx
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input  [511:0] from_app_tdata;
input  [63:0] from_app_tkeep;
input  [0:0] from_app_tlast;
input  [0:0] from_app_tvalid;
output  [0:0] from_app_tready;
input  [511:0] from_cmp_fifo_tdata;
input  [63:0] from_cmp_fifo_tkeep;
input  [0:0] from_cmp_fifo_tlast;
input  [0:0] from_cmp_fifo_tvalid;
output  [0:0] from_cmp_fifo_tready;
input  [31:0] time_cnt;
output  [0:0] mismatch;
output  [31:0] rx_timeElapse;
output  [63:0] rx_timestamp_sum;
output  [31:0] pkt_cnt_rx;

reg   [31:0] rx_timeElapse_reg;
reg   [63:0] rx_timestamp_sum_reg;
reg   [31:0] pkt_cnt_rx_reg;
reg   [31:0] rx_start;
reg   [0:0] start_initialized;
reg   [0:0] mismatch_reg;
wire   [31:0] sub_ln214_fu_333_p2;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] ret_fu_323_p2;
wire   [63:0] add_ln700_fu_349_p2;
wire   [31:0] add_ln700_1_fu_361_p2;
wire   [0:0] start_initialized_s_load_fu_373_p1;
wire   [0:0] lhs_read_fu_237_p2;
wire   [0:0] xor_ln883_1_fu_1566_p2;
wire   [0:0] icmp_ln883_1_fu_1560_p2;
wire   [0:0] icmp_ln883_fu_1554_p2;
wire   [0:0] from_cmp_fifo_tvalid_read_fu_278_p2;
wire   [63:0] zext_ln700_fu_345_p1;
wire   [0:0] tmp_2_fu_406_p3;
wire   [0:0] tmp_3_fu_422_p3;
wire   [0:0] tmp_4_fu_438_p3;
wire   [0:0] tmp_5_fu_454_p3;
wire   [0:0] tmp_6_fu_470_p3;
wire   [0:0] tmp_7_fu_486_p3;
wire   [0:0] tmp_8_fu_502_p3;
wire   [0:0] tmp_9_fu_518_p3;
wire   [0:0] tmp_10_fu_534_p3;
wire   [0:0] tmp_11_fu_550_p3;
wire   [0:0] tmp_12_fu_566_p3;
wire   [0:0] tmp_13_fu_582_p3;
wire   [0:0] tmp_14_fu_598_p3;
wire   [0:0] tmp_15_fu_614_p3;
wire   [0:0] tmp_16_fu_630_p3;
wire   [0:0] tmp_17_fu_646_p3;
wire   [0:0] tmp_18_fu_662_p3;
wire   [0:0] tmp_19_fu_678_p3;
wire   [0:0] tmp_20_fu_694_p3;
wire   [0:0] tmp_21_fu_710_p3;
wire   [0:0] tmp_22_fu_726_p3;
wire   [0:0] tmp_23_fu_742_p3;
wire   [0:0] tmp_24_fu_758_p3;
wire   [0:0] tmp_25_fu_774_p3;
wire   [0:0] tmp_26_fu_790_p3;
wire   [0:0] tmp_27_fu_806_p3;
wire   [0:0] tmp_28_fu_822_p3;
wire   [0:0] tmp_29_fu_838_p3;
wire   [0:0] tmp_30_fu_854_p3;
wire   [0:0] tmp_31_fu_870_p3;
wire   [0:0] tmp_32_fu_886_p3;
wire   [0:0] tmp_33_fu_902_p3;
wire   [0:0] tmp_34_fu_918_p3;
wire   [0:0] tmp_35_fu_934_p3;
wire   [0:0] tmp_36_fu_950_p3;
wire   [0:0] tmp_37_fu_966_p3;
wire   [0:0] tmp_38_fu_982_p3;
wire   [0:0] tmp_39_fu_998_p3;
wire   [0:0] tmp_40_fu_1014_p3;
wire   [0:0] tmp_41_fu_1030_p3;
wire   [0:0] tmp_42_fu_1046_p3;
wire   [0:0] tmp_43_fu_1062_p3;
wire   [0:0] tmp_44_fu_1078_p3;
wire   [0:0] tmp_45_fu_1094_p3;
wire   [0:0] tmp_46_fu_1110_p3;
wire   [0:0] tmp_47_fu_1126_p3;
wire   [0:0] tmp_48_fu_1142_p3;
wire   [0:0] tmp_49_fu_1158_p3;
wire   [0:0] tmp_50_fu_1174_p3;
wire   [0:0] tmp_51_fu_1190_p3;
wire   [0:0] tmp_52_fu_1206_p3;
wire   [0:0] tmp_53_fu_1222_p3;
wire   [0:0] tmp_54_fu_1238_p3;
wire   [0:0] tmp_55_fu_1254_p3;
wire   [0:0] tmp_56_fu_1270_p3;
wire   [0:0] tmp_57_fu_1286_p3;
wire   [0:0] tmp_58_fu_1302_p3;
wire   [0:0] tmp_59_fu_1318_p3;
wire   [0:0] tmp_60_fu_1334_p3;
wire   [0:0] tmp_61_fu_1350_p3;
wire   [0:0] tmp_62_fu_1366_p3;
wire   [0:0] tmp_63_fu_1382_p3;
wire   [0:0] trunc_ln791_fu_394_p1;
wire   [0:0] tmp_1_fu_398_p3;
wire   [7:0] select_ln5_fu_414_p3;
wire   [7:0] select_ln6_fu_430_p3;
wire   [7:0] select_ln7_fu_446_p3;
wire   [7:0] select_ln8_fu_462_p3;
wire   [7:0] select_ln9_fu_478_p3;
wire   [7:0] select_ln10_fu_494_p3;
wire   [7:0] select_ln11_fu_510_p3;
wire   [7:0] select_ln12_fu_526_p3;
wire   [7:0] select_ln13_fu_542_p3;
wire   [7:0] select_ln14_fu_558_p3;
wire   [7:0] select_ln15_fu_574_p3;
wire   [7:0] select_ln16_fu_590_p3;
wire   [7:0] select_ln17_fu_606_p3;
wire   [7:0] select_ln18_fu_622_p3;
wire   [7:0] select_ln19_fu_638_p3;
wire   [7:0] select_ln20_fu_654_p3;
wire   [7:0] select_ln21_fu_670_p3;
wire   [7:0] select_ln22_fu_686_p3;
wire   [7:0] select_ln23_fu_702_p3;
wire   [7:0] select_ln24_fu_718_p3;
wire   [7:0] select_ln25_fu_734_p3;
wire   [7:0] select_ln26_fu_750_p3;
wire   [7:0] select_ln27_fu_766_p3;
wire   [7:0] select_ln28_fu_782_p3;
wire   [7:0] select_ln29_fu_798_p3;
wire   [7:0] select_ln30_fu_814_p3;
wire   [7:0] select_ln31_fu_830_p3;
wire   [7:0] select_ln32_fu_846_p3;
wire   [7:0] select_ln33_fu_862_p3;
wire   [7:0] select_ln34_fu_878_p3;
wire   [7:0] select_ln35_fu_894_p3;
wire   [7:0] select_ln36_fu_910_p3;
wire   [7:0] select_ln37_fu_926_p3;
wire   [7:0] select_ln38_fu_942_p3;
wire   [7:0] select_ln39_fu_958_p3;
wire   [7:0] select_ln40_fu_974_p3;
wire   [7:0] select_ln41_fu_990_p3;
wire   [7:0] select_ln42_fu_1006_p3;
wire   [7:0] select_ln43_fu_1022_p3;
wire   [7:0] select_ln44_fu_1038_p3;
wire   [7:0] select_ln45_fu_1054_p3;
wire   [7:0] select_ln46_fu_1070_p3;
wire   [7:0] select_ln47_fu_1086_p3;
wire   [7:0] select_ln48_fu_1102_p3;
wire   [7:0] select_ln49_fu_1118_p3;
wire   [7:0] select_ln50_fu_1134_p3;
wire   [7:0] select_ln51_fu_1150_p3;
wire   [7:0] select_ln52_fu_1166_p3;
wire   [7:0] select_ln53_fu_1182_p3;
wire   [7:0] select_ln54_fu_1198_p3;
wire   [7:0] select_ln55_fu_1214_p3;
wire   [7:0] select_ln56_fu_1230_p3;
wire   [7:0] select_ln57_fu_1246_p3;
wire   [7:0] select_ln58_fu_1262_p3;
wire   [7:0] select_ln59_fu_1278_p3;
wire   [7:0] select_ln60_fu_1294_p3;
wire   [7:0] select_ln61_fu_1310_p3;
wire   [7:0] select_ln62_fu_1326_p3;
wire   [7:0] select_ln63_fu_1342_p3;
wire   [7:0] select_ln64_fu_1358_p3;
wire   [7:0] select_ln65_fu_1374_p3;
wire   [7:0] select_ln66_fu_1390_p3;
wire   [7:0] select_ln67_fu_1398_p3;
wire   [504:0] tmp_fu_1406_p65;
wire   [511:0] xor_ln883_fu_1542_p2;
wire  signed [511:0] p_Result_s_fu_1538_p1;
wire   [511:0] and_ln883_fu_1548_p2;
reg   [0:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 rx_timeElapse_reg = 32'd0;
#0 rx_timestamp_sum_reg = 64'd0;
#0 pkt_cnt_rx_reg = 32'd0;
#0 rx_start = 32'd0;
#0 start_initialized = 1'd0;
#0 mismatch_reg = 1'd0;
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
        mismatch_reg <= 1'd0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state1) & (((((lhs_read_fu_237_p2 == 1'd1) & (icmp_ln883_1_fu_1560_p2 == 1'd0)) | ((xor_ln883_1_fu_1566_p2 == 1'd1) & (lhs_read_fu_237_p2 == 1'd1))) | ((lhs_read_fu_237_p2 == 1'd1) & (icmp_ln883_fu_1554_p2 == 1'd0))) | ((lhs_read_fu_237_p2 == 1'd1) & (from_cmp_fifo_tvalid_read_fu_278_p2 == 1'd0))))) begin
            mismatch_reg <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        pkt_cnt_rx_reg <= 32'd0;
    end else begin
        if (((ret_fu_323_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
            pkt_cnt_rx_reg <= add_ln700_1_fu_361_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        rx_start <= 32'd0;
    end else begin
        if (((start_initialized_s_load_fu_373_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
            rx_start <= time_cnt;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        rx_timeElapse_reg <= 32'd0;
    end else begin
        if (((ret_fu_323_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
            rx_timeElapse_reg <= sub_ln214_fu_333_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        rx_timestamp_sum_reg <= 64'd0;
    end else begin
        if (((ret_fu_323_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
            rx_timestamp_sum_reg <= add_ln700_fu_349_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_initialized <= 1'd0;
    end else begin
        if (((lhs_read_fu_237_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
            start_initialized <= 1'd1;
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

assign add_ln700_1_fu_361_p2 = (pkt_cnt_rx_reg + 32'd1);

assign add_ln700_fu_349_p2 = (rx_timestamp_sum_reg + zext_ln700_fu_345_p1);

assign and_ln883_fu_1548_p2 = (xor_ln883_fu_1542_p2 & p_Result_s_fu_1538_p1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign from_app_tready = 1'd1;

assign from_cmp_fifo_tready = from_app_tvalid;

assign from_cmp_fifo_tvalid_read_fu_278_p2 = from_cmp_fifo_tvalid;

assign icmp_ln883_1_fu_1560_p2 = ((from_app_tkeep == from_cmp_fifo_tkeep) ? 1'b1 : 1'b0);

assign icmp_ln883_fu_1554_p2 = ((and_ln883_fu_1548_p2 == 512'd0) ? 1'b1 : 1'b0);

assign lhs_read_fu_237_p2 = from_app_tvalid;

assign mismatch = mismatch_reg;

assign p_Result_s_fu_1538_p1 = $signed(tmp_fu_1406_p65);

assign pkt_cnt_rx = pkt_cnt_rx_reg;

assign ret_fu_323_p2 = (from_app_tvalid & from_app_tlast);

assign rx_timeElapse = rx_timeElapse_reg;

assign rx_timestamp_sum = rx_timestamp_sum_reg;

assign select_ln10_fu_494_p3 = ((tmp_7_fu_486_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln11_fu_510_p3 = ((tmp_8_fu_502_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln12_fu_526_p3 = ((tmp_9_fu_518_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln13_fu_542_p3 = ((tmp_10_fu_534_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln14_fu_558_p3 = ((tmp_11_fu_550_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln15_fu_574_p3 = ((tmp_12_fu_566_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln16_fu_590_p3 = ((tmp_13_fu_582_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln17_fu_606_p3 = ((tmp_14_fu_598_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln18_fu_622_p3 = ((tmp_15_fu_614_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln19_fu_638_p3 = ((tmp_16_fu_630_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln20_fu_654_p3 = ((tmp_17_fu_646_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln21_fu_670_p3 = ((tmp_18_fu_662_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln22_fu_686_p3 = ((tmp_19_fu_678_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln23_fu_702_p3 = ((tmp_20_fu_694_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln24_fu_718_p3 = ((tmp_21_fu_710_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln25_fu_734_p3 = ((tmp_22_fu_726_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln26_fu_750_p3 = ((tmp_23_fu_742_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln27_fu_766_p3 = ((tmp_24_fu_758_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln28_fu_782_p3 = ((tmp_25_fu_774_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln29_fu_798_p3 = ((tmp_26_fu_790_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln30_fu_814_p3 = ((tmp_27_fu_806_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln31_fu_830_p3 = ((tmp_28_fu_822_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln32_fu_846_p3 = ((tmp_29_fu_838_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln33_fu_862_p3 = ((tmp_30_fu_854_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln34_fu_878_p3 = ((tmp_31_fu_870_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln35_fu_894_p3 = ((tmp_32_fu_886_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln36_fu_910_p3 = ((tmp_33_fu_902_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln37_fu_926_p3 = ((tmp_34_fu_918_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln38_fu_942_p3 = ((tmp_35_fu_934_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln39_fu_958_p3 = ((tmp_36_fu_950_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln40_fu_974_p3 = ((tmp_37_fu_966_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln41_fu_990_p3 = ((tmp_38_fu_982_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln42_fu_1006_p3 = ((tmp_39_fu_998_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln43_fu_1022_p3 = ((tmp_40_fu_1014_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln44_fu_1038_p3 = ((tmp_41_fu_1030_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln45_fu_1054_p3 = ((tmp_42_fu_1046_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln46_fu_1070_p3 = ((tmp_43_fu_1062_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln47_fu_1086_p3 = ((tmp_44_fu_1078_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln48_fu_1102_p3 = ((tmp_45_fu_1094_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln49_fu_1118_p3 = ((tmp_46_fu_1110_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln50_fu_1134_p3 = ((tmp_47_fu_1126_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln51_fu_1150_p3 = ((tmp_48_fu_1142_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln52_fu_1166_p3 = ((tmp_49_fu_1158_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln53_fu_1182_p3 = ((tmp_50_fu_1174_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln54_fu_1198_p3 = ((tmp_51_fu_1190_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln55_fu_1214_p3 = ((tmp_52_fu_1206_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln56_fu_1230_p3 = ((tmp_53_fu_1222_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln57_fu_1246_p3 = ((tmp_54_fu_1238_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln58_fu_1262_p3 = ((tmp_55_fu_1254_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln59_fu_1278_p3 = ((tmp_56_fu_1270_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln5_fu_414_p3 = ((tmp_2_fu_406_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln60_fu_1294_p3 = ((tmp_57_fu_1286_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln61_fu_1310_p3 = ((tmp_58_fu_1302_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln62_fu_1326_p3 = ((tmp_59_fu_1318_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln63_fu_1342_p3 = ((tmp_60_fu_1334_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln64_fu_1358_p3 = ((tmp_61_fu_1350_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln65_fu_1374_p3 = ((tmp_62_fu_1366_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln66_fu_1390_p3 = ((tmp_63_fu_1382_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln67_fu_1398_p3 = ((trunc_ln791_fu_394_p1[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln6_fu_430_p3 = ((tmp_3_fu_422_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln7_fu_446_p3 = ((tmp_4_fu_438_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln8_fu_462_p3 = ((tmp_5_fu_454_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign select_ln9_fu_478_p3 = ((tmp_6_fu_470_p3[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign start_initialized_s_load_fu_373_p1 = start_initialized;

assign sub_ln214_fu_333_p2 = (time_cnt - rx_start);

assign tmp_10_fu_534_p3 = from_cmp_fifo_tkeep[32'd54];

assign tmp_11_fu_550_p3 = from_cmp_fifo_tkeep[32'd53];

assign tmp_12_fu_566_p3 = from_cmp_fifo_tkeep[32'd52];

assign tmp_13_fu_582_p3 = from_cmp_fifo_tkeep[32'd51];

assign tmp_14_fu_598_p3 = from_cmp_fifo_tkeep[32'd50];

assign tmp_15_fu_614_p3 = from_cmp_fifo_tkeep[32'd49];

assign tmp_16_fu_630_p3 = from_cmp_fifo_tkeep[32'd48];

assign tmp_17_fu_646_p3 = from_cmp_fifo_tkeep[32'd47];

assign tmp_18_fu_662_p3 = from_cmp_fifo_tkeep[32'd46];

assign tmp_19_fu_678_p3 = from_cmp_fifo_tkeep[32'd45];

assign tmp_1_fu_398_p3 = from_cmp_fifo_tkeep[32'd63];

assign tmp_20_fu_694_p3 = from_cmp_fifo_tkeep[32'd44];

assign tmp_21_fu_710_p3 = from_cmp_fifo_tkeep[32'd43];

assign tmp_22_fu_726_p3 = from_cmp_fifo_tkeep[32'd42];

assign tmp_23_fu_742_p3 = from_cmp_fifo_tkeep[32'd41];

assign tmp_24_fu_758_p3 = from_cmp_fifo_tkeep[32'd40];

assign tmp_25_fu_774_p3 = from_cmp_fifo_tkeep[32'd39];

assign tmp_26_fu_790_p3 = from_cmp_fifo_tkeep[32'd38];

assign tmp_27_fu_806_p3 = from_cmp_fifo_tkeep[32'd37];

assign tmp_28_fu_822_p3 = from_cmp_fifo_tkeep[32'd36];

assign tmp_29_fu_838_p3 = from_cmp_fifo_tkeep[32'd35];

assign tmp_2_fu_406_p3 = from_cmp_fifo_tkeep[32'd62];

assign tmp_30_fu_854_p3 = from_cmp_fifo_tkeep[32'd34];

assign tmp_31_fu_870_p3 = from_cmp_fifo_tkeep[32'd33];

assign tmp_32_fu_886_p3 = from_cmp_fifo_tkeep[32'd32];

assign tmp_33_fu_902_p3 = from_cmp_fifo_tkeep[32'd31];

assign tmp_34_fu_918_p3 = from_cmp_fifo_tkeep[32'd30];

assign tmp_35_fu_934_p3 = from_cmp_fifo_tkeep[32'd29];

assign tmp_36_fu_950_p3 = from_cmp_fifo_tkeep[32'd28];

assign tmp_37_fu_966_p3 = from_cmp_fifo_tkeep[32'd27];

assign tmp_38_fu_982_p3 = from_cmp_fifo_tkeep[32'd26];

assign tmp_39_fu_998_p3 = from_cmp_fifo_tkeep[32'd25];

assign tmp_3_fu_422_p3 = from_cmp_fifo_tkeep[32'd61];

assign tmp_40_fu_1014_p3 = from_cmp_fifo_tkeep[32'd24];

assign tmp_41_fu_1030_p3 = from_cmp_fifo_tkeep[32'd23];

assign tmp_42_fu_1046_p3 = from_cmp_fifo_tkeep[32'd22];

assign tmp_43_fu_1062_p3 = from_cmp_fifo_tkeep[32'd21];

assign tmp_44_fu_1078_p3 = from_cmp_fifo_tkeep[32'd20];

assign tmp_45_fu_1094_p3 = from_cmp_fifo_tkeep[32'd19];

assign tmp_46_fu_1110_p3 = from_cmp_fifo_tkeep[32'd18];

assign tmp_47_fu_1126_p3 = from_cmp_fifo_tkeep[32'd17];

assign tmp_48_fu_1142_p3 = from_cmp_fifo_tkeep[32'd16];

assign tmp_49_fu_1158_p3 = from_cmp_fifo_tkeep[32'd15];

assign tmp_4_fu_438_p3 = from_cmp_fifo_tkeep[32'd60];

assign tmp_50_fu_1174_p3 = from_cmp_fifo_tkeep[32'd14];

assign tmp_51_fu_1190_p3 = from_cmp_fifo_tkeep[32'd13];

assign tmp_52_fu_1206_p3 = from_cmp_fifo_tkeep[32'd12];

assign tmp_53_fu_1222_p3 = from_cmp_fifo_tkeep[32'd11];

assign tmp_54_fu_1238_p3 = from_cmp_fifo_tkeep[32'd10];

assign tmp_55_fu_1254_p3 = from_cmp_fifo_tkeep[32'd9];

assign tmp_56_fu_1270_p3 = from_cmp_fifo_tkeep[32'd8];

assign tmp_57_fu_1286_p3 = from_cmp_fifo_tkeep[32'd7];

assign tmp_58_fu_1302_p3 = from_cmp_fifo_tkeep[32'd6];

assign tmp_59_fu_1318_p3 = from_cmp_fifo_tkeep[32'd5];

assign tmp_5_fu_454_p3 = from_cmp_fifo_tkeep[32'd59];

assign tmp_60_fu_1334_p3 = from_cmp_fifo_tkeep[32'd4];

assign tmp_61_fu_1350_p3 = from_cmp_fifo_tkeep[32'd3];

assign tmp_62_fu_1366_p3 = from_cmp_fifo_tkeep[32'd2];

assign tmp_63_fu_1382_p3 = from_cmp_fifo_tkeep[32'd1];

assign tmp_6_fu_470_p3 = from_cmp_fifo_tkeep[32'd58];

assign tmp_7_fu_486_p3 = from_cmp_fifo_tkeep[32'd57];

assign tmp_8_fu_502_p3 = from_cmp_fifo_tkeep[32'd56];

assign tmp_9_fu_518_p3 = from_cmp_fifo_tkeep[32'd55];

assign tmp_fu_1406_p65 = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{tmp_1_fu_398_p3}, {select_ln5_fu_414_p3}}, {select_ln6_fu_430_p3}}, {select_ln7_fu_446_p3}}, {select_ln8_fu_462_p3}}, {select_ln9_fu_478_p3}}, {select_ln10_fu_494_p3}}, {select_ln11_fu_510_p3}}, {select_ln12_fu_526_p3}}, {select_ln13_fu_542_p3}}, {select_ln14_fu_558_p3}}, {select_ln15_fu_574_p3}}, {select_ln16_fu_590_p3}}, {select_ln17_fu_606_p3}}, {select_ln18_fu_622_p3}}, {select_ln19_fu_638_p3}}, {select_ln20_fu_654_p3}}, {select_ln21_fu_670_p3}}, {select_ln22_fu_686_p3}}, {select_ln23_fu_702_p3}}, {select_ln24_fu_718_p3}}, {select_ln25_fu_734_p3}}, {select_ln26_fu_750_p3}}, {select_ln27_fu_766_p3}}, {select_ln28_fu_782_p3}}, {select_ln29_fu_798_p3}}, {select_ln30_fu_814_p3}}, {select_ln31_fu_830_p3}}, {select_ln32_fu_846_p3}}, {select_ln33_fu_862_p3}}, {select_ln34_fu_878_p3}}, {select_ln35_fu_894_p3}}, {select_ln36_fu_910_p3}}, {select_ln37_fu_926_p3}}, {select_ln38_fu_942_p3}}, {select_ln39_fu_958_p3}}, {select_ln40_fu_974_p3}}, {select_ln41_fu_990_p3}}, {select_ln42_fu_1006_p3}}, {select_ln43_fu_1022_p3}}, {select_ln44_fu_1038_p3}}, {select_ln45_fu_1054_p3}}, {select_ln46_fu_1070_p3}}, {select_ln47_fu_1086_p3}}, {select_ln48_fu_1102_p3}}, {select_ln49_fu_1118_p3}}, {select_ln50_fu_1134_p3}}, {select_ln51_fu_1150_p3}}, {select_ln52_fu_1166_p3}}, {select_ln53_fu_1182_p3}}, {select_ln54_fu_1198_p3}}, {select_ln55_fu_1214_p3}}, {select_ln56_fu_1230_p3}}, {select_ln57_fu_1246_p3}}, {select_ln58_fu_1262_p3}}, {select_ln59_fu_1278_p3}}, {select_ln60_fu_1294_p3}}, {select_ln61_fu_1310_p3}}, {select_ln62_fu_1326_p3}}, {select_ln63_fu_1342_p3}}, {select_ln64_fu_1358_p3}}, {select_ln65_fu_1374_p3}}, {select_ln66_fu_1390_p3}}, {select_ln67_fu_1398_p3}};

assign trunc_ln791_fu_394_p1 = from_cmp_fifo_tkeep[0:0];

assign xor_ln883_1_fu_1566_p2 = (from_cmp_fifo_tlast ^ from_app_tlast);

assign xor_ln883_fu_1542_p2 = (from_cmp_fifo_tdata ^ from_app_tdata);

assign zext_ln700_fu_345_p1 = time_cnt;

endmodule //traffic_gen_rx