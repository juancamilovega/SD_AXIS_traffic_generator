#include <stdint.h>
#include "data_handler.h"
using namespace std;
typedef uint64_t u64;
typedef uint32_t u32;

#define low32(address) ((int)address)
#define high32(address) ((int)(address>>32))

class CONTROL_HANDLER {
public:
	int do_test(int iter_num);
	CONTROL_HANDLER(AXIL_CONTROLLER *controller, DATA_HANDLER *d_handler) :
	total_size_low(low32(d_handler->page_num*PAGE_SIZE)),
	total_size_high(high32(d_handler->page_num*PAGE_SIZE)),
	actual_size(d_handler->actual_size), 
	packet_num(d_handler->packet_num),
	axil_cntlr(controller) {}
private:
	u32 total_size_low;
	u32 total_size_high;
	u64 actual_size;
	u64 packet_num;
	AXIL_CONTROLLER *axil_cntlr;
};
