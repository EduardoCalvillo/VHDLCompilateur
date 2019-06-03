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
static const char *ng0 = "/home/calvillo/Bureau/Compilateur/VHDL/Processeur/ChoiceMux.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);


static void work_a_4282440966_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 2824U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t2 = (t0 + 5016U);
    t5 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t4, t2);
    t6 = (t5 - 15);
    t7 = (t6 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t5);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t10 = (t3 + t9);
    t11 = *((unsigned char *)t10);
    t12 = (char *)((nl0) + t11);
    goto **((char **)t12);

LAB4:    xsi_set_current_line(44, ng0);

LAB9:    t2 = (t0 + 3144);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB10;

LAB1:    return;
LAB5:    xsi_set_current_line(45, ng0);
    t13 = (t0 + 1352U);
    t14 = *((char **)t13);
    t13 = (t0 + 3224);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t14, 16U);
    xsi_driver_first_trans_fast_port(t13);
    goto LAB4;

LAB6:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 3224);
    t4 = (t2 + 56U);
    t10 = *((char **)t4);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t3, 16U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB4;

LAB7:    t3 = (t0 + 3144);
    *((int *)t3) = 0;
    goto LAB2;

LAB8:    goto LAB7;

LAB10:    goto LAB8;

}


extern void work_a_4282440966_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4282440966_3212880686_p_0};
	xsi_register_didat("work_a_4282440966_3212880686", "isim/ProjectTB_isim_beh.exe.sim/work/a_4282440966_3212880686.didat");
	xsi_register_executes(pe);
}
