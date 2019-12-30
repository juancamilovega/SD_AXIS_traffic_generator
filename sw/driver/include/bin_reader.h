#include <fstream>
#include <stdint.h>
using namespace std;
typedef uint64_t u64;
typedef uint32_t u32;

class BIN_READER {
public:
	u64 page_num;
	u64 actual_size;
	u64 packet_num;
	ifstream inFile;
	int init(const char* inFilePath);
	int read_param();
	int dump_to_buffer(volatile void * buffer_ptr, int size);
};
