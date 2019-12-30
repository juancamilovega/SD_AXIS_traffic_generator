class ARG_PARSER {
public:
	const char* inFilePath;
	int iter_num;
	int offset;
	int parse(int argc, char** argv);
	void print_usage();
};
