/* -----------------------------------------------------
-  XDMA related parameters
   ----------------------------------------------------- */
#define XDMA_USER_DEV "/dev/xdma0_user"
#define XDMA_H2C_DEV "/dev/xdma0_h2c_0"
#define DMA_BUFFER_SIZE 64*1024*1024 //64MB

/* -----------------------------------------------------
-  set ip mapped address
-  have a look at your vivado register editor before
-  setting this
   ----------------------------------------------------- */
#define TRAFFIC_GEN_OFFSET 0x0

/* -----------------------------------------------------
-  default clock freqency is 250MHz
-  cannot be largger than 63/64 of the memory clock
   ----------------------------------------------------- */
#define CLOCK_PERIOD 4

/* -----------------------------------------------------
-  system paramerters
   ----------------------------------------------------- */
#define FPGA_DDR_ADDR_RANGE 0x400000000 //16GB
#define PAGE_SIZE 4096
