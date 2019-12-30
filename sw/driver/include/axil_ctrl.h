#ifdef USE_USER_DEF
	#include "user_def.h"
#endif
#include <stdint.h>
typedef uint32_t u32;
typedef uint64_t u64;
class AXIL_CONTROLLER {
public:
	const char* char_file_path;
	int init(u64 map_base, u32 map_size);
	u32 read(u64 offset);
	void write(u64 offset, u32 val);
private:
	void *base_vptr;
};
