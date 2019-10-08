set moduleName traffic_gen_rx
set isTopModule 1
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {traffic_gen_rx}
set C_modelType { void 0 }
set C_modelArgList {
	{ from_app_tdata_V int 512 regular {pointer 0}  }
	{ from_app_tkeep_V int 64 regular {pointer 0}  }
	{ from_app_tlast_V int 1 regular {pointer 0}  }
	{ from_app_tvalid_V int 1 regular {pointer 0}  }
	{ from_app_tready_V int 1 regular {pointer 1}  }
	{ from_cmp_fifo_tdata_V int 512 regular {pointer 0}  }
	{ from_cmp_fifo_tkeep_V int 64 regular {pointer 0}  }
	{ from_cmp_fifo_tlast_V int 1 regular {pointer 0}  }
	{ from_cmp_fifo_tvalid_V int 1 regular {pointer 0}  }
	{ from_cmp_fifo_tready_V int 1 regular {pointer 1}  }
	{ time_cnt_V int 32 regular  }
	{ mismatch_V int 1 regular {pointer 1}  }
	{ rx_timeElapse_V int 32 regular {pointer 1}  }
	{ rx_timestamp_sum_V int 64 regular {pointer 1}  }
	{ pkt_cnt_rx_V int 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "from_app_tdata_V", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "from_app.tdata.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "from_app_tkeep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "from_app.tkeep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "from_app_tlast_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "from_app.tlast.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "from_app_tvalid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "from_app.tvalid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "from_app_tready_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "from_app.tready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "from_cmp_fifo_tdata_V", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "from_cmp_fifo.tdata.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "from_cmp_fifo_tkeep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "from_cmp_fifo.tkeep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "from_cmp_fifo_tlast_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "from_cmp_fifo.tlast.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "from_cmp_fifo_tvalid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "from_cmp_fifo.tvalid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "from_cmp_fifo_tready_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "from_cmp_fifo.tready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "time_cnt_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "time_cnt.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "mismatch_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mismatch.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "rx_timeElapse_V", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "rx_timeElapse.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "rx_timestamp_sum_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "rx_timestamp_sum.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "pkt_cnt_rx_V", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "pkt_cnt_rx.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ from_app_tdata_V sc_in sc_lv 512 signal 0 } 
	{ from_app_tkeep_V sc_in sc_lv 64 signal 1 } 
	{ from_app_tlast_V sc_in sc_lv 1 signal 2 } 
	{ from_app_tvalid_V sc_in sc_lv 1 signal 3 } 
	{ from_app_tready_V sc_out sc_lv 1 signal 4 } 
	{ from_cmp_fifo_tdata_V sc_in sc_lv 512 signal 5 } 
	{ from_cmp_fifo_tkeep_V sc_in sc_lv 64 signal 6 } 
	{ from_cmp_fifo_tlast_V sc_in sc_lv 1 signal 7 } 
	{ from_cmp_fifo_tvalid_V sc_in sc_lv 1 signal 8 } 
	{ from_cmp_fifo_tready_V sc_out sc_lv 1 signal 9 } 
	{ time_cnt_V sc_in sc_lv 32 signal 10 } 
	{ mismatch_V sc_out sc_lv 1 signal 11 } 
	{ rx_timeElapse_V sc_out sc_lv 32 signal 12 } 
	{ rx_timestamp_sum_V sc_out sc_lv 64 signal 13 } 
	{ pkt_cnt_rx_V sc_out sc_lv 32 signal 14 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "from_app_tdata_V", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "from_app_tdata_V", "role": "default" }} , 
 	{ "name": "from_app_tkeep_V", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "from_app_tkeep_V", "role": "default" }} , 
 	{ "name": "from_app_tlast_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "from_app_tlast_V", "role": "default" }} , 
 	{ "name": "from_app_tvalid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "from_app_tvalid_V", "role": "default" }} , 
 	{ "name": "from_app_tready_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "from_app_tready_V", "role": "default" }} , 
 	{ "name": "from_cmp_fifo_tdata_V", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "from_cmp_fifo_tdata_V", "role": "default" }} , 
 	{ "name": "from_cmp_fifo_tkeep_V", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "from_cmp_fifo_tkeep_V", "role": "default" }} , 
 	{ "name": "from_cmp_fifo_tlast_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "from_cmp_fifo_tlast_V", "role": "default" }} , 
 	{ "name": "from_cmp_fifo_tvalid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "from_cmp_fifo_tvalid_V", "role": "default" }} , 
 	{ "name": "from_cmp_fifo_tready_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "from_cmp_fifo_tready_V", "role": "default" }} , 
 	{ "name": "time_cnt_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "time_cnt_V", "role": "default" }} , 
 	{ "name": "mismatch_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mismatch_V", "role": "default" }} , 
 	{ "name": "rx_timeElapse_V", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rx_timeElapse_V", "role": "default" }} , 
 	{ "name": "rx_timestamp_sum_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_timestamp_sum_V", "role": "default" }} , 
 	{ "name": "pkt_cnt_rx_V", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pkt_cnt_rx_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "traffic_gen_rx",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "from_app_tdata_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "from_app_tkeep_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "from_app_tlast_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "from_app_tvalid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "from_app_tready_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "from_cmp_fifo_tdata_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "from_cmp_fifo_tkeep_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "from_cmp_fifo_tlast_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "from_cmp_fifo_tvalid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "from_cmp_fifo_tready_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "time_cnt_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "mismatch_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "rx_timeElapse_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "rx_timestamp_sum_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "pkt_cnt_rx_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "rx_timeElapse_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_timestamp_sum_reg", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "pkt_cnt_rx_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_start_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "start_initialized_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mismatch_reg_V", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	traffic_gen_rx {
		from_app_tdata_V {Type I LastRead 0 FirstWrite -1}
		from_app_tkeep_V {Type I LastRead 0 FirstWrite -1}
		from_app_tlast_V {Type I LastRead 0 FirstWrite -1}
		from_app_tvalid_V {Type I LastRead 0 FirstWrite -1}
		from_app_tready_V {Type O LastRead -1 FirstWrite 0}
		from_cmp_fifo_tdata_V {Type I LastRead 0 FirstWrite -1}
		from_cmp_fifo_tkeep_V {Type I LastRead 0 FirstWrite -1}
		from_cmp_fifo_tlast_V {Type I LastRead 0 FirstWrite -1}
		from_cmp_fifo_tvalid_V {Type I LastRead 0 FirstWrite -1}
		from_cmp_fifo_tready_V {Type O LastRead -1 FirstWrite 0}
		time_cnt_V {Type I LastRead 0 FirstWrite -1}
		mismatch_V {Type O LastRead -1 FirstWrite 0}
		rx_timeElapse_V {Type O LastRead -1 FirstWrite 0}
		rx_timestamp_sum_V {Type O LastRead -1 FirstWrite 0}
		pkt_cnt_rx_V {Type O LastRead -1 FirstWrite 0}
		rx_timeElapse_reg_V {Type IO LastRead -1 FirstWrite -1}
		rx_timestamp_sum_reg {Type IO LastRead -1 FirstWrite -1}
		pkt_cnt_rx_reg_V {Type IO LastRead -1 FirstWrite -1}
		rx_start_V {Type IO LastRead -1 FirstWrite -1}
		start_initialized_V {Type IO LastRead -1 FirstWrite -1}
		mismatch_reg_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	from_app_tdata_V { ap_none {  { from_app_tdata_V in_data 0 512 } } }
	from_app_tkeep_V { ap_none {  { from_app_tkeep_V in_data 0 64 } } }
	from_app_tlast_V { ap_none {  { from_app_tlast_V in_data 0 1 } } }
	from_app_tvalid_V { ap_none {  { from_app_tvalid_V in_data 0 1 } } }
	from_app_tready_V { ap_none {  { from_app_tready_V out_data 1 1 } } }
	from_cmp_fifo_tdata_V { ap_none {  { from_cmp_fifo_tdata_V in_data 0 512 } } }
	from_cmp_fifo_tkeep_V { ap_none {  { from_cmp_fifo_tkeep_V in_data 0 64 } } }
	from_cmp_fifo_tlast_V { ap_none {  { from_cmp_fifo_tlast_V in_data 0 1 } } }
	from_cmp_fifo_tvalid_V { ap_none {  { from_cmp_fifo_tvalid_V in_data 0 1 } } }
	from_cmp_fifo_tready_V { ap_none {  { from_cmp_fifo_tready_V out_data 1 1 } } }
	time_cnt_V { ap_none {  { time_cnt_V in_data 0 32 } } }
	mismatch_V { ap_none {  { mismatch_V out_data 1 1 } } }
	rx_timeElapse_V { ap_none {  { rx_timeElapse_V out_data 1 32 } } }
	rx_timestamp_sum_V { ap_none {  { rx_timestamp_sum_V out_data 1 64 } } }
	pkt_cnt_rx_V { ap_none {  { pkt_cnt_rx_V out_data 1 32 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
