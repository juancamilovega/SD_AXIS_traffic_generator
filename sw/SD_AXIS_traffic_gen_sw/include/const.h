#include <stdint.h>
/* utility functions */
#define LOG_1(n) (((n) >= 2) ? 1 : 0)
#define LOG_2(n) (((n) >= 1<<2) ? (2 + LOG_1((n)>>2)) : LOG_1(n))
#define LOG_4(n) (((n) >= 1<<4) ? (4 + LOG_2((n)>>4)) : LOG_2(n))
#define LOG_8(n) (((n) >= 1<<8) ? (8 + LOG_4((n)>>8)) : LOG_4(n))
#define LOG(n)   (((n) >= 1<<16) ? (16 + LOG_8((n)>>16)) : LOG_8(n))

/* constants */
#define X86 0
#define ARM 1
#define DMA_BUFFER_SIZE 4*1024*1024 //4MB
#define DMA_BUFFER_SIZE_IN_PAGE 4*1024*1024/4096 //1024

/* data types */
typedef uint64_t u64;
typedef uint32_t u32;
