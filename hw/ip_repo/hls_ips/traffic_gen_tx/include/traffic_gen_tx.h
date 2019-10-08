#include <ap_int.h>
struct AXIS {
	ap_uint<512> tdata;
	ap_uint<64> tkeep;
	ap_uint<1> tlast;
	ap_uint<1> tvalid;
};
const AXIS AXIS_IDLE = {0,0,0,0};
