#include <iostream>
#include <fstream>
#include "arg_parser.h"
#include "gen_traffic.h"

using namespace std;
int main(int argc, char** argv) {
        ofstream outFile;
        string outputFilepath_s;
        int pkt_num, max_pkt_len, min_pkt_len, data_width;
        double idle_ratio;
        bool parse_result = arg_parser(argc, argv, outputFilepath_s, pkt_num, min_pkt_len, max_pkt_len, idle_ratio, data_width);
	if (parse_result) return 1;
	const char* outputFilepath = outputFilepath_s.c_str();
        outFile.open(outputFilepath);
        gen_traffic_file(outFile, pkt_num, min_pkt_len, max_pkt_len, idle_ratio, data_width);
        outFile.close();
}
