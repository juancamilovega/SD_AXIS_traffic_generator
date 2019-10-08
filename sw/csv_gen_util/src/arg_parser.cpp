#include <boost/program_options.hpp>
#include <boost/algorithm/string.hpp>
#include <iostream>
#include <sstream>
using namespace std;
using namespace boost::program_options;
using namespace boost;

bool arg_parser(int argc, char** argv,
	string & outputFilepath_s, int & pkt_num, int & min_pkt_len, int & max_pkt_len, double & idle_ratio, int & data_width)
{
	outputFilepath_s = "input.csv";
	pkt_num = 10;
	min_pkt_len = 1;
	max_pkt_len = 128;
	idle_ratio = 0;
	data_width = 64;
	options_description desc("Available options for gen_traffic_file");
	desc.add_options()
		("help,h", "display help message")
		("o", value<string>(&outputFilepath_s)->required(), "(required) set output file path")
		("n", value<int>(&pkt_num), "set how many packets to send")
		("min", value<int>(&min_pkt_len), "set the minimal packet length in byte")
		("max", value<int>(&max_pkt_len), "set the maxmum packet length in byte")
		("ratio", value<double>(&idle_ratio), "set the idle ratio")
		("dwidth", value<int>(&data_width), "set the data width in byte");
		
	variables_map vm;

	try {
		store(parse_command_line(argc, argv, desc,(command_line_style::unix_style | command_line_style::allow_long_disguise)), vm);
		if (vm.count("help")) {
			cout << "gen_traffic_file : axi stream traffic table generator" << endl;
			cout << desc << endl;
			cout << "Example Usage:\n" << "\tgen_traffic_file -o test.csv -n 100 -min 1 -max 256 -ratio 0.10 -dwidth 64" << endl << endl;
			return 1;
		}
		notify(vm);
	}
	catch(required_option& e) {
		cerr << "ERROR: " << e.what() << endl;
		cout << desc << endl;
		return 1;
	}
	catch(error& e) {
		cerr << "Error: " << e.what() << endl;
		cout << desc << endl;
		return 1;
	}
	catch(...) {
		cerr << "Unknown error!" << endl;
		cout << desc << endl;
		return 1;
	}
	return 0;
}
