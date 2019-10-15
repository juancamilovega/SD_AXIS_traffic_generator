#ifndef DO_TEST_H
#define DO_TEST_H 1

#define START                   0x10
#define RST                     0x18
#define LEN_LOW                 0x20
#define LEN_HIGH                0x28
#define MISMATCH                0x30
#define TX_TIME_ELAPSE          0x38
#define RX_TIME_ELAPSE          0x40
#define TX_TIMESTAMP_SUM_LOW	0x48
#define TX_TIMESTAMP_SUM_HIGH	0x50
#define RX_TIMESTAMP_SUM_LOW	0x58
#define RX_TIMESTAMP_SUM_HIGH	0x60
#define PKT_CNT_TX              0x68
#define PKT_CNT_RX              0x70
#define DDR_OFFSET_LOW		0x78
#define DDR_OFFSET_HIGH		0x80

#include <cstdint>
typedef uint64_t u64;
typedef uint32_t u32;
const double clock_period = 4;

int do_test_ps(u64 mem_size, void *const base_addr, void *const ddr_offset, u32 actual_size, u32 packet_num, u32 iter_num);
int do_test(u64 mem_size, void *const base_addr, void *const ddr_offset, u32 actual_size, u32 packet_num, u32 iter_num);

#endif
