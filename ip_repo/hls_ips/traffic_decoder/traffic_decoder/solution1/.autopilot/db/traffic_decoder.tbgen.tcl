set moduleName traffic_decoder
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
set C_modelName {traffic_decoder}
set C_modelType { void 0 }
set C_modelArgList {
	{ raw_packet_tdata_V int 512 regular {pointer 0}  }
	{ raw_packet_tvalid_V int 1 regular {pointer 0}  }
	{ raw_packet_tready_V int 1 regular {pointer 1}  }
	{ decoded_packet_tdata_V int 512 regular {pointer 1}  }
	{ decoded_packet_tkeep_V int 64 regular {pointer 1}  }
	{ decoded_packet_tlast_V int 1 regular {pointer 1}  }
	{ decoded_packet_tvalid_V int 1 regular {pointer 1}  }
	{ decoded_packet_tready_V int 1 regular {pointer 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "raw_packet_tdata_V", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "raw_packet.tdata.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "raw_packet_tvalid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "raw_packet.tvalid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "raw_packet_tready_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "raw_packet.tready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "decoded_packet_tdata_V", "interface" : "wire", "bitwidth" : 512, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "decoded_packet.tdata.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "decoded_packet_tkeep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]},{"low":1,"up":1,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]},{"low":2,"up":2,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]},{"low":3,"up":3,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]},{"low":4,"up":4,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 4,"up" : 4,"step" : 2}]}]},{"low":5,"up":5,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 5,"up" : 5,"step" : 2}]}]},{"low":6,"up":6,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 6,"up" : 6,"step" : 2}]}]},{"low":7,"up":7,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 7,"up" : 7,"step" : 2}]}]},{"low":8,"up":8,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 8,"up" : 8,"step" : 2}]}]},{"low":9,"up":9,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 9,"up" : 9,"step" : 2}]}]},{"low":10,"up":10,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 10,"up" : 10,"step" : 2}]}]},{"low":11,"up":11,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 11,"up" : 11,"step" : 2}]}]},{"low":12,"up":12,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 12,"up" : 12,"step" : 2}]}]},{"low":13,"up":13,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 13,"up" : 13,"step" : 2}]}]},{"low":14,"up":14,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 14,"up" : 14,"step" : 2}]}]},{"low":15,"up":15,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 15,"up" : 15,"step" : 2}]}]},{"low":16,"up":16,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 16,"up" : 16,"step" : 2}]}]},{"low":17,"up":17,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 17,"up" : 17,"step" : 2}]}]},{"low":18,"up":18,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 18,"up" : 18,"step" : 2}]}]},{"low":19,"up":19,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 19,"up" : 19,"step" : 2}]}]},{"low":20,"up":20,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 20,"up" : 20,"step" : 2}]}]},{"low":21,"up":21,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 21,"up" : 21,"step" : 2}]}]},{"low":22,"up":22,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 22,"up" : 22,"step" : 2}]}]},{"low":23,"up":23,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 23,"up" : 23,"step" : 2}]}]},{"low":24,"up":24,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 24,"up" : 24,"step" : 2}]}]},{"low":25,"up":25,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 25,"up" : 25,"step" : 2}]}]},{"low":26,"up":26,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 26,"up" : 26,"step" : 2}]}]},{"low":27,"up":27,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 27,"up" : 27,"step" : 2}]}]},{"low":28,"up":28,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 28,"up" : 28,"step" : 2}]}]},{"low":29,"up":29,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 29,"up" : 29,"step" : 2}]}]},{"low":30,"up":30,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 30,"up" : 30,"step" : 2}]}]},{"low":31,"up":31,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 31,"up" : 31,"step" : 2}]}]},{"low":32,"up":32,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 32,"up" : 32,"step" : 2}]}]},{"low":33,"up":33,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 33,"up" : 33,"step" : 2}]}]},{"low":34,"up":34,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 34,"up" : 34,"step" : 2}]}]},{"low":35,"up":35,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 35,"up" : 35,"step" : 2}]}]},{"low":36,"up":36,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 36,"up" : 36,"step" : 2}]}]},{"low":37,"up":37,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 37,"up" : 37,"step" : 2}]}]},{"low":38,"up":38,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 38,"up" : 38,"step" : 2}]}]},{"low":39,"up":39,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 39,"up" : 39,"step" : 2}]}]},{"low":40,"up":40,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 40,"up" : 40,"step" : 2}]}]},{"low":41,"up":41,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 41,"up" : 41,"step" : 2}]}]},{"low":42,"up":42,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 42,"up" : 42,"step" : 2}]}]},{"low":43,"up":43,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 43,"up" : 43,"step" : 2}]}]},{"low":44,"up":44,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 44,"up" : 44,"step" : 2}]}]},{"low":45,"up":45,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 45,"up" : 45,"step" : 2}]}]},{"low":46,"up":46,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 46,"up" : 46,"step" : 2}]}]},{"low":47,"up":47,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 47,"up" : 47,"step" : 2}]}]},{"low":48,"up":48,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 48,"up" : 48,"step" : 2}]}]},{"low":49,"up":49,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 49,"up" : 49,"step" : 2}]}]},{"low":50,"up":50,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 50,"up" : 50,"step" : 2}]}]},{"low":51,"up":51,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 51,"up" : 51,"step" : 2}]}]},{"low":52,"up":52,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 52,"up" : 52,"step" : 2}]}]},{"low":53,"up":53,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 53,"up" : 53,"step" : 2}]}]},{"low":54,"up":54,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 54,"up" : 54,"step" : 2}]}]},{"low":55,"up":55,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 55,"up" : 55,"step" : 2}]}]},{"low":56,"up":56,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 56,"up" : 56,"step" : 2}]}]},{"low":57,"up":57,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 57,"up" : 57,"step" : 2}]}]},{"low":58,"up":58,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 58,"up" : 58,"step" : 2}]}]},{"low":59,"up":59,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 59,"up" : 59,"step" : 2}]}]},{"low":60,"up":60,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 60,"up" : 60,"step" : 2}]}]},{"low":61,"up":61,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 61,"up" : 61,"step" : 2}]}]},{"low":62,"up":62,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 62,"up" : 62,"step" : 2}]}]},{"low":63,"up":63,"cElement": [{"cName": "decoded_packet.tkeep.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 63,"up" : 63,"step" : 2}]}]}]} , 
 	{ "Name" : "decoded_packet_tlast_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "decoded_packet.tlast.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "decoded_packet_tvalid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "decoded_packet.tvalid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "decoded_packet_tready_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "decoded_packet.tready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 10
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ raw_packet_tdata_V sc_in sc_lv 512 signal 0 } 
	{ raw_packet_tvalid_V sc_in sc_lv 1 signal 1 } 
	{ raw_packet_tready_V sc_out sc_lv 1 signal 2 } 
	{ decoded_packet_tdata_V sc_out sc_lv 512 signal 3 } 
	{ decoded_packet_tkeep_V sc_out sc_lv 64 signal 4 } 
	{ decoded_packet_tlast_V sc_out sc_lv 1 signal 5 } 
	{ decoded_packet_tvalid_V sc_out sc_lv 1 signal 6 } 
	{ decoded_packet_tready_V sc_in sc_lv 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "raw_packet_tdata_V", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "raw_packet_tdata_V", "role": "default" }} , 
 	{ "name": "raw_packet_tvalid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_packet_tvalid_V", "role": "default" }} , 
 	{ "name": "raw_packet_tready_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_packet_tready_V", "role": "default" }} , 
 	{ "name": "decoded_packet_tdata_V", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "decoded_packet_tdata_V", "role": "default" }} , 
 	{ "name": "decoded_packet_tkeep_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "decoded_packet_tkeep_V", "role": "default" }} , 
 	{ "name": "decoded_packet_tlast_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "decoded_packet_tlast_V", "role": "default" }} , 
 	{ "name": "decoded_packet_tvalid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "decoded_packet_tvalid_V", "role": "default" }} , 
 	{ "name": "decoded_packet_tready_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "decoded_packet_tready_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "traffic_decoder",
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
			{"Name" : "raw_packet_tdata_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "raw_packet_tvalid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "raw_packet_tready_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "decoded_packet_tdata_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "decoded_packet_tkeep_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "decoded_packet_tlast_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "decoded_packet_tvalid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "decoded_packet_tready_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "meta_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_count_V", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	traffic_decoder {
		raw_packet_tdata_V {Type I LastRead 0 FirstWrite -1}
		raw_packet_tvalid_V {Type I LastRead 0 FirstWrite -1}
		raw_packet_tready_V {Type O LastRead -1 FirstWrite 0}
		decoded_packet_tdata_V {Type O LastRead -1 FirstWrite 0}
		decoded_packet_tkeep_V {Type O LastRead -1 FirstWrite 0}
		decoded_packet_tlast_V {Type O LastRead -1 FirstWrite 0}
		decoded_packet_tvalid_V {Type O LastRead -1 FirstWrite 0}
		decoded_packet_tready_V {Type I LastRead 0 FirstWrite -1}
		meta_V {Type IO LastRead -1 FirstWrite -1}
		meta_count_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	raw_packet_tdata_V { ap_none {  { raw_packet_tdata_V in_data 0 512 } } }
	raw_packet_tvalid_V { ap_none {  { raw_packet_tvalid_V in_data 0 1 } } }
	raw_packet_tready_V { ap_none {  { raw_packet_tready_V out_data 1 1 } } }
	decoded_packet_tdata_V { ap_none {  { decoded_packet_tdata_V out_data 1 512 } } }
	decoded_packet_tkeep_V { ap_none {  { decoded_packet_tkeep_V out_data 1 64 } } }
	decoded_packet_tlast_V { ap_none {  { decoded_packet_tlast_V out_data 1 1 } } }
	decoded_packet_tvalid_V { ap_none {  { decoded_packet_tvalid_V out_data 1 1 } } }
	decoded_packet_tready_V { ap_none {  { decoded_packet_tready_V in_data 0 1 } } }
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
