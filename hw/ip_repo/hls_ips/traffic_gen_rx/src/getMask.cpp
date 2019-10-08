#include <ap_int.h>
void getMask(ap_uint<64> keep,ap_uint<512> & mask) {
#pragma HLS inline
	mask(511,504) = keep[63] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(503,496) = keep[62] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(495,488) = keep[61] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(487,480) = keep[60] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(479,472) = keep[59] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(471,464) = keep[58] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(463,456) = keep[57] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(455,448) = keep[56] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(447,440) = keep[55] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(439,432) = keep[54] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(431,424) = keep[53] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(423,416) = keep[52] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(415,408) = keep[51] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(407,400) = keep[50] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(399,392) = keep[49] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(391,384) = keep[48] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(383,376) = keep[47] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(375,368) = keep[46] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(367,360) = keep[45] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(359,352) = keep[44] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(351,344) = keep[43] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(343,336) = keep[42] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(335,328) = keep[41] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(327,320) = keep[40] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(319,312) = keep[39] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(311,304) = keep[38] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(303,296) = keep[37] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(295,288) = keep[36] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(287,280) = keep[35] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(279,272) = keep[34] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(271,264) = keep[33] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(263,256) = keep[32] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(255,248) = keep[31] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(247,240) = keep[30] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(239,232) = keep[29] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(231,224) = keep[28] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(223,216) = keep[27] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(215,208) = keep[26] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(207,200) = keep[25] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(199,192) = keep[24] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(191,184) = keep[23] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(183,176) = keep[22] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(175,168) = keep[21] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(167,160) = keep[20] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(159,152) = keep[19] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(151,144) = keep[18] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(143,136) = keep[17] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(135,128) = keep[16] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(127,120) = keep[15] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(119,112) = keep[14] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(111,104) = keep[13] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(103,96) = keep[12] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(95,88) = keep[11] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(87,80) = keep[10] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(79,72) = keep[9] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(71,64) = keep[8] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(63,56) = keep[7] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(55,48) = keep[6] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(47,40) = keep[5] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(39,32) = keep[4] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(31,24) = keep[3] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(23,16) = keep[2] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(15,8) = keep[1] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
	mask(7,0) = keep[0] ? ap_uint<8>("ff",16) : ap_uint<8>("0",16);
}