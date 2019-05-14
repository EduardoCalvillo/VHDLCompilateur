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

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/calvillo/Bureau/Compilateur/VHDL/Processeur/Multiplexeur.vhd";



static void work_a_1036385143_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    int t11;
    char *t12;
    int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    t1 = (t0 + 2904U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5300);
    t5 = xsi_mem_cmp(t2, t3, 4U);
    if (t5 == 1)
        goto LAB5;

LAB10:    t6 = (t0 + 5304);
    t8 = xsi_mem_cmp(t6, t3, 4U);
    if (t8 == 1)
        goto LAB6;

LAB11:    t9 = (t0 + 5308);
    t11 = xsi_mem_cmp(t9, t3, 4U);
    if (t11 == 1)
        goto LAB7;

LAB12:    t12 = (t0 + 5312);
    t14 = xsi_mem_cmp(t12, t3, 4U);
    if (t14 == 1)
        goto LAB8;

LAB13:
LAB9:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 3304);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t3, 16U);
    xsi_driver_first_trans_fast_port(t2);

LAB4:    xsi_set_current_line(61, ng0);

LAB17:    t2 = (t0 + 3224);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB18;

LAB1:    return;
LAB5:    xsi_set_current_line(63, ng0);
    t15 = (t0 + 1192U);
    t16 = *((char **)t15);
    t15 = (t0 + 3304);
    t17 = (t15 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t16, 16U);
    xsi_driver_first_trans_fast_port(t15);
    goto LAB4;

LAB6:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 3304);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t3, 16U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB4;

LAB7:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 3304);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t3, 16U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB4;

LAB8:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 3304);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t3, 16U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB4;

LAB14:;
LAB15:    t3 = (t0 + 3224);
    *((int *)t3) = 0;
    goto LAB2;

LAB16:    goto LAB15;

LAB18:    goto LAB16;

}


extern void work_a_1036385143_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1036385143_3212880686_p_0};
	xsi_register_didat("work_a_1036385143_3212880686", "isim/ProcesseurTB2_isim_beh.exe.sim/work/a_1036385143_3212880686.didat");
	xsi_register_executes(pe);
}
