#!/bin/bash
source config.mk
vivado_hls scripts/hls.tcl $ip_name $part_name $period
for i in "$ip_name/solution1/syn/verilog/*.v"; do
	sed -i 's/_V//g' $i
done
vivado -mode tcl -nolog -nojournal -source scripts/ip_package.tcl -tclargs $ip_name $part_name
rm -f *log
