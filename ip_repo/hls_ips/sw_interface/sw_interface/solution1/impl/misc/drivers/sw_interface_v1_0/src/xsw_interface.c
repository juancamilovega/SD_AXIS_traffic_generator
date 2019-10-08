// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xsw_interface.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSw_interface_CfgInitialize(XSw_interface *InstancePtr, XSw_interface_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Axilites_BaseAddress = ConfigPtr->Axilites_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSw_interface_Set_axil_start_V(XSw_interface *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSw_interface_WriteReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_START_V_DATA, Data);
}

u32 XSw_interface_Get_axil_start_V(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_START_V_DATA);
    return Data;
}

void XSw_interface_Set_axil_rst_V(XSw_interface *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSw_interface_WriteReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_RST_V_DATA, Data);
}

u32 XSw_interface_Get_axil_rst_V(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_RST_V_DATA);
    return Data;
}

void XSw_interface_Set_axil_len_low_V(XSw_interface *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSw_interface_WriteReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_LEN_LOW_V_DATA, Data);
}

u32 XSw_interface_Get_axil_len_low_V(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_LEN_LOW_V_DATA);
    return Data;
}

void XSw_interface_Set_axil_len_high_V(XSw_interface *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSw_interface_WriteReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_LEN_HIGH_V_DATA, Data);
}

u32 XSw_interface_Get_axil_len_high_V(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_LEN_HIGH_V_DATA);
    return Data;
}

u32 XSw_interface_Get_axil_mismatch_V(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_MISMATCH_V_DATA);
    return Data;
}

u32 XSw_interface_Get_axil_mismatch_V_vld(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_MISMATCH_V_CTRL);
    return Data & 0x1;
}

u32 XSw_interface_Get_axil_tx_timeElapse_V(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_TX_TIMEELAPSE_V_DATA);
    return Data;
}

u32 XSw_interface_Get_axil_tx_timeElapse_V_vld(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_TX_TIMEELAPSE_V_CTRL);
    return Data & 0x1;
}

u32 XSw_interface_Get_axil_rx_timeElapse_V(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_RX_TIMEELAPSE_V_DATA);
    return Data;
}

u32 XSw_interface_Get_axil_rx_timeElapse_V_vld(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_RX_TIMEELAPSE_V_CTRL);
    return Data & 0x1;
}

u32 XSw_interface_Get_axil_tx_timestamp_sum_low_V(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_TX_TIMESTAMP_SUM_LOW_V_DATA);
    return Data;
}

u32 XSw_interface_Get_axil_tx_timestamp_sum_low_V_vld(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_TX_TIMESTAMP_SUM_LOW_V_CTRL);
    return Data & 0x1;
}

u32 XSw_interface_Get_axil_tx_timestamp_sum_high_V(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_TX_TIMESTAMP_SUM_HIGH_V_DATA);
    return Data;
}

u32 XSw_interface_Get_axil_tx_timestamp_sum_high_V_vld(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_TX_TIMESTAMP_SUM_HIGH_V_CTRL);
    return Data & 0x1;
}

u32 XSw_interface_Get_axil_rx_timestamp_sum_low_V(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_RX_TIMESTAMP_SUM_LOW_V_DATA);
    return Data;
}

u32 XSw_interface_Get_axil_rx_timestamp_sum_low_V_vld(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_RX_TIMESTAMP_SUM_LOW_V_CTRL);
    return Data & 0x1;
}

u32 XSw_interface_Get_axil_rx_timestamp_sum_high_V(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_RX_TIMESTAMP_SUM_HIGH_V_DATA);
    return Data;
}

u32 XSw_interface_Get_axil_rx_timestamp_sum_high_V_vld(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_RX_TIMESTAMP_SUM_HIGH_V_CTRL);
    return Data & 0x1;
}

u32 XSw_interface_Get_axil_pkt_cnt_tx_V(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_PKT_CNT_TX_V_DATA);
    return Data;
}

u32 XSw_interface_Get_axil_pkt_cnt_tx_V_vld(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_PKT_CNT_TX_V_CTRL);
    return Data & 0x1;
}

u32 XSw_interface_Get_axil_pkt_cnt_rx_V(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_PKT_CNT_RX_V_DATA);
    return Data;
}

u32 XSw_interface_Get_axil_pkt_cnt_rx_V_vld(XSw_interface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSw_interface_ReadReg(InstancePtr->Axilites_BaseAddress, XSW_INTERFACE_AXILITES_ADDR_AXIL_PKT_CNT_RX_V_CTRL);
    return Data & 0x1;
}

