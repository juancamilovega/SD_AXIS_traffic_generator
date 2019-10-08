// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// AXILiteS
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of axil_start_V
//        bit 0  - axil_start_V[0] (Read/Write)
//        others - reserved
// 0x14 : reserved
// 0x18 : Data signal of axil_rst_V
//        bit 0  - axil_rst_V[0] (Read/Write)
//        others - reserved
// 0x1c : reserved
// 0x20 : Data signal of axil_len_low_V
//        bit 31~0 - axil_len_low_V[31:0] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of axil_len_high_V
//        bit 31~0 - axil_len_high_V[31:0] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of axil_mismatch_V
//        bit 31~0 - axil_mismatch_V[31:0] (Read)
// 0x34 : Control signal of axil_mismatch_V
//        bit 0  - axil_mismatch_V_ap_vld (Read/COR)
//        others - reserved
// 0x38 : Data signal of axil_tx_timeElapse_V
//        bit 31~0 - axil_tx_timeElapse_V[31:0] (Read)
// 0x3c : Control signal of axil_tx_timeElapse_V
//        bit 0  - axil_tx_timeElapse_V_ap_vld (Read/COR)
//        others - reserved
// 0x40 : Data signal of axil_rx_timeElapse_V
//        bit 31~0 - axil_rx_timeElapse_V[31:0] (Read)
// 0x44 : Control signal of axil_rx_timeElapse_V
//        bit 0  - axil_rx_timeElapse_V_ap_vld (Read/COR)
//        others - reserved
// 0x48 : Data signal of axil_tx_timestamp_sum_low_V
//        bit 31~0 - axil_tx_timestamp_sum_low_V[31:0] (Read)
// 0x4c : Control signal of axil_tx_timestamp_sum_low_V
//        bit 0  - axil_tx_timestamp_sum_low_V_ap_vld (Read/COR)
//        others - reserved
// 0x50 : Data signal of axil_tx_timestamp_sum_high_V
//        bit 31~0 - axil_tx_timestamp_sum_high_V[31:0] (Read)
// 0x54 : Control signal of axil_tx_timestamp_sum_high_V
//        bit 0  - axil_tx_timestamp_sum_high_V_ap_vld (Read/COR)
//        others - reserved
// 0x58 : Data signal of axil_rx_timestamp_sum_low_V
//        bit 31~0 - axil_rx_timestamp_sum_low_V[31:0] (Read)
// 0x5c : Control signal of axil_rx_timestamp_sum_low_V
//        bit 0  - axil_rx_timestamp_sum_low_V_ap_vld (Read/COR)
//        others - reserved
// 0x60 : Data signal of axil_rx_timestamp_sum_high_V
//        bit 31~0 - axil_rx_timestamp_sum_high_V[31:0] (Read)
// 0x64 : Control signal of axil_rx_timestamp_sum_high_V
//        bit 0  - axil_rx_timestamp_sum_high_V_ap_vld (Read/COR)
//        others - reserved
// 0x68 : Data signal of axil_pkt_cnt_tx_V
//        bit 31~0 - axil_pkt_cnt_tx_V[31:0] (Read)
// 0x6c : Control signal of axil_pkt_cnt_tx_V
//        bit 0  - axil_pkt_cnt_tx_V_ap_vld (Read/COR)
//        others - reserved
// 0x70 : Data signal of axil_pkt_cnt_rx_V
//        bit 31~0 - axil_pkt_cnt_rx_V[31:0] (Read)
// 0x74 : Control signal of axil_pkt_cnt_rx_V
//        bit 0  - axil_pkt_cnt_rx_V_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XSW_INTERFACE_AXILITES_ADDR_AXIL_START_V_DATA                 0x10
#define XSW_INTERFACE_AXILITES_BITS_AXIL_START_V_DATA                 1
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_RST_V_DATA                   0x18
#define XSW_INTERFACE_AXILITES_BITS_AXIL_RST_V_DATA                   1
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_LEN_LOW_V_DATA               0x20
#define XSW_INTERFACE_AXILITES_BITS_AXIL_LEN_LOW_V_DATA               32
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_LEN_HIGH_V_DATA              0x28
#define XSW_INTERFACE_AXILITES_BITS_AXIL_LEN_HIGH_V_DATA              32
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_MISMATCH_V_DATA              0x30
#define XSW_INTERFACE_AXILITES_BITS_AXIL_MISMATCH_V_DATA              32
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_MISMATCH_V_CTRL              0x34
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_TX_TIMEELAPSE_V_DATA         0x38
#define XSW_INTERFACE_AXILITES_BITS_AXIL_TX_TIMEELAPSE_V_DATA         32
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_TX_TIMEELAPSE_V_CTRL         0x3c
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_RX_TIMEELAPSE_V_DATA         0x40
#define XSW_INTERFACE_AXILITES_BITS_AXIL_RX_TIMEELAPSE_V_DATA         32
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_RX_TIMEELAPSE_V_CTRL         0x44
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_TX_TIMESTAMP_SUM_LOW_V_DATA  0x48
#define XSW_INTERFACE_AXILITES_BITS_AXIL_TX_TIMESTAMP_SUM_LOW_V_DATA  32
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_TX_TIMESTAMP_SUM_LOW_V_CTRL  0x4c
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_TX_TIMESTAMP_SUM_HIGH_V_DATA 0x50
#define XSW_INTERFACE_AXILITES_BITS_AXIL_TX_TIMESTAMP_SUM_HIGH_V_DATA 32
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_TX_TIMESTAMP_SUM_HIGH_V_CTRL 0x54
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_RX_TIMESTAMP_SUM_LOW_V_DATA  0x58
#define XSW_INTERFACE_AXILITES_BITS_AXIL_RX_TIMESTAMP_SUM_LOW_V_DATA  32
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_RX_TIMESTAMP_SUM_LOW_V_CTRL  0x5c
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_RX_TIMESTAMP_SUM_HIGH_V_DATA 0x60
#define XSW_INTERFACE_AXILITES_BITS_AXIL_RX_TIMESTAMP_SUM_HIGH_V_DATA 32
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_RX_TIMESTAMP_SUM_HIGH_V_CTRL 0x64
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_PKT_CNT_TX_V_DATA            0x68
#define XSW_INTERFACE_AXILITES_BITS_AXIL_PKT_CNT_TX_V_DATA            32
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_PKT_CNT_TX_V_CTRL            0x6c
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_PKT_CNT_RX_V_DATA            0x70
#define XSW_INTERFACE_AXILITES_BITS_AXIL_PKT_CNT_RX_V_DATA            32
#define XSW_INTERFACE_AXILITES_ADDR_AXIL_PKT_CNT_RX_V_CTRL            0x74

