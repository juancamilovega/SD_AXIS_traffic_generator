#include <cstdlib>
#include "packet.h"
using namespace std;

int gen_traffic_file(ofstream & outFile, int pkt_num, int pkt_len_min, int pkt_len_max, double idle_rate, int data_width) {
	PACKET packet;
	int pkt_len_diff = pkt_len_max - pkt_len_min;
	int data_cycles = pkt_num*(((pkt_len_min+pkt_len_max)/2-1)/data_width+1);
	int idle_cycles = (int)((double)data_cycles/(1-idle_rate)*idle_rate);
	srand(time(NULL));
	int cycle_id = 0;
	int packet_id = 0;
	packet.rand_init();
	packet.data_width = data_width;

	outFile << "cycle_id,packet_id,axis_data,axis_keep,axis_last,axis_valid" << endl;
	int pkt_len;
	for (int i = 0; i < pkt_num; i++) {
		if (pkt_len_diff !=0) {
			pkt_len = (rand()%pkt_len_diff) + pkt_len_min;
		} else {
			pkt_len = pkt_len_min;
		}
		while (pkt_len > 0) {
			if (idle_cycles > 0 && (rand()%100 < idle_rate*100)) {
				packet.set_idle();
				idle_cycles--;
			} else {
				packet.random_gen(pkt_len);
				pkt_len -= data_width;
			}
			packet.append_to_file(outFile, cycle_id, packet_id);
			cycle_id++;
		}
		packet_id++;
	}
}
