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

void csv_row::readNextRow(istream& str) {
	string line; 
	getline(str, line);
	stringstream lineStream(line);
	string cell;
	m_data.clear();
	while(getline(lineStream, cell, ',')) {
		m_data.push_back(cell);
	}
}

int csv_row::write_meta(unsigned char & meta) {
	unsigned char mty = 0;
	unsigned char last = stoi(m_data[4],0,16);
	for (int i = 2; i < int(m_data[3].length()); i++) {
		switch(stoi(m_data[3].substr(i,1),0,16)) {
			case 0b1111:
				mty += 4;
				break;
			case 0b1110:
				mty += 3;
				break;
			case 0b1100:
				mty += 2;
				break;
			case 0b1000:
				mty += 1;
				break;
		}
	}
	meta = mty << 1 | (last & 0b00000001);
	return mty;
}

void csv_row::write_data(unsigned char data[64]) {
	int index = 63;
	for (int i = 2; i < int(m_data[2].length()); i+=2) {
		data[index] = stoi(m_data[2].substr(i,2),0,16);
		index--;
	}
}
