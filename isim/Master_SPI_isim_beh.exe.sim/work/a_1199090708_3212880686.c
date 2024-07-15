/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/ISE_Virtual_Machine_interconnection/from0_SPI/Master_SPI.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_374109322130769762_503743352(char *, unsigned char );


static void work_a_1199090708_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(26, ng0);

LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 7344);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);

LAB2:    t8 = (t0 + 7184);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1199090708_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(27, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 7408);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 7200);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1199090708_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(28, ng0);

LAB3:    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 7472);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 7216);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1199090708_3212880686_p_3(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    int t9;
    unsigned char t10;
    char *t11;
    unsigned char t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    int t18;

LAB0:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 3392U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 7232);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(33, ng0);
    t4 = (t0 + 3752U);
    t8 = *((char **)t4);
    t9 = *((int *)t8);
    t10 = (t9 == 10000);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 3752U);
    t4 = *((char **)t2);
    t9 = *((int *)t4);
    t18 = (t9 + 1);
    t2 = (t0 + 7600);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t14 = *((char **)t11);
    *((int *)t14) = t18;
    xsi_driver_first_trans_fast(t2);

LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 3432U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(34, ng0);
    t4 = (t0 + 3592U);
    t11 = *((char **)t4);
    t12 = *((unsigned char *)t11);
    t13 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t12);
    t4 = (t0 + 7536);
    t14 = (t4 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = t13;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(35, ng0);
    t2 = (t0 + 7600);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((int *)t11) = 1;
    xsi_driver_first_trans_fast(t2);
    goto LAB9;

}

static void work_a_1199090708_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    int t11;
    unsigned char t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    int t18;
    int t19;

LAB0:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 7792);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(51, ng0);
    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 7856);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 3552U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB8;

LAB9:    t3 = (unsigned char)0;

LAB10:    if (t3 != 0)
        goto LAB5;

LAB7:
LAB6:
LAB3:    t1 = (t0 + 7248);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 7664);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(48, ng0);
    t1 = (t0 + 7728);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 4072U);
    t6 = *((char **)t2);
    t11 = *((int *)t6);
    t12 = (t11 == 8);
    if (t12 != 0)
        goto LAB11;

LAB13:    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t9 = (t11 == 0);
    if (t9 == 1)
        goto LAB19;

LAB20:    t1 = (t0 + 4072U);
    t5 = *((char **)t1);
    t18 = *((int *)t5);
    t10 = (t18 > 0);
    t4 = t10;

LAB21:    if (t4 == 1)
        goto LAB16;

LAB17:    t3 = (unsigned char)0;

LAB18:    if (t3 != 0)
        goto LAB14;

