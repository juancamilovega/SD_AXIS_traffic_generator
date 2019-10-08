module dwidth_adjust_tx #
(
	parameter DWIDTH = 512,
	parameter EN_DATA = 1,
	parameter EN_KEEP = 1,
	parameter EN_LAST = 1,
	parameter EN_READY = 1
)
(
	input wire			s_valid,
	output wire			s_ready,
	input wire [511:0]		s_data,
	input wire [63:0]		s_keep,
	input wire			s_last,
	output wire			m_valid,
	input wire			m_ready,
	output wire [DWIDTH-1:0]	m_data,
	output wire [DWIDTH/8-1:0]	m_keep,
	output wire			m_last
);
	wire [DWIDTH-1:0]	data_in;
	wire [DWIDTH/8-1:0]	keep_in;
	wire			last_in;
	wire			ready_in;

	assign m_valid = s_valid;
	assign s_ready = ready_in;
	assign m_data = data_in;
	assign m_keep = keep_in;
	assign m_last = last_in;

	assign data_in = EN_DATA ? s_data[511:512-DWIDTH] : {DWIDTH{1'b0}};
	assign keep_in = EN_KEEP ? s_keep[63:64-DWIDTH/8] : {{DWIDTH/8}{1'b0}};
	assign last_in = EN_LAST ? s_last : 1'b0;
	assign ready_in = EN_READY ? m_ready : 1'b1;
endmodule

module dwidth_adjust_rx #
(       
	parameter DWIDTH = 512,
	parameter EN_DATA = 1,
	parameter EN_KEEP = 1,
	parameter EN_LAST = 1,
	parameter EN_READY = 1

)
(       
	input wire			s_valid,
	output wire			s_ready,
	input wire [DWIDTH-1:0]		s_data,
	input wire [DWIDTH/8-1:0]	s_keep,
	input wire			s_last,
	output wire			m_valid,
	input wire			m_ready,
	output wire [511:0]		m_data,
	output wire [63:0]		m_keep,
	output wire			m_last
);
	wire [DWIDTH-1:0]	data_in;
	wire [DWIDTH/8-1:0]	keep_in;
	wire			last_in;
	wire			ready_in;

	assign m_valid = s_valid;
	assign s_ready = ready_in;
	assign m_data = data_in;
	assign m_keep = keep_in;
	assign m_last = last_in;

	assign data_in = EN_DATA ? {s_data,{{512-DWIDTH}{1'b0}}} : 512'd0;
	assign keep_in = EN_KEEP ? {s_keep,{{64-DWIDTH/8}{1'b0}}} : {{{DWIDTH/8}{1'b1}},{{64-DWIDTH/8}{1'b0}}};
	assign last_in = EN_LAST ? s_last : 1'b0;
	assign ready_in = EN_READY ? m_ready : 1'b1;
endmodule
