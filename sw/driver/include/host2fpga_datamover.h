#include <stdint.h>
#include "hw.h"
#include "axil_ctrl.h" // axi lite interface 
typedef uint64_t u64;
typedef uint32_t u32;

#define low32(address) ((int)address)
#define high32(address) ((int)(address>>32))

class HOST2FPGA_DATAMOVER {
public:
	void *buf;
	int init(AXIL_CONTROLLER * controller);
	int allocate_buf();
	int transfer(u64 offset, u32 size);
private:
	int dma_to_device_fd;
	AXIL_CONTROLLER *axil_cntlr;
	int buf_allocated;
	int device_inited;
	void clean_up();
};
