set moduleName sw_interface
set isTopModule 1
set isTaskLevelControl 1
set isCombinational 1
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {sw_interface}
set C_modelType { void 0 }
set C_modelArgList {
	{ axil_start_V int 1 regular {axi_slave 0}  }
	{ axil_rst_V int 1 regular {axi_slave 0}  }
	{ axil_len_low_V int 32 regular {axi_slave 0}  }
	{ axil_len_high_V int 32 regular {axi_slave 0}  }
	{ axil_mismatch_V int 32 regular {axi_slave 1}  }
	{ axil_tx_timeElapse_V int 32 regular {axi_slave 1}  }
	{ axil_rx_timeElapse_V int 32 regular {axi_slave 1}  }
	{ axil_tx_timestamp_sum_low_V int 32 regular {axi_slave 1}  }
	{ axil_tx_timestamp_sum_high_V int 32 regular {axi_slave 1}  }
	{ axil_rx_timestamp_sum_low_V int 32 regular {axi_slave 1}  }
	{ axil_rx_timestamp_sum_high_V int 32 regular {axi_slave 1}  }
	{ axil_pkt_cnt_tx_V int 32 regular {axi_slave 1}  }
	{ axil_pkt_cnt_rx_V int 32 regular {axi_slave 1}  }
	{ start_V int 1 regular {pointer 1}  }
	{ rst_V int 1 regular {pointer 1}  }
	{ transfer_length_V int 64 regular {pointer 1}  }
	{ mismatch_V int 1 regular  }
	{ tx_timeElapse_V int 32 regular  }
	{ rx_timeElapse_V int 32 regular  }
	{ tx_timestamp_sum_V int 64 regular  }
	{ rx_timestamp_sum_V int 64 regular  }
	{ pkt_cnt_tx_V int 32 regular  }
	{ pkt_cnt_rx_V int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "axil_start_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "axil_start.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "axil_rst_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "axil_rst.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "axil_len_low_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "axil_len_low.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "axil_len_high_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "axil_len_high.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "axil_mismatch_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "axil_mismatch.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":48}, "offset_end" : {"out":55}} , 
 	{ "Name" : "axil_tx_timeElapse_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "axil_tx_timeElapse.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":56}, "offset_end" : {"out":63}} , 
 	{ "Name" : "axil_rx_timeElapse_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "axil_rx_timeElapse.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":64}, "offset_end" : {"out":71}} , 
 	{ "Name" : "axil_tx_timestamp_sum_low_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "axil_tx_timestamp_sum_low.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":72}, "offset_end" : {"out":79}} , 
 	{ "Name" : "axil_tx_timestamp_sum_high_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "axil_tx_timestamp_sum_high.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":80}, "offset_end" : {"out":87}} , 
 	{ "Name" : "axil_rx_timestamp_sum_low_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "axil_rx_timestamp_sum_low.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":88}, "offset_end" : {"out":95}} , 
 	{ "Name" : "axil_rx_timestamp_sum_high_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "axil_rx_timestamp_sum_high.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":96}, "offset_end" : {"out":103}} , 
 	{ "Name" : "axil_pkt_cnt_tx_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "axil_pkt_cnt_tx.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":104}, "offset_end" : {"out":111}} , 
 	{ "Name" : "axil_pkt_cnt_rx_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "axil_pkt_cnt_rx.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":112}, "offset_end" : {"out":119}} , 
 	{ "Name" : "start_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "start.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "rst_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "rst.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "transfer_length_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "transfer_length.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "mismatch_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mismatch.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "tx_timeElapse_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "tx_timeElapse.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "rx_timeElapse_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "rx_timeElapse.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "tx_timestamp_sum_V", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "tx_timestamp_sum.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "rx_timestamp_sum_V", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "rx_timestamp_sum.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "pkt_cnt_tx_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "pkt_cnt_tx.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "pkt_cnt_rx_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "pkt_cnt_rx.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ start_V sc_out sc_lv 1 signal 13 } 
	{ rst_V sc_out sc_lv 1 signal 14 } 
	{ transfer_length_V sc_out sc_lv 64 signal 15 } 
	{ mismatch_V sc_in sc_lv 1 signal 16 } 
	{ tx_timeElapse_V sc_in sc_lv 32 signal 17 } 
	{ rx_timeElapse_V sc_in sc_lv 32 signal 18 } 
	{ tx_timestamp_sum_V sc_in sc_lv 64 signal 19 } 
	{ rx_timestamp_sum_V sc_in sc_lv 64 signal 20 } 
	{ pkt_cnt_tx_V sc_in sc_lv 32 signal 21 } 
	{ pkt_cnt_rx_V sc_in sc_lv 32 signal 22 } 
	{ s_axi_AXILiteS_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_AXILiteS_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_AXILiteS_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_AXILiteS_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_AXILiteS_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_AXILiteS_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_AXILiteS_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_BRESP sc_out sc_lv 2 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
}
set NewPortList {[ 
	{ "name": "s_axi_AXILiteS_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWADDR" },"address":[{"name":"axil_start_V","role":"data","value":"16"},{"name":"axil_rst_V","role":"data","value":"24"},{"name":"axil_len_low_V","role":"data","value":"32"},{"name":"axil_len_high_V","role":"data","value":"40"}] },
	{ "name": "s_axi_AXILiteS_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWVALID" } },
	{ "name": "s_axi_AXILiteS_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWREADY" } },
	{ "name": "s_axi_AXILiteS_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WVALID" } },
	{ "name": "s_axi_AXILiteS_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WREADY" } },
	{ "name": "s_axi_AXILiteS_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WDATA" } },
	{ "name": "s_axi_AXILiteS_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WSTRB" } },
	{ "name": "s_axi_AXILiteS_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARADDR" },"address":[{"name":"axil_mismatch_V","role":"data","value":"48"}, {"name":"axil_mismatch_V","role":"valid","value":"52","valid_bit":"0"},{"name":"axil_tx_timeElapse_V","role":"data","value":"56"}, {"name":"axil_tx_timeElapse_V","role":"valid","value":"60","valid_bit":"0"},{"name":"axil_rx_timeElapse_V","role":"data","value":"64"}, {"name":"axil_rx_timeElapse_V","role":"valid","value":"68","valid_bit":"0"},{"name":"axil_tx_timestamp_sum_low_V","role":"data","value":"72"}, {"name":"axil_tx_timestamp_sum_low_V","role":"valid","value":"76","valid_bit":"0"},{"name":"axil_tx_timestamp_sum_high_V","role":"data","value":"80"}, {"name":"axil_tx_timestamp_sum_high_V","role":"valid","value":"84","valid_bit":"0"},{"name":"axil_rx_timestamp_sum_low_V","role":"data","value":"88"}, {"name":"axil_rx_timestamp_sum_low_V","role":"valid","value":"92","valid_bit":"0"},{"name":"axil_rx_timestamp_sum_high_V","role":"data","value":"96"}, {"name":"axil_rx_timestamp_sum_high_V","role":"valid","value":"100","valid_bit":"0"},{"name":"axil_pkt_cnt_tx_V","role":"data","value":"104"}, {"name":"axil_pkt_cnt_tx_V","role":"valid","value":"108","valid_bit":"0"},{"name":"axil_pkt_cnt_rx_V","role":"data","value":"112"}, {"name":"axil_pkt_cnt_rx_V","role":"valid","value":"116","valid_bit":"0"}] },
	{ "name": "s_axi_AXILiteS_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARVALID" } },
	{ "name": "s_axi_AXILiteS_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARREADY" } },
	{ "name": "s_axi_AXILiteS_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RVALID" } },
	{ "name": "s_axi_AXILiteS_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RREADY" } },
	{ "name": "s_axi_AXILiteS_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RDATA" } },
	{ "name": "s_axi_AXILiteS_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RRESP" } },
	{ "name": "s_axi_AXILiteS_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BVALID" } },
	{ "name": "s_axi_AXILiteS_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BREADY" } },
	{ "name": "s_axi_AXILiteS_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BRESP" } }, 
 	{ "name": "start_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "start_V", "role": "default" }} , 
 	{ "name": "rst_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rst_V", "role": "default" }} , 
 	{ "name": "transfer_length_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "transfer_length_V", "role": "default" }} , 
 	{ "name": "mismatch_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mismatch_V", "role": "default" }} , 
 	{ "name": "tx_timeElapse_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "tx_timeElapse_V", "role": "default" }} , 
 	{ "name": "rx_timeElapse_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rx_timeElapse_V", "role": "default" }} , 
 	{ "name": "tx_timestamp_sum_V", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_timestamp_sum_V", "role": "default" }} , 
 	{ "name": "rx_timestamp_sum_V", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_timestamp_sum_V", "role": "default" }} , 
 	{ "name": "pkt_cnt_tx_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pkt_cnt_tx_V", "role": "default" }} , 
 	{ "name": "pkt_cnt_rx_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pkt_cnt_rx_V", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "sw_interface",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "axil_start_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "axil_rst_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "axil_len_low_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "axil_len_high_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "axil_mismatch_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "axil_tx_timeElapse_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "axil_rx_timeElapse_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "axil_tx_timestamp_sum_low_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "axil_tx_timestamp_sum_high_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "axil_rx_timestamp_sum_low_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "axil_rx_timestamp_sum_high_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "axil_pkt_cnt_tx_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "axil_pkt_cnt_rx_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "start_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "rst_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "transfer_length_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "mismatch_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "tx_timeElapse_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "rx_timeElapse_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "tx_timestamp_sum_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "rx_timestamp_sum_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "pkt_cnt_tx_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "pkt_cnt_rx_V", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sw_interface_AXILiteS_s_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	sw_interface {
		axil_start_V {Type I LastRead 0 FirstWrite -1}
		axil_rst_V {Type I LastRead 0 FirstWrite -1}
		axil_len_low_V {Type I LastRead 0 FirstWrite -1}
		axil_len_high_V {Type I LastRead 0 FirstWrite -1}
		axil_mismatch_V {Type O LastRead -1 FirstWrite 0}
		axil_tx_timeElapse_V {Type O LastRead -1 FirstWrite 0}
		axil_rx_timeElapse_V {Type O LastRead -1 FirstWrite 0}
		axil_tx_timestamp_sum_low_V {Type O LastRead -1 FirstWrite 0}
		axil_tx_timestamp_sum_high_V {Type O LastRead -1 FirstWrite 0}
		axil_rx_timestamp_sum_low_V {Type O LastRead -1 FirstWrite 0}
		axil_rx_timestamp_sum_high_V {Type O LastRead -1 FirstWrite 0}
		axil_pkt_cnt_tx_V {Type O LastRead -1 FirstWrite 0}
		axil_pkt_cnt_rx_V {Type O LastRead -1 FirstWrite 0}
		start_V {Type O LastRead -1 FirstWrite 0}
		rst_V {Type O LastRead -1 FirstWrite 0}
		transfer_length_V {Type O LastRead -1 FirstWrite 0}
		mismatch_V {Type I LastRead 0 FirstWrite -1}
		tx_timeElapse_V {Type I LastRead 0 FirstWrite -1}
		rx_timeElapse_V {Type I LastRead 0 FirstWrite -1}
		tx_timestamp_sum_V {Type I LastRead 0 FirstWrite -1}
		rx_timestamp_sum_V {Type I LastRead 0 FirstWrite -1}
		pkt_cnt_tx_V {Type I LastRead 0 FirstWrite -1}
		pkt_cnt_rx_V {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	start_V { ap_none {  { start_V out_data 1 1 } } }
	rst_V { ap_none {  { rst_V out_data 1 1 } } }
	transfer_length_V { ap_none {  { transfer_length_V out_data 1 64 } } }
	mismatch_V { ap_none {  { mismatch_V in_data 0 1 } } }
	tx_timeElapse_V { ap_none {  { tx_timeElapse_V in_data 0 32 } } }
	rx_timeElapse_V { ap_none {  { rx_timeElapse_V in_data 0 32 } } }
	tx_timestamp_sum_V { ap_none {  { tx_timestamp_sum_V in_data 0 64 } } }
	rx_timestamp_sum_V { ap_none {  { rx_timestamp_sum_V in_data 0 64 } } }
	pkt_cnt_tx_V { ap_none {  { pkt_cnt_tx_V in_data 0 32 } } }
	pkt_cnt_rx_V { ap_none {  { pkt_cnt_rx_V in_data 0 32 } } }
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
