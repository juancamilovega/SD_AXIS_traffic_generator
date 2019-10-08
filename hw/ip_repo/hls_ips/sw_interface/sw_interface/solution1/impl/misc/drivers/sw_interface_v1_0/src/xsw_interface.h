// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XSW_INTERFACE_H
#define XSW_INTERFACE_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xsw_interface_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Axilites_BaseAddress;
} XSw_interface_Config;
#endif

typedef struct {
    u32 Axilites_BaseAddress;
    u32 IsReady;
} XSw_interface;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XSw_interface_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XSw_interface_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XSw_interface_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XSw_interface_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XSw_interface_Initialize(XSw_interface *InstancePtr, u16 DeviceId);
XSw_interface_Config* XSw_interface_LookupConfig(u16 DeviceId);
int XSw_interface_CfgInitialize(XSw_interface *InstancePtr, XSw_interface_Config *ConfigPtr);
#else
int XSw_interface_Initialize(XSw_interface *InstancePtr, const char* InstanceName);
int XSw_interface_Release(XSw_interface *InstancePtr);
#endif


void XSw_interface_Set_axil_start_V(XSw_interface *InstancePtr, u32 Data);
u32 XSw_interface_Get_axil_start_V(XSw_interface *InstancePtr);
void XSw_interface_Set_axil_rst_V(XSw_interface *InstancePtr, u32 Data);
u32 XSw_interface_Get_axil_rst_V(XSw_interface *InstancePtr);
void XSw_interface_Set_axil_len_low_V(XSw_interface *InstancePtr, u32 Data);
u32 XSw_interface_Get_axil_len_low_V(XSw_interface *InstancePtr);
void XSw_interface_Set_axil_len_high_V(XSw_interface *InstancePtr, u32 Data);
u32 XSw_interface_Get_axil_len_high_V(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_mismatch_V(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_mismatch_V_vld(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_tx_timeElapse_V(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_tx_timeElapse_V_vld(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_rx_timeElapse_V(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_rx_timeElapse_V_vld(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_tx_timestamp_sum_low_V(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_tx_timestamp_sum_low_V_vld(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_tx_timestamp_sum_high_V(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_tx_timestamp_sum_high_V_vld(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_rx_timestamp_sum_low_V(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_rx_timestamp_sum_low_V_vld(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_rx_timestamp_sum_high_V(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_rx_timestamp_sum_high_V_vld(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_pkt_cnt_tx_V(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_pkt_cnt_tx_V_vld(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_pkt_cnt_rx_V(XSw_interface *InstancePtr);
u32 XSw_interface_Get_axil_pkt_cnt_rx_V_vld(XSw_interface *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
