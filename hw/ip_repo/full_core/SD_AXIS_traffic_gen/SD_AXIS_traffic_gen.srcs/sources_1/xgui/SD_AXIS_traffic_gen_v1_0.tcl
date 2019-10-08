
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/SD_AXIS_traffic_gen_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "EN_LOOPBACK" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATAWIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "EN_DATA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "EN_KEEP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "EN_LAST" -parent ${Page_0}
  ipgui::add_param $IPINST -name "EN_READY" -parent ${Page_0}


}

proc update_PARAM_VALUE.DWIDTH { PARAM_VALUE.DWIDTH PARAM_VALUE.DATAWIDTH } {
	# Procedure called to update DWIDTH when any of the dependent parameters in the arguments change
	
	set DWIDTH ${PARAM_VALUE.DWIDTH}
	set DATAWIDTH ${PARAM_VALUE.DATAWIDTH}
	set values(DATAWIDTH) [get_property value $DATAWIDTH]
	set_property value [gen_USERPARAMETER_DWIDTH_VALUE $values(DATAWIDTH)] $DWIDTH
}

proc validate_PARAM_VALUE.DWIDTH { PARAM_VALUE.DWIDTH } {
	# Procedure called to validate DWIDTH
	return true
}

proc update_PARAM_VALUE.DATAWIDTH { PARAM_VALUE.DATAWIDTH } {
	# Procedure called to update DATAWIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATAWIDTH { PARAM_VALUE.DATAWIDTH } {
	# Procedure called to validate DATAWIDTH
	return true
}

proc update_PARAM_VALUE.EN_DATA { PARAM_VALUE.EN_DATA } {
	# Procedure called to update EN_DATA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EN_DATA { PARAM_VALUE.EN_DATA } {
	# Procedure called to validate EN_DATA
	return true
}

proc update_PARAM_VALUE.EN_KEEP { PARAM_VALUE.EN_KEEP } {
	# Procedure called to update EN_KEEP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EN_KEEP { PARAM_VALUE.EN_KEEP } {
	# Procedure called to validate EN_KEEP
	return true
}

proc update_PARAM_VALUE.EN_LAST { PARAM_VALUE.EN_LAST } {
	# Procedure called to update EN_LAST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EN_LAST { PARAM_VALUE.EN_LAST } {
	# Procedure called to validate EN_LAST
	return true
}

proc update_PARAM_VALUE.EN_LOOPBACK { PARAM_VALUE.EN_LOOPBACK } {
	# Procedure called to update EN_LOOPBACK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EN_LOOPBACK { PARAM_VALUE.EN_LOOPBACK } {
	# Procedure called to validate EN_LOOPBACK
	return true
}

proc update_PARAM_VALUE.EN_READY { PARAM_VALUE.EN_READY } {
	# Procedure called to update EN_READY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EN_READY { PARAM_VALUE.EN_READY } {
	# Procedure called to validate EN_READY
	return true
}


proc update_MODELPARAM_VALUE.DWIDTH { MODELPARAM_VALUE.DWIDTH PARAM_VALUE.DWIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DWIDTH}] ${MODELPARAM_VALUE.DWIDTH}
}

proc update_MODELPARAM_VALUE.EN_DATA { MODELPARAM_VALUE.EN_DATA PARAM_VALUE.EN_DATA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EN_DATA}] ${MODELPARAM_VALUE.EN_DATA}
}

proc update_MODELPARAM_VALUE.EN_KEEP { MODELPARAM_VALUE.EN_KEEP PARAM_VALUE.EN_KEEP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EN_KEEP}] ${MODELPARAM_VALUE.EN_KEEP}
}

proc update_MODELPARAM_VALUE.EN_LAST { MODELPARAM_VALUE.EN_LAST PARAM_VALUE.EN_LAST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EN_LAST}] ${MODELPARAM_VALUE.EN_LAST}
}

proc update_MODELPARAM_VALUE.EN_READY { MODELPARAM_VALUE.EN_READY PARAM_VALUE.EN_READY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EN_READY}] ${MODELPARAM_VALUE.EN_READY}
}

proc update_MODELPARAM_VALUE.EN_LOOPBACK { MODELPARAM_VALUE.EN_LOOPBACK PARAM_VALUE.EN_LOOPBACK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EN_LOOPBACK}] ${MODELPARAM_VALUE.EN_LOOPBACK}
}

