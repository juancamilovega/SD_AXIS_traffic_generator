module traffic_gen_top #
(
	parameter BIGENDIAN = 1,
	parameter DWIDTH = 512,
	parameter EN_DATA = 1,
	parameter EN_KEEP = 1,
	parameter EN_LAST = 1,
	parameter EN_READY = 1, 
	parameter EN_LOOPBACK = 1
)
(
//clk and rst
	input wire rst,
	input wire mem_clk,
	input wire traffic_clk,
//AXI MM DATA BUS
	input wire to_mem_rvalid,
	input wire to_mem_arready,
	input wire to_mem_rlast,
	input wire [511:0] to_mem_rdata,
	input wire [1:0] to_mem_rresp,
	output wire to_mem_arvalid,
	output wire to_mem_rready,
	output wire [63:0] to_mem_araddr,
	output wire [1:0] to_mem_arburst,
	output wire [3:0] to_mem_arcache,
	output wire [7:0] to_mem_arlen,
	output wire [2:0] to_mem_arprot,
	output wire [2:0] to_mem_arsize,
	output wire [3:0] to_mem_aruser,
//AXI_LITE Slave Ctrl BUS
	input wire [7:0] s_axilite_ctrl_araddr,
	output wire s_axilite_ctrl_arready,
	input wire s_axilite_ctrl_arvalid,
	input wire [7:0] s_axilite_ctrl_awaddr,
	output wire s_axilite_ctrl_awready,
	input wire s_axilite_ctrl_awvalid,
	input wire s_axilite_ctrl_bready,
	output wire [1:0] s_axilite_ctrl_bresp,
	output wire s_axilite_ctrl_bvalid,
	output wire [31:0] s_axilite_ctrl_rdata,
	input wire s_axilite_ctrl_rready,
	output wire [1:0] s_axilite_ctrl_rresp,
	output wire s_axilite_ctrl_rvalid,
	input wire [31:0] s_axilite_ctrl_wdata,
	output wire s_axilite_ctrl_wready,
	input wire [3:0] s_axilite_ctrl_wstrb,
	input wire s_axilite_ctrl_wvalid,
//User traffic tx
	output wire [DWIDTH-1:0] to_app_tdata,
	output wire [DWIDTH/8-1:0] to_app_tkeep,
	output wire to_app_tlast,
	input wire to_app_tready,
	output wire to_app_tvalid,
//User traffic rx
	input wire [DWIDTH-1:0] from_app_tdata,
	input wire [DWIDTH/8-1:0] from_app_tkeep,
	input wire from_app_tlast,
	input wire from_app_tvalid,
	output wire from_app_tready,
//cmp fifo tx
	output wire [511:0] to_cmp_fifo_tdata,
	output wire [63:0] to_cmp_fifo_tkeep,
	output wire to_cmp_fifo_tlast,
	output wire to_cmp_fifo_tvalid,
//cmp fifo rx
	input wire [511:0] from_cmp_fifo_tdata,
	input wire [63:0] from_cmp_fifo_tkeep,
	input wire from_cmp_fifo_tlast,
	input wire from_cmp_fifo_tvalid,
	output wire from_cmp_fifo_tready,
//stats
	output wire start_dbg,
	output wire [63:0] trans_len_dbg,
	output wire [31:0] tx_timeElapse_dbg,
	output wire [63:0] tx_timestamp_sum_dbg,
	output wire [31:0] pkt_cnt_tx_dbg,
	output wire [31:0] time_cnt_dbg,
	output wire mismatch_dbg,
	output wire [31:0] rx_timeElapse_dbg,
	output wire [63:0] rx_timestamp_sum_dbg,
	output wire [31:0] pkt_cnt_rx_dbg,
//rst out
	output wire rst_out
);

//user-faced data width adjustion block
	wire [511:0] to_app_tdata_wide;
	wire [63:0] to_app_tkeep_wide;
	wire to_app_tlast_wide;
	wire to_app_tready_wide;
	wire to_app_tvalid_wide;

	wire [511:0] from_app_tdata_wide;
	wire [63:0] from_app_tkeep_wide;
	wire from_app_tlast_wide;
	wire from_app_tready_wide;
	wire from_app_tvalid_wide;
	//for endianess converter
	wire [DWIDTH-1:0] to_app_tdata_w;
	wire [DWIDTH/8-1:0] to_app_tkeep_w;
 	wire [DWIDTH-1:0] from_app_tdata_w;
	wire [DWIDTH/8-1:0] from_app_tkeep_w;

//to loopback signals
	wire mismatch;
	wire [31:0] rx_timeElapse;
	wire [63:0] rx_timestamp_sum;
	wire [31:0] pkt_cnt_rx;

//tx stats
	wire start;
	wire [31:0] time_cnt;
//rstn
	wire rstn;

