HLS_DIR = hls_ips
HLS_IP_NAMES = datamover_controller sw_interface traffic_decoder traffic_gen_rx traffic_gen_tx
HLS_IPS = $(addsuffix /.timestamp,$(addprefix $(HLS_DIR)/,$(HLS_IP_NAMES)))
HLS_IPS_CLEAN = $(addsuffix /.clean,$(addprefix $(HLS_DIR)/,$(HLS_IP_NAMES)))

all: $(HLS_IPS) full_core/SD_AXIS_traffic_gen
full_core/SD_AXIS_traffic_gen: $(HLS_IPS) verilogs/*.v full_core/scripts/*.tcl
	rm -rf full_core/SD_AXIS_traffic_gen
	vivado -nolog -nojournal -mode tcl -source full_core/scripts/assemble.tcl

hls_ips/%/.timestamp: hls_ips/%/src/*.cpp
	make -C $(dir $@)

clean: $(HLS_IPS_CLEAN)
	rm -rf full_core/SD_AXIS_traffic_gen
hls_ips/%/.clean: .FORCE
	make -C $(dir $@) clean
	rm -f $(dir $@).timestamp
.FORCE:
