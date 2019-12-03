#include <stdint.h>
#include "hw.h"
#include "libaxidma.h" // Interface of the AXI DMA library
#include "axil_ctrl.h" // axi lite interface 
typedef uint64_t u64;
typedef uint32_t u32;

#define low32(address) ((int)address)
#define high32(address) ((int)(address>>32))

class PS2PL_DATAMOVER {
public:
	void *buf;
	int init(AXIL_CONTROLLER * controller);
	int allocate_buf();
	int transfer(u64 offset, u32 size);
private:
	axidma_dev_t axidma_dev;
	const array_t *tx_chans;
	AXIL_CONTROLLER *axil_cntlr;
	int buf_allocated;
	int device_inited;
	void clean_up();
};
