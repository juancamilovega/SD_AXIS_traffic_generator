set moduleName datamover_controller
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
set C_modelName {datamover_controller}
set C_modelType { void 0 }
set C_modelArgList {
	{ start_V int 1 regular  }
	{ length_V int 64 regular  }
	{ m_axis_tdata_V int 104 regular {pointer 1}  }
	{ m_axis_tvalid_V int 1 regular {pointer 1}  }
	{ m_axis_tready_V int 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "start_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "start.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "length_V", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "length.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "m_axis_tdata_V", "interface" : "wire", "bitwidth" : 104, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":103,"cElement": [{"cName": "m_axis.tdata.V","cData": "uint104","bit_use": { "low": 0,"up": 103},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "m_axis_tvalid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "m_axis.tvalid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "m_axis_tready_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "m_axis_tready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 7
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ start_V sc_in sc_lv 1 signal 0 } 
	{ length_V sc_in sc_lv 64 signal 1 } 
	{ m_axis_tdata_V sc_out sc_lv 104 signal 2 } 
	{ m_axis_tvalid_V sc_out sc_lv 1 signal 3 } 
	{ m_axis_tready_V sc_in sc_lv 1 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "start_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "start_V", "role": "default" }} , 
 	{ "name": "length_V", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "length_V", "role": "default" }} , 
 	{ "name": "m_axis_tdata_V", "direction": "out", "datatype": "sc_lv", "bitwidth":104, "type": "signal", "bundle":{"name": "m_axis_tdata_V", "role": "default" }} , 
 	{ "name": "m_axis_tvalid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_tvalid_V", "role": "default" }} , 
 	{ "name": "m_axis_tready_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_tready_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "datamover_controller",
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
			{"Name" : "start_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "length_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "m_axis_tdata_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "m_axis_tvalid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "m_axis_tready_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "m_axis_reg_tdata_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "m_axis_reg_tvalid_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "start_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "core_on_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "curr_addr_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_reg_V", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	datamover_controller {
		start_V {Type I LastRead 0 FirstWrite -1}
		length_V {Type I LastRead 0 FirstWrite -1}
		m_axis_tdata_V {Type O LastRead -1 FirstWrite 0}
		m_axis_tvalid_V {Type O LastRead -1 FirstWrite 0}
		m_axis_tready_V {Type I LastRead 0 FirstWrite -1}
		m_axis_reg_tdata_V {Type IO LastRead -1 FirstWrite -1}
		m_axis_reg_tvalid_V {Type IO LastRead -1 FirstWrite -1}
		start_reg_V {Type IO LastRead -1 FirstWrite -1}
		core_on_V {Type IO LastRead -1 FirstWrite -1}
		curr_addr_V {Type IO LastRead -1 FirstWrite -1}
		length_reg_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	start_V { ap_none {  { start_V in_data 0 1 } } }
	length_V { ap_none {  { length_V in_data 0 64 } } }
	m_axis_tdata_V { ap_none {  { m_axis_tdata_V out_data 1 104 } } }
	m_axis_tvalid_V { ap_none {  { m_axis_tvalid_V out_data 1 1 } } }
	m_axis_tready_V { ap_none {  { m_axis_tready_V in_data 0 1 } } }
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
