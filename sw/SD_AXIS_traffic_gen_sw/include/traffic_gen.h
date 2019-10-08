#include <cstdint>
typedef uint64_t u64;
typedef uint32_t u32;
int do_test(u64 mem_size, u32 actual_size, u32 packet_num, u32 iter_num);
int file_to_mem(const char* inFilePath, u64 & total_size, u64 & actual_size, u32 & packet_num);
