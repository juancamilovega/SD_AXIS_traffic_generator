#include <iostream>
#include <iomanip>
#include <string>
#include <sstream>
#include "arg_parser.h"
using namespace std;

void ARG_PARSER::print_usage() {
	cout << "usage : traffic_gen [-n <iter_num>] [-o <offset>] <traffic.bin>" << endl << endl;
	cout << "available options are :" << endl << endl;
	cout << "positional arguments :" << endl;
	cout << "<traffic.bin>\ttraffic input in binary format" << endl << endl;
	cout << "optional arguments :" << endl;
	cout << "-h, --help\t\tshow this help message and exit" << endl;
	cout << "-n, --iter_num <int>\tset how many iterations the test should repeat" << endl;
	cout << "-o, --offset <int>\tthe traffic data would be put into FPGA memory, this set the offset address for FPGA memory." << endl;
}

int ARG_PARSER::parse(int argc, char** argv) {
	iter_num = 1;
	offset = 0;
	string suffix(".bin");
	string arg0;
	string arg1;
	string filePath;

	if (argc != 2 && argc != 4 && argc != 6) {
		cout << "ERROR USEAGE! The number of arguments is wrong!" << endl << endl;
		print_usage();
		return 1;
	}

	if (argc == 2) {
		filePath = string(argv[1]);
		if (filePath.compare(string("-h")) && filePath.compare(string("--help")) && (filePath.compare(filePath.size()-suffix.size(), suffix.size(), suffix))) {
			cout << "ERROR USEAGE!" << endl << endl;
			print_usage();
			return 1;
		} else if (filePath.compare(string("-h")) == 0 || filePath.compare(string("--help")) == 0) {
			print_usage();
			return 1;
		}
	} else if (argc == 4) {
		arg0 = string(argv[1]);
		filePath = string(argv[3]);
	} else if (argc == 6) {
		arg0 = string(argv[1]);
		arg1 = string(argv[3]);
		filePath = string(argv[5]);
	}

	if (filePath.size() <= suffix.size() || filePath.compare(filePath.size()-suffix.size(), suffix.size(), suffix) != 0) {
		cout << "ERROR input file suffix! should be a .bin file" << endl << endl;
		print_usage();
		return 1;
	} else {
		inFilePath = argv[argc-1];
	}

	if (argc >= 4) {
		if (arg0.compare(string("-n")) == 0 || arg0.compare(string("--iter_num")) == 0) {
			iter_num = stoi(argv[2]);
			if (iter_num < 0) {
				cout << "Error: iteration num should be greater than or equal to 0" << endl << endl;
				return 1;
			}
		} else if (arg0.compare(string("--offset")) == 0 || arg0.compare(string("-o")) == 0) { 
			offset = stoi(argv[2]);
			if (offset < 0) {
				cout << "Error: offset should be greater than or equal to 0" << endl << endl;
				return 1;
			}
		} else {
			cout << "ERROR USEAGE!" << endl << endl;
			print_usage();
			return 1;
		}
	}
	if (argc == 6) {
		if (arg1.compare(string("-n")) == 0 || arg1.compare(string("--iter_num")) == 0) {
			iter_num = stoi(argv[4]);
			if (iter_num <= 0) {
				cout << "Error: iteration num should be greater than 0" << endl << endl;
				return 1;
			}
		} else if (arg1.compare(string("--offset")) == 0 || arg1.compare(string("-o")) == 0) {
			offset = stoi(argv[4]);
			if (offset < 0) {
				cout << "Error: offset should be greater than or equal to 0" << endl;
				return 1;
			}
		} else {
			cout << "ERROR USEAGE!" << endl << endl;
			print_usage();
			return 1;
		}
	}
	return 0;
}
