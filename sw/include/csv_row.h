#include <iterator>
#include <string>
#include <cstring>
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <iomanip>
using namespace std;
class csv_row
{
public:
	string const& operator[](size_t index) const { return m_data[index];}
	size_t size() const { return m_data.size(); }
	void readNextRow(istream& str);
	int write_meta(unsigned char & meta);
	void write_data(unsigned char data[64]);
private:
	vector<string>	m_data;
};

istream& operator>>(istream& str, csv_row& data)
{
	data.readNextRow(str);
	return str;
}
