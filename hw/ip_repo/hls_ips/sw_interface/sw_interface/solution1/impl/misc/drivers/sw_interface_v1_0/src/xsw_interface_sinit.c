// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xsw_interface.h"

extern XSw_interface_Config XSw_interface_ConfigTable[];

XSw_interface_Config *XSw_interface_LookupConfig(u16 DeviceId) {
	XSw_interface_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSW_INTERFACE_NUM_INSTANCES; Index++) {
		if (XSw_interface_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XSw_interface_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSw_interface_Initialize(XSw_interface *InstancePtr, u16 DeviceId) {
	XSw_interface_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSw_interface_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSw_interface_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