SD_AXIS_traffic_gen SD_AXIS_traffic_gen_i (
	.mem_clk(mem_clk),
	.to_cmp_fifo_tdata(to_cmp_fifo_tdata),
	.to_cmp_fifo_tkeep(to_cmp_fifo_tkeep),
	.to_cmp_fifo_tlast(to_cmp_fifo_tlast),
	.to_cmp_fifo_tvalid(to_cmp_fifo_tvalid),
	.mismatch(mismatch),
	.pkt_cnt_rx(pkt_cnt_rx),
	.pkt_cnt_tx(pkt_cnt_tx_dbg),
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
	.start(start_dbg),
	.time_cnt(time_cnt),
	.to_app_tdata(to_app_tdata_wide),
	.to_app_tkeep(to_app_tkeep_wide),
	.to_app_tlast(to_app_tlast_wide),
	.to_app_tready(to_app_tready_wide),
	.to_app_tvalid(to_app_tvalid_wide),
	.to_mem_araddr(to_mem_araddr),
	.to_mem_arburst(to_mem_arburst),
	.to_mem_arcache(to_mem_arcache),
	.to_mem_arlen(to_mem_arlen),
	.to_mem_arprot(to_mem_arprot),
	.to_mem_arready(to_mem_arready),
	.to_mem_arsize(to_mem_arsize),
	.to_mem_aruser(to_mem_aruser),
	.to_mem_arvalid(to_mem_arvalid),
	.to_mem_rdata(to_mem_rdata),
	.to_mem_rlast(to_mem_rlast),
	.to_mem_rready(to_mem_rready),
	.to_mem_rresp(to_mem_rresp),
	.to_mem_rvalid(to_mem_rvalid),
	.traffic_clk(traffic_clk),
	.transfer_length(trans_len_dbg),
	.tx_timeElapse(tx_timeElapse_dbg),
	.tx_timestamp_sum(tx_timestamp_sum_dbg));

dwidth_adjust_tx #(
	.DWIDTH(DWIDTH),
	.EN_DATA(EN_DATA),
	.EN_KEEP(EN_KEEP),
	.EN_LAST(EN_LAST),
	.EN_READY(EN_READY)
)
dwidth_adjust_tx_i (
	.s_valid(to_app_tvalid_wide),
	.s_ready(to_app_tready_wide),
	.s_data(to_app_tdata_wide),
	.s_keep(to_app_tkeep_wide),
	.s_last(to_app_tlast_wide),
	.m_valid(to_app_tvalid),
	.m_ready(to_app_tready),
	.m_data(to_app_tdata_w),
	.m_keep(to_app_tkeep_w),
	.m_last(to_app_tlast)
);

if (EN_LOOPBACK) begin
		dwidth_adjust_rx #(
			.DWIDTH(DWIDTH),
			.EN_DATA(EN_DATA),
			.EN_KEEP(EN_KEEP),
			.EN_LAST(EN_LAST),
			.EN_READY(EN_READY)
		)
		dwidth_adjust_rx_i (
			.s_valid(from_app_tvalid),
			.s_ready(from_app_tready),
			.s_data(from_app_tdata_w),
			.s_keep(from_app_tkeep_w),
			.s_last(from_app_tlast),
			.m_valid(from_app_tvalid_wide),
			.m_ready(from_app_tready_wide),
			.m_data(from_app_tdata_wide),
			.m_keep(from_app_tkeep_wide),
			.m_last(from_app_tlast_wide)
		);
	SD_AXIS_traffic_gen_loopback SD_AXIS_traffic_gen_loopback_i (
		.traffic_clk(traffic_clk),
		.rst(rst_out),
		.from_app_tdata(from_app_tdata_wide),
		.from_app_tkeep(from_app_tkeep_wide),
		.from_app_tlast(from_app_tlast_wide),
		.from_app_tready(from_app_tready_wide),
		.from_app_tvalid(from_app_tvalid_wide),
		.from_cmp_fifo_tdata(from_cmp_fifo_tdata),
		.from_cmp_fifo_tkeep(from_cmp_fifo_tkeep),
		.from_cmp_fifo_tlast(from_cmp_fifo_tlast),
		.from_cmp_fifo_tready(from_cmp_fifo_tready),
		.from_cmp_fifo_tvalid(from_cmp_fifo_tvalid),
		.mismatch(mismatch),
		.pkt_cnt_rx(pkt_cnt_rx),
		.rx_timeElapse(rx_timeElapse),
		.rx_timestamp_sum(rx_timestamp_sum),
		.time_cnt(time_cnt)
	);
end
else begin
	assign mismatch = 1'b0;
	assign pkt_cnt_rx = 32'd0;
	assign rx_timeElapse = 32'd0;
	assign rx_timestamp_sum = 64'd0;
end
if (BIGENDIAN) begin
	assign to_app_tdata = to_app_tdata_w;
	assign to_app_tkeep = to_app_tkeep_w;
	assign from_app_tdata_w = from_app_tdata;
	assign from_app_tkeep_w = from_app_tkeep;
end
else begin
	genvar i;
	for (i = 0; i < DWIDTH/8; i = i + 1) begin: endianness_convert
		assign to_app_tdata[DWIDTH-i*8-1:DWIDTH-i*8-8] = to_app_tdata_w[i*8+7:i*8];
		assign to_app_tkeep[DWIDTH/8-i] = to_app_tkeep_w[i];
		assign from_app_tdata_w[DWIDTH-i*8-1:DWIDTH-i*8-8] = from_app_tdata[i*8+7:i*8];
		assign from_app_tkeep_w[DWIDTH/8-i] = from_app_tkeep[i];
	end
end

//tx
	assign mismatch_dbg = mismatch;
	assign time_cnt_dbg = time_cnt;
//rx
	assign mismatch_dbg = mismatch;
	assign pkt_cnt_rx_dbg = pkt_cnt_rx;
	assign rx_timeElapse_dbg = rx_timeElapse;
	assign rx_timestamp_sum_dbg = rx_timestamp_sum;
//reset
	assign rstn = ~rst;
endmodule
