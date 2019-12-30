#!/usr/bin/python3
import argparse
import random
import sys

#Utility functions##########################
def msg(name=None):							    
	return '''gen_traffic_csv.py [-option1 <value1>] ... [-optionN <valueN>] <output_path>'''
def str2bool(v):
	if isinstance(v, bool):
		return v
	if v.lower() in ('yes', 'true', 't', 'y', '1'):
		return True
	elif v.lower() in ('no', 'false', 'f', 'n', '0'):
		return False
	else:
		raise argparse.ArgumentTypeError('Boolean value expected.')
def isPowerOfTwo(num):
	return ((num & (num - 1)) == 0) and num != 0

class progress_printer:
	def __init__(self):
		self.percentage = -1
	def print(self, curr, total):
		if self.percentage < int(100*float(curr)/float(total)):
			self.percentage = int(100*float(curr)/float(total))
			progress_str='progress : ['+'>'*self.percentage+' '*(100-self.percentage)+'] '+str(self.percentage)+'%\r'
			if self.percentage == 100:
				print(progress_str)
			else:
				print(progress_str, end='', flush=True)
###########################################

#arg parser object#########################
class arg_parser:
	def __init__(self):
		self.parser = argparse.ArgumentParser(
			prog='gen_traffic_csv.py',
			formatter_class=argparse.MetavarTypeHelpFormatter,
			description='Available options:', usage=msg())
		self.parser.add_argument('output_path', metavar='<output file>', type=str, help='set output file path')
		self.parser.add_argument('-n', default=10, type=int, help='set how many packets to send')
		self.parser.add_argument('-min', default=1, type=int, help='set the minimal packet size in byte')
		self.parser.add_argument('-max', default=128, type=int, help='set the maxmum packet size in byte')
		self.parser.add_argument('-ratio', default=0, type=float, help='set the idle ratio')
		self.parser.add_argument('-dwidth', default=64, type=int, help='set the bus TDATA width in byte')
		self.parser.add_argument('-no_data', action="store_true", help='the packets won\'t contain TDATA filed if set')
		self.parser.add_argument('-no_keep', action="store_true", help='the packets won\'t contain TKEEP filed if set')
		self.parser.add_argument('-no_last', action="store_true", help='the packets won\'t contain TLAST filed if set')
		self.parser.add_argument('-ignore_cycle_id', action="store_true", help='cycle id won\'t be denoted in the csv if set')
		self.parser.add_argument('-ignore_packet_id', action="store_true", help='packet id won\'t be denoted in the csv if set')

	def parse(self):
		self.args = self.parser.parse_args()
		self.N_packets = self.args.n
		print("Start assigning packet size for each packet")
		pp = progress_printer()
		self.packets_size = [None] * self.N_packets
		for i in range(self.N_packets):
			self.packets_size[i] = random.randint(self.args.min,self.args.max)
			pp.print(i, self.N_packets-1)
		print("Finish assigning packet size")
		self.datawidth = self.args.dwidth
		if not isPowerOfTwo(self.datawidth):
			print("Error from Arg Parser: data width has to be power of 2")
			return True
		if self.args.no_data:
			self.has_data = False
		else:
			self.has_data = True
		if self.args.no_keep:
			self.has_keep = False
		else:
			self.has_keep = True
		if self.args.no_last:
			self.has_last = False
		else:
			self.has_last = True
		if not self.has_data and self.has_keep:
			self.has_keep = False
			print("Warning from Arg Parser: TKEEP field is supressed because TDATA field is opt-out")
		if self.args.ignore_cycle_id:
			self.denote_cycle_id = False
		else:
			self.denote_cycle_id = True
		if self.args.ignore_packet_id:
			self.denote_packet_id = False
		else:
			self.denote_packet_id = True
		self.output_file = self.args.output_path
		#cycle number for each packet
		packets_cycles = [int((size-1)/self.datawidth)+1 for size in self.packets_size] 
		#number of data cycles
		N_data_cycles = sum(packets_cycles)
		#number of total cycles
		self.N_total_cycles = int(float(N_data_cycles)/(1-self.args.ratio))
		#number of idle cycles
		N_idle_cycles = int(self.N_total_cycles*self.args.ratio)
		#list of idle cycles
		if N_idle_cycles > 0:
			if self.N_total_cycles-2 < N_idle_cycles:
				print("Error: idle ratio too large, do you really want to send any data???")
				return True
			print("Start choosing idle cycles")
			all_possible_cycles = list(range(1,self.N_total_cycles-1))
			random.shuffle(all_possible_cycles)
			self.idle_cycles = all_possible_cycles[0:N_idle_cycles]
			self.idle_cycles.sort()
			print("Done choosing idle cycles")
		else:
			self.idle_cycles = [-1]
		return False
