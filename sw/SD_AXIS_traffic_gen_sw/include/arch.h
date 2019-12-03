#ifdef USE_USER_DEF
	#include "user_def.h"
#endif
/* architecture related configurations */
#ifndef PAGE_SIZE
	#define PAGE_SIZE 4096
#endif

#define PLDDR_ADDR_RANGE 0x400000000 //16GB

#ifndef MAP_BASE
	#define MAP_BASE 0xA0000000
#endif
#ifndef MAP_SIZE 
	#define MAP_SIZE 0x00010000
#endif

#ifndef DMA_BUFFER_SIZE
	#define DMA_BUFFER_SIZE 4*1024*1024 //4MB
#endif

#define DMA_BUFFER_SIZE_IN_PAGE DMA_BUFFER_SIZE/PAGE_SIZE

#ifndef DMA_OFFSET
	#define DMA_OFFSET 0
#endif

#ifndef PS_DMA_CHANNEL_ID
        #define PS_DMA_CHANNEL_ID 0
#endif

/* PL AXIDMA AXI-lite protocol */
#define DMA_S2MM_OFFSET 0x30

#define DMA_CtrlReg_OFFSET DMA_OFFSET+DMA_S2MM_OFFSET+0x0
#define DMA_StatsReg_OFFSET DMA_OFFSET+DMA_S2MM_OFFSET+0x4

#define DMA_MemLoc_OFFSET DMA_OFFSET+DMA_S2MM_OFFSET+0x18
#define DMA_MemLoc_MSB_OFFSET DMA_OFFSET+DMA_S2MM_OFFSET+0x1C

#define DMA_BUFFLEN_OFFSET DMA_OFFSET+DMA_S2MM_OFFSET+0x28

#define DMA_CR_RUNSTOP_MASK 0x1
