#ifndef FILE_TO_MEM_H
#define FILE_TO_MEM_H 1

#ifndef DATAWIDTH
#define DATAWIDTH 64
#endif
#define RW_MAX_SIZE 134217728 //128M
#include <cstdint>
typedef uint64_t u64;
typedef uint32_t u32;

int file_to_mem_ps(const char* inFilePath, void *const ddr_base, u64 & total_size, u64 & actual_size, u32 & packet_num);
int file_to_mem(const char* inFilePath, void *const ddr_base, u64 & total_size, u64 & actual_size, u32 & packet_num);

#endif
