/* architecture related configurations */
#ifndef PAGE_SIZE
	#define PAGE_SIZE 4096
#endif
#define PAGE_SHIFT LOG(PAGE_SIZE)
#define PAGE_MASK ~((1<<PAGE_SHIFT)-1)

#ifndef ARCH
	#define ARCH X86
#endif

#if ARCH == ARCH_ARM
	#ifndef AXIL_CHAR_DEV_TYPE
		#define AXIL_CHAR_DEV_TYPE 0 //by default use /dev/mem, not all users have /dev/mpsoc_axiregs
	#endif
	#ifndef PLDMA_ADDR
		#define PLDMA_ADDR 0xA0000000
	#endif
	#if AXIL_CHAR_DEV_TYPE != 0
		#define PLDMA_MM_ADDR PLDMA_ADDR&PAGE_MASK-0xA0000000 //if use /dev/mpsoc_axiregs
		#define PLDMA_MM_OFFSET PLDMA_ADDR-PLDMA_MM_ADDR-0xA0000000
	#else
		#define PLDMA_MM_ADDR PLDMA_ADDR&PAGE_MASK
		#define PLDMA_MM_OFFSET PLDMA_ADDR-PLDMA_MM_ADDR
	#endif
	#ifndef CHANNEL_TO_USE
		#define CHANNEL_TO_USE 0
	#endif
#else
#endif
