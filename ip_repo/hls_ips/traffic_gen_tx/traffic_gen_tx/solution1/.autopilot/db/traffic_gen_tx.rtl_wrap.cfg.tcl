set lang "C++"
set moduleName "traffic_gen_tx"
set moduleIsExternC "0"
set rawDecl ""
set globalVariable ""
set PortList ""
set PortName0 "from_decoder"
set BitWidth0 "1024"
set ArrayOpt0 ""
set Const0 "0"
set Volatile0 "0"
set Pointer0 "2"
set Reference0 "1"
set Dims0 [list 0]
set Interface0 "wire"
set structMem0 ""
set PortName00 "tdata"
set BitWidth00 "512"
set ArrayOpt00 ""
set Const00 "0"
set Volatile00 "0"
set Pointer00 "0"
set Reference00 "0"
set Dims00 [list 0]
set Interface00 "wire"
set DataType00 "[list ap_uint 512 ]"
set Port00 [list $PortName00 $Interface00 $DataType00 $Pointer00 $Dims00 $Const00 $Volatile00 $ArrayOpt00]
lappend structMem0 $Port00
set PortName01 "tkeep"
set BitWidth01 "64"
set ArrayOpt01 ""
set Const01 "0"
set Volatile01 "0"
set Pointer01 "0"
set Reference01 "0"
set Dims01 [list 0]
set Interface01 "wire"
set DataType01 "[list ap_uint 64 ]"
set Port01 [list $PortName01 $Interface01 $DataType01 $Pointer01 $Dims01 $Const01 $Volatile01 $ArrayOpt01]
lappend structMem0 $Port01
set PortName02 "tlast"
set BitWidth02 "8"
set ArrayOpt02 ""
set Const02 "0"
set Volatile02 "0"
set Pointer02 "0"
set Reference02 "0"
set Dims02 [list 0]
set Interface02 "wire"
set DataType02 "[list ap_uint 1 ]"
set Port02 [list $PortName02 $Interface02 $DataType02 $Pointer02 $Dims02 $Const02 $Volatile02 $ArrayOpt02]
lappend structMem0 $Port02
set PortName03 "tvalid"
set BitWidth03 "8"
set ArrayOpt03 ""
set Const03 "0"
set Volatile03 "0"
set Pointer03 "0"
set Reference03 "0"
set Dims03 [list 0]
set Interface03 "wire"
set DataType03 "[list ap_uint 1 ]"
set Port03 [list $PortName03 $Interface03 $DataType03 $Pointer03 $Dims03 $Const03 $Volatile03 $ArrayOpt03]
lappend structMem0 $Port03
set structParameter0 [list ]
set structArgument0 [list ]
set NameSpace0 [list ]
set structIsPacked0 "0"
set DataType0 [list "AXIS" "struct AXIS" $structMem0 1 0 $structParameter0 $structArgument0 $NameSpace0 $structIsPacked0]
set Port0 [list $PortName0 $Interface0 $DataType0 $Pointer0 $Dims0 $Const0 $Volatile0 $ArrayOpt0]
lappend PortList $Port0
set PortName1 "to_app"
set BitWidth1 "1024"
set ArrayOpt1 ""
set Const1 "0"
set Volatile1 "0"
set Pointer1 "2"
set Reference1 "1"
set Dims1 [list 0]
set Interface1 "wire"
set structMem1 ""
set PortName10 "tdata"
set BitWidth10 "512"
set ArrayOpt10 ""
set Const10 "0"
set Volatile10 "0"
set Pointer10 "0"
set Reference10 "0"
set Dims10 [list 0]
set Interface10 "wire"
set DataType10 "[list ap_uint 512 ]"
set Port10 [list $PortName10 $Interface10 $DataType10 $Pointer10 $Dims10 $Const10 $Volatile10 $ArrayOpt10]
lappend structMem1 $Port10
set PortName11 "tkeep"
set BitWidth11 "64"
set ArrayOpt11 ""
set Const11 "0"
set Volatile11 "0"
set Pointer11 "0"
set Reference11 "0"
set Dims11 [list 0]
set Interface11 "wire"
set DataType11 "[list ap_uint 64 ]"
set Port11 [list $PortName11 $Interface11 $DataType11 $Pointer11 $Dims11 $Const11 $Volatile11 $ArrayOpt11]
lappend structMem1 $Port11
set PortName12 "tlast"
set BitWidth12 "8"
set ArrayOpt12 ""
set Const12 "0"
set Volatile12 "0"
set Pointer12 "0"
set Reference12 "0"
set Dims12 [list 0]
set Interface12 "wire"
set DataType12 "[list ap_uint 1 ]"
set Port12 [list $PortName12 $Interface12 $DataType12 $Pointer12 $Dims12 $Const12 $Volatile12 $ArrayOpt12]
lappend structMem1 $Port12
set PortName13 "tvalid"
set BitWidth13 "8"
set ArrayOpt13 ""
set Const13 "0"
set Volatile13 "0"
set Pointer13 "0"
set Reference13 "0"
set Dims13 [list 0]
set Interface13 "wire"
set DataType13 "[list ap_uint 1 ]"
set Port13 [list $PortName13 $Interface13 $DataType13 $Pointer13 $Dims13 $Const13 $Volatile13 $ArrayOpt13]
lappend structMem1 $Port13
set structParameter1 [list ]
set structArgument1 [list ]
set NameSpace1 [list ]
set structIsPacked1 "0"
set DataType1 [list "AXIS" "struct AXIS" $structMem1 1 0 $structParameter1 $structArgument1 $NameSpace1 $structIsPacked1]
set Port1 [list $PortName1 $Interface1 $DataType1 $Pointer1 $Dims1 $Const1 $Volatile1 $ArrayOpt1]
lappend PortList $Port1
set PortName2 "to_cmp_fifo"
set BitWidth2 "1024"
set ArrayOpt2 ""
set Const2 "0"
set Volatile2 "0"
set Pointer2 "2"
set Reference2 "1"
set Dims2 [list 0]
set Interface2 "wire"
set structMem2 ""
set PortName20 "tdata"
set BitWidth20 "512"
set ArrayOpt20 ""
set Const20 "0"
set Volatile20 "0"
set Pointer20 "0"
set Reference20 "0"
set Dims20 [list 0]
set Interface20 "wire"
set DataType20 "[list ap_uint 512 ]"
set Port20 [list $PortName20 $Interface20 $DataType20 $Pointer20 $Dims20 $Const20 $Volatile20 $ArrayOpt20]
lappend structMem2 $Port20
set PortName21 "tkeep"
set BitWidth21 "64"
set ArrayOpt21 ""
set Const21 "0"
set Volatile21 "0"
set Pointer21 "0"
set Reference21 "0"
set Dims21 [list 0]
set Interface21 "wire"
set DataType21 "[list ap_uint 64 ]"
set Port21 [list $PortName21 $Interface21 $DataType21 $Pointer21 $Dims21 $Const21 $Volatile21 $ArrayOpt21]
lappend structMem2 $Port21
set PortName22 "tlast"
set BitWidth22 "8"
set ArrayOpt22 ""
set Const22 "0"
set Volatile22 "0"
set Pointer22 "0"
set Reference22 "0"
set Dims22 [list 0]
set Interface22 "wire"
set DataType22 "[list ap_uint 1 ]"
set Port22 [list $PortName22 $Interface22 $DataType22 $Pointer22 $Dims22 $Const22 $Volatile22 $ArrayOpt22]
lappend structMem2 $Port22
set PortName23 "tvalid"
set BitWidth23 "8"
set ArrayOpt23 ""
set Const23 "0"
set Volatile23 "0"
set Pointer23 "0"
set Reference23 "0"
set Dims23 [list 0]
set Interface23 "wire"
set DataType23 "[list ap_uint 1 ]"
set Port23 [list $PortName23 $Interface23 $DataType23 $Pointer23 $Dims23 $Const23 $Volatile23 $ArrayOpt23]
lappend structMem2 $Port23
set structParameter2 [list ]
set structArgument2 [list ]
set NameSpace2 [list ]
set structIsPacked2 "0"
set DataType2 [list "AXIS" "struct AXIS" $structMem2 1 0 $structParameter2 $structArgument2 $NameSpace2 $structIsPacked2]
set Port2 [list $PortName2 $Interface2 $DataType2 $Pointer2 $Dims2 $Const2 $Volatile2 $ArrayOpt2]
lappend PortList $Port2
set PortName3 "from_decoder_tready"
set BitWidth3 "8"
set ArrayOpt3 ""
set Const3 "0"
set Volatile3 "0"
set Pointer3 "2"
set Reference3 "1"
set Dims3 [list 0]
set Interface3 "wire"
set DataType3 "[list ap_uint 1 ]"
set Port3 [list $PortName3 $Interface3 $DataType3 $Pointer3 $Dims3 $Const3 $Volatile3 $ArrayOpt3]
lappend PortList $Port3
set PortName4 "to_app_tready"
set BitWidth4 "8"
set ArrayOpt4 ""
set Const4 "0"
set Volatile4 "0"
set Pointer4 "0"
set Reference4 "0"
set Dims4 [list 0]
set Interface4 "wire"
set DataType4 "[list ap_uint 1 ]"
set Port4 [list $PortName4 $Interface4 $DataType4 $Pointer4 $Dims4 $Const4 $Volatile4 $ArrayOpt4]
lappend PortList $Port4
set PortName5 "tx_timeElapse"
set BitWidth5 "32"
set ArrayOpt5 ""
set Const5 "0"
set Volatile5 "0"
set Pointer5 "2"
set Reference5 "1"
set Dims5 [list 0]
set Interface5 "wire"
set DataType5 "[list ap_uint 32 ]"
set Port5 [list $PortName5 $Interface5 $DataType5 $Pointer5 $Dims5 $Const5 $Volatile5 $ArrayOpt5]
lappend PortList $Port5
set PortName6 "tx_timestamp_sum"
set BitWidth6 "64"
set ArrayOpt6 ""
set Const6 "0"
set Volatile6 "0"
set Pointer6 "2"
set Reference6 "1"
set Dims6 [list 0]
set Interface6 "wire"
set DataType6 "[list ap_uint 64 ]"
set Port6 [list $PortName6 $Interface6 $DataType6 $Pointer6 $Dims6 $Const6 $Volatile6 $ArrayOpt6]
lappend PortList $Port6
set PortName7 "pkt_cnt_tx"
set BitWidth7 "32"
set ArrayOpt7 ""
set Const7 "0"
set Volatile7 "0"
set Pointer7 "2"
set Reference7 "1"
set Dims7 [list 0]
set Interface7 "wire"
set DataType7 "[list ap_uint 32 ]"
set Port7 [list $PortName7 $Interface7 $DataType7 $Pointer7 $Dims7 $Const7 $Volatile7 $ArrayOpt7]
lappend PortList $Port7
set PortName8 "time_cnt"
set BitWidth8 "32"
set ArrayOpt8 ""
set Const8 "0"
set Volatile8 "0"
set Pointer8 "2"
set Reference8 "1"
set Dims8 [list 0]
set Interface8 "wire"
set DataType8 "[list ap_uint 32 ]"
set Port8 [list $PortName8 $Interface8 $DataType8 $Pointer8 $Dims8 $Const8 $Volatile8 $ArrayOpt8]
lappend PortList $Port8
set globalAPint "" 
set returnAPInt "" 
set hasCPPAPInt 1 
set argAPInt "" 
set hasCPPAPFix 0 
set hasSCFix 0 
set hasCBool 0 
set hasCPPComplex 0 
set isTemplateTop 0
set hasHalf 0 
set dataPackList ""
set module [list $moduleName $PortList $rawDecl $argAPInt $returnAPInt $dataPackList]
