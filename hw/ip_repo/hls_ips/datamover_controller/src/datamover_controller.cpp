#include <ap_int.h>
#include "datamover_controller.h"
const ap_uint<8> ZEROx8 = 0;
const ap_uint<9> TYPE = 1;
#define TRANS_LIMITE 4*1024*1024 //4M bytes
void datamover_controller(
	ap_uint<1> start,
	ap_uint<64> offset,
	ap_uint<64> length,
	AXIS & m_axis,
	ap_uint<1> m_axis_tready
)
{
	#pragma HLS INTERFACE ap_ctrl_none port=return 
	#pragma HLS INTERFACE ap_none port=start
	#pragma HLS INTERFACE ap_none port=offset
	#pragma HLS INTERFACE ap_none port=length
	#pragma HLS INTERFACE ap_none port=m_axis
	static ap_uint<1> start_reg, core_on;
	static ap_uint<64> length_reg;
	static ap_uint<64> curr_addr;
	static AXIS m_axis_reg;
	ap_uint<23> byte_to_transfer;

	m_axis = m_axis_reg;
	if (!start_reg & start) {
		core_on = 1;
		curr_addr = offset;
		length_reg = length;
	} else if (m_axis_tready) {
		if (!core_on) {
			m_axis_reg.tdata = 0;
			m_axis_reg.tvalid = 0;
		} else {
			byte_to_transfer = length_reg > TRANS_LIMITE ? TRANS_LIMITE : length_reg(22,0);
			m_axis_reg.tdata = (ZEROx8,curr_addr,TYPE,byte_to_transfer);
			m_axis_reg.tvalid = 1;
			if (length_reg > TRANS_LIMITE) {
				length_reg -= TRANS_LIMITE;
				curr_addr += TRANS_LIMITE;
			} else {
				core_on = 0;
			}
		}
	}
	start_reg = start;
}
