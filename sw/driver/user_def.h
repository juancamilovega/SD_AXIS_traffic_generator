/* -----------------------------------------------------
-  use /dev/mpsoc_axiregs instread of /dev/mem if defined
-  do not set if your system doesn't have /dev/mpsoc_axiregs
   ----------------------------------------------------- */
//#define USE_AXIREGS 

/* -----------------------------------------------------
-  set the mmap base and ip mapped addresses
-  have a look at your vivado register editor before set this
   ----------------------------------------------------- */
<<<<<<< HEAD
#define MAP_BASE 0xA0020000
#define MAP_SIZE 0x30000
=======
#define MAP_BASE 0xA0000000
#define MAP_SIZE 0x10000
>>>>>>> 59c9277b79fb1aa0bdf601e83f74ca1ac127d576
#define DMA_BUFFER_SIZE 4*1024*1024 //4MB
#define DMA_OFFSET 0x2000
#define TRAFFIC_GEN_OFFSET 0x0

/* -----------------------------------------------------
-  choose which AXIDMA to use when there are multiple
   ----------------------------------------------------- */
#define PS_DMA_CHANNEL_ID 0

/* -----------------------------------------------------
-  clock period
   ----------------------------------------------------- */
<<<<<<< HEAD

#define CLOCK_PERIOD 4.5829
=======
#define CLOCK_PERIOD 5
>>>>>>> 59c9277b79fb1aa0bdf601e83f74ca1ac127d576
