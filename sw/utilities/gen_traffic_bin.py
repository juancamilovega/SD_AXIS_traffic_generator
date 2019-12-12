#!/usr/bin/python3
import argparse
import sys
import re
import os

#Utility functions##########################
def msg(name=None):
	return '''gen_traffic_bin.py -i <input csv file path> [-o <output binary file path>]'''

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
############################################

class arg_parser:
	def __init__(self):
		self.parser = argparse.ArgumentParser(
			prog='gen_traffic_bin.py',
			formatter_class=argparse.MetavarTypeHelpFormatter,
			description='Available options:', usage=msg())
		self.parser.add_argument('-i', required=True, type=str, help='specify the path of input csv file')
		self.parser.add_argument('-o', default='/dev/null', type=str, help='specify the path of output binary file')
	def parse(self):
		self.args = self.parser.parse_args()
		self.in_file = self.args.i
		f = open(self.in_file)
		self.num_lines = sum(1 for line in f)
		f.close()
		in_file_base = os.path.basename(self.in_file)
		if self.args.o == '/dev/null':
			out_file = re.sub('.csv$','.bin', in_file_base)
			if out_file == in_file_base:
				print("Error from Arg Parser: input file has to be a .csv file")
				return True
			self.out_file = out_file
		else:
			self.out_file = self.args.o
		return False

class binary_writer:
	def __init__(self, args):
		self.in_f = open(args.in_file,'r')
		self.out_f = open(args.out_file,'wb')
		self.legit_fields = ['cycle_id', 'packet_id', 'tdata', 'tkeep', 'tlast', 'tvalid']
		self.field_idx_dict = {field_name : -1 for field_name in self.legit_fields}
		self.total_data_size = 0
		self.actual_data_size = 0
		self.packet_num = 0
		self.lineNum = 0

	def read_header(self):
		header_line = self.in_f.readline().rstrip().split(',')
		idx = 0
		for field_name in header_line:
			if field_name in self.legit_fields:
				self.field_idx_dict[field_name] = idx
			else:
				print("Error from Arg Parser: unknown field name : "+field_name)
				self.close()
				return True
			idx = idx+1
		if self.field_idx_dict['tvalid'] == -1:
			print("Error from Arg Parser: missing required field TVALID")
			self.close()
			return True
		self.out_f.write(bytearray(24))
		return False
	def write_page(self):
		ret = self.lineNum + 64
		mem_page = bytearray(4096)
		for i in range(63):
			self.lineNum = self.lineNum + 1
			lineNum_str = str(self.lineNum)
			line = self.in_f.readline().rstrip()
			if line:
				values = line.split(',')
				tvalid = 0
				mty = 0
				tlast = 0
				#assign meta value
				#tvalid
				tvalid_str = values[self.field_idx_dict['tvalid']]
				if tvalid_str == '1':
					tvalid = 1
				elif tvalid_str != '0':
					print("Error at line #"+lineNum_str+" : invalid TVALID value :" + tvalid_str)
					self.close()
					return 0
				if tvalid == 1:
					#tkeep
					if self.field_idx_dict['tkeep'] != -1:
						tkeep_str = values[self.field_idx_dict['tkeep']]
						tkeep_str = re.sub('^0x','',tkeep_str)
						if len(tkeep_str) > 16:
							print("Error at line #"+lineNum_str+" : TKEEP shouln't be more than 64 bits")
							self.close()
							return 0
						for letter in tkeep_str:
							if letter.lower() == 'f':
								mty = mty+4
							elif letter.lower() == 'e':
								mty = mty+3
							elif letter.lower() == 'c':
								mty = mty+2
							elif letter.lower() == '8':
								mty = mty+1
							elif letter.lower() != '0':
								print("Error at line #"+lineNum_str+" : invalid TKEEP value " + tkeep_str)
								self.close()
								return 0
						self.actual_data_size = self.actual_data_size + mty
					#tlast
					if self.field_idx_dict['tlast'] != -1:
						tlast_str = values[self.field_idx_dict['tlast']]
						if tlast_str == '1':
							tlast = 1
							self.packet_num = self.packet_num + 1
						elif tlast_str != '0':
							print("Error at line #"+lineNum_str+" : invalid TLAST value : " + tlast_str)
							self.close()
							return 0
				#write meta
				mem_page[63-i] = (mty << 1) | tlast
				#write tdata
				if self.field_idx_dict['tdata'] != -1:
					tdata_str = values[self.field_idx_dict['tdata']]
					tdata_str = re.sub('0x','',tdata_str)
					tdata = bytearray.fromhex(tdata_str)
					tdata.reverse() #convert to little endianness
					tdata_idx = 64*(i+1)
					for octet in tdata:
						mem_page[tdata_idx] = octet
						tdata_idx = tdata_idx+1
			else:
				ret = 0
				break
		self.total_data_size = self.total_data_size + 1
		self.out_f.write(mem_page)
		return ret
	def write_parameter(self):
		self.out_f.seek(0)
		total_data_size_bin = bytearray.fromhex(format(self.total_data_size,'016x'))
		actual_data_size_bin = bytearray.fromhex(format(self.actual_data_size,'016x'))
		packet_num_bin = bytearray.fromhex(format(self.packet_num,'016x'))
		total_data_size_bin.reverse()
		actual_data_size_bin.reverse()
		packet_num_bin.reverse()
		self.out_f.write(total_data_size_bin)
		self.out_f.write(actual_data_size_bin)
		self.out_f.write(packet_num_bin)
		self.close()
	def close(self):
		self.in_f.close()
		self.out_f.close()

if __name__ == '__main__':
	args = arg_parser()
	if args.parse():
		sys.exit()
	writer = binary_writer(args)
	if writer.read_header():
		sys.exit()
	print("Start generating traffic bin file")
	pp = progress_printer()
	while True:
		curr_linenum = writer.write_page()
		if curr_linenum == 0:
			break
		else:
			pp.print(curr_linenum+1, args.num_lines-1)
	writer.write_parameter()
	print("Finished generating traffic bin file")
	print("totoal file size in page = "+str(writer.total_data_size))
	print("acutal data size in byte = "+str(writer.actual_data_size))
	print("number of packet = "+str(writer.packet_num))

