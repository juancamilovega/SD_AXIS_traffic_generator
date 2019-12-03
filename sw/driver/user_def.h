/* -----------------------------------------------------
-  use /dev/mpsoc_axiregs instread of /dev/mem if defined
-  do not set if your system doesn't have /dev/mpsoc_axiregs
   ----------------------------------------------------- */
//#define USE_AXIREGS 

/* -----------------------------------------------------
-  set the mmap base, have a look at your vivado register
-  editor before set this
   ----------------------------------------------------- */
#define MAP_BASE 0xA0000000
#define MAP_SIZE 0x10000
#define DMA_BUFFER_SIZE 4*1024*1024 //4MB
#define DMA_OFFSET 0x1000

/* -----------------------------------------------------
-  choose which AXIDMA to use when there are multiple
   ----------------------------------------------------- */
#define PS_DMA_CHANNEL_ID 0