###########################################

#CSV writer object#########################
class csv_writer:
	def __init__(self, args):
		self.f = open(args.output_file,'w')
		self.args = args
		self.cycle_id = 0
		self.packet_id = 0
		self.idle_idx = 0
		self.packet_remain_bytes = args.packets_size[0]
		self.str_to_file = ''
	def write_header(self):
		if self.args.denote_cycle_id:
			self.f.write('cycle_id,')
		if self.args.denote_packet_id:
		       	self.f.write('packet_id,')
		if self.args.has_data:
			self.f.write('tdata,')
		if self.args.has_keep:
			self.f.write('tkeep,')
		if self.args.has_last:
			self.f.write('tlast,')
		self.f.write('tvalid\n')
	def write_line(self):
		if self.cycle_id == self.args.idle_cycles[self.idle_idx]:
			if self.idle_idx != len(self.args.idle_cycles)-1:
				self.idle_idx = self.idle_idx+1
			is_idle = True
		else:
			is_idle = False
		if self.args.denote_cycle_id:
			self.str_to_file = self.str_to_file + str(self.cycle_id)+','
		if self.args.denote_packet_id:
			self.str_to_file = self.str_to_file + str(self.packet_id)+','
		if self.args.has_data:
			if is_idle:
				data_list = [0 for _ in range(self.args.datawidth)]
			else:
				data_list = [random.randint(0,255) for _ in range(self.args.datawidth)]
			data_string = '0x'
			for octet in data_list:
				data_string = data_string + str('%02x' % octet)
			self.str_to_file = self.str_to_file + data_string+','
		if self.args.has_keep:
			keep_list = [0 for _ in range(int(self.args.datawidth/4))]
			if not is_idle:
				for i in range(self.args.datawidth):
					if self.packet_remain_bytes - i > 0:
						keep_list[int(i/4)] = keep_list[int(i/4)] + (1<<(3-i%4))
			keep_string = '0x'
			for octet in keep_list:
				keep_string = keep_string + str('%x' % octet)
			self.str_to_file = self.str_to_file + keep_string+','
		if self.args.has_last:
			if is_idle or self.packet_remain_bytes > self.args.datawidth:
				last_value = 0
			else:
				last_value = 1
			self.str_to_file = self.str_to_file + str(last_value)+','
		if is_idle:
			valid_value = 0
		else:
			valid_value = 1
			self.packet_remain_bytes = self.packet_remain_bytes - self.args.datawidth
			if self.packet_remain_bytes <= 0:
				self.packet_id = self.packet_id+1
				if self.packet_id < self.args.N_packets:
					self.packet_remain_bytes = self.args.packets_size[self.packet_id]
		self.str_to_file = self.str_to_file + str(valid_value)+'\n'
		if self.cycle_id % 1000 == 0 or self.cycle_id == self.args.N_total_cycles-1:
			self.f.write(self.str_to_file)
			self.str_to_file = ''
		self.cycle_id = self.cycle_id + 1
	def close(self):
		self.f.close()
###########################################

if __name__ == '__main__':
	args = arg_parser()
	if args.parse():
		sys.exit()
	writer = csv_writer(args)
	writer.write_header()
	print("Start generating traffic csv file")
	pp = progress_printer()
	for i in range(args.N_total_cycles):
		writer.write_line()
		pp.print(i, args.N_total_cycles-1)
	writer.close()
	print("Finished generating traffic csv file")
