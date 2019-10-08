#include <ap_int.h>
struct AXIS_MEM {
	ap_uint<512> tdata;
	ap_uint<1> tvalid;
	ap_uint<1> tready;
};
struct AXIS_APP {
	ap_uint<512> tdata;
	ap_uint<1> tkeep[64];
	ap_uint<1> tlast;
	ap_uint<1> tvalid;
	ap_uint<1> tready;
};