LAB15:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 7664);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(73, ng0);
    t1 = (t0 + 7728);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(74, ng0);
    t1 = (t0 + 4648U);
    t2 = *((char **)t1);
    t1 = (t0 + 4232U);
    t5 = *((char **)t1);
    t11 = *((int *)t5);
    t18 = (t11 - 7);
    t15 = (t18 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t11);
    t16 = (1U * t15);
    t17 = (0 + t16);
    t1 = (t2 + t17);
    t3 = *((unsigned char *)t1);
    t6 = (t0 + 7984);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t13 = (t8 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t3;
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(75, ng0);
    t1 = (t0 + 4648U);
    t2 = *((char **)t1);
    t1 = (t0 + 4232U);
    t5 = *((char **)t1);
    t11 = *((int *)t5);
    t18 = (t11 - 7);
    t15 = (t18 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t11);
    t16 = (1U * t15);
    t17 = (0 + t16);
    t1 = (t2 + t17);
    t3 = *((unsigned char *)t1);
    t6 = (t0 + 8048);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t13 = (t8 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t3;
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(76, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t1 = (t0 + 8112);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 40U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(77, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t18 = (t11 + 1);
    t1 = (t0 + 7920);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t18;
    xsi_driver_first_trans_fast(t1);

LAB12:    goto LAB6;

LAB8:    t2 = (t0 + 3592U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB10;

LAB11:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 7920);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t13 = (t8 + 56U);
    t14 = *((char **)t13);
    *((int *)t14) = 0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(55, ng0);
    t1 = (t0 + 7664);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(56, ng0);
    t1 = (t0 + 7728);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(57, ng0);
    t1 = (t0 + 7984);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 8048);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(59, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t1 = (t0 + 8112);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 40U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(60, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t15 = (39 - 31);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t1 = (t2 + t17);
    t5 = (t0 + 8176);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t13 = *((char **)t8);
    memcpy(t13, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(61, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t15 = (39 - 15);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t1 = (t2 + t17);
    t5 = (t0 + 8240);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t13 = *((char **)t8);
    memcpy(t13, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(62, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t11 = (0 - 39);
    t15 = (t11 * -1);
    t16 = (1U * t15);
    t17 = (0 + t16);
    t1 = (t2 + t17);
    t3 = *((unsigned char *)t1);
    t5 = (t0 + 8304);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t13 = *((char **)t8);
    *((unsigned char *)t13) = t3;
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(63, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t11 = (1 - 39);
    t15 = (t11 * -1);
    t16 = (1U * t15);
    t17 = (0 + t16);
    t1 = (t2 + t17);
    t3 = *((unsigned char *)t1);
    t5 = (t0 + 8368);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t13 = *((char **)t8);
    *((unsigned char *)t13) = t3;
    xsi_driver_first_trans_fast_port(t5);
    goto LAB12;

LAB14:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 7664);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t13 = (t8 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(66, ng0);
    t1 = (t0 + 7728);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(67, ng0);
    t1 = (t0 + 4648U);
    t2 = *((char **)t1);
    t1 = (t0 + 4232U);
    t5 = *((char **)t1);
    t11 = *((int *)t5);
    t18 = (t11 - 7);
    t15 = (t18 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t11);
    t16 = (1U * t15);
    t17 = (0 + t16);
    t1 = (t2 + t17);
    t3 = *((unsigned char *)t1);
    t6 = (t0 + 7984);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t13 = (t8 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t3;
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(68, ng0);
    t1 = (t0 + 4648U);
    t2 = *((char **)t1);
    t1 = (t0 + 4232U);
    t5 = *((char **)t1);
    t11 = *((int *)t5);
    t18 = (t11 - 7);
    t15 = (t18 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t11);
    t16 = (1U * t15);
    t17 = (0 + t16);
    t1 = (t2 + t17);
    t3 = *((unsigned char *)t1);
    t6 = (t0 + 8048);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t13 = (t8 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t3;
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t1 = (t0 + 8112);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 40U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t18 = (t11 + 1);
    t1 = (t0 + 7920);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t18;
    xsi_driver_first_trans_fast(t1);
    goto LAB12;

LAB16:    t1 = (t0 + 4072U);
    t6 = *((char **)t1);
    t19 = *((int *)t6);
    t12 = (t19 < 8);
    t3 = t12;
    goto LAB18;

LAB19:    t4 = (unsigned char)1;
    goto LAB21;

}

static void work_a_1199090708_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    int t19;

LAB0:    xsi_set_current_line(84, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 3552U);
    t9 = xsi_signal_has_event(t1);
    if (t9 == 1)
        goto LAB10;

LAB11:    t4 = (unsigned char)0;

LAB12:    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 7264);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(85, ng0);
    t1 = (t0 + 8432);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 4232U);
    t7 = *((char **)t2);
    t14 = *((int *)t7);
    t15 = (t14 == 8);
    if (t15 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    t14 = *((int *)t2);
    t19 = (t14 + 1);
    t1 = (t0 + 8432);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t19;
    xsi_driver_first_trans_fast(t1);

LAB14:    goto LAB3;

LAB7:    t2 = (t0 + 2632U);
    t6 = *((char **)t2);
    t12 = *((unsigned char *)t6);
    t13 = (t12 == (unsigned char)2);
    t3 = t13;
    goto LAB9;

LAB10:    t2 = (t0 + 3592U);
    t5 = *((char **)t2);
    t10 = *((unsigned char *)t5);
    t11 = (t10 == (unsigned char)3);
    t4 = t11;
    goto LAB12;

LAB13:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 8432);
    t8 = (t2 + 56U);
    t16 = *((char **)t8);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((int *)t18) = 0;
    xsi_driver_first_trans_fast(t2);
    goto LAB14;

}


extern void work_a_1199090708_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1199090708_3212880686_p_0,(void *)work_a_1199090708_3212880686_p_1,(void *)work_a_1199090708_3212880686_p_2,(void *)work_a_1199090708_3212880686_p_3,(void *)work_a_1199090708_3212880686_p_4,(void *)work_a_1199090708_3212880686_p_5};
	xsi_register_didat("work_a_1199090708_3212880686", "isim/Master_SPI_isim_beh.exe.sim/work/a_1199090708_3212880686.didat");
	xsi_register_executes(pe);
}
