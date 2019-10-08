#include <sstream>
using namespace std;
bool arg_parser(int argc, char** argv,
	string & outputFilepath_s, int & pkt_num, int & min_pkt_len, int & max_pkt_len, double & idle_ratio, int & data_width);
