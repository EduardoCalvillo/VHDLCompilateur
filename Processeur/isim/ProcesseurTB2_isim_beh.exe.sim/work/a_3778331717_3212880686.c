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
static const char *ng0 = "/home/calvillo/Bureau/Compilateur/VHDL/Processeur/Processeur.vhd";



static void work_a_3778331717_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    char *t4;
    unsigned char t6;
    unsigned int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    char *t18;
    unsigned char t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    unsigned int t31;
    char *t32;
    unsigned char t34;
    unsigned int t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;

LAB0:    xsi_set_current_line(154, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t3 = (0 + 0U);
    t1 = (t2 + t3);
    t4 = (t0 + 11928);
    t6 = 1;
    if (4U == 4U)
        goto LAB5;

LAB6:    t6 = 0;

LAB7:    if (t6 != 0)
        goto LAB3;

LAB4:    t15 = (t0 + 2952U);
    t16 = *((char **)t15);
    t17 = (0 + 0U);
    t15 = (t16 + t17);
    t18 = (t0 + 11932);
    t20 = 1;
    if (4U == 8U)
        goto LAB13;

LAB14:    t20 = 0;

LAB15:    if (t20 != 0)
        goto LAB11;

LAB12:    t29 = (t0 + 2952U);
    t30 = *((char **)t29);
    t31 = (0 + 0U);
    t29 = (t30 + t31);
    t32 = (t0 + 11940);
    t34 = 1;
    if (4U == 8U)
        goto LAB21;

LAB22:    t34 = 0;

LAB23:    if (t34 != 0)
        goto LAB19;

LAB20:
LAB27:    t43 = (t0 + 4904);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    *((unsigned char *)t47) = (unsigned char)3;
    xsi_driver_first_trans_delta(t43, 1U, 1, 0LL);

LAB2:    t48 = (t0 + 4824);
    *((int *)t48) = 1;

LAB1:    return;
LAB3:    t10 = (t0 + 4904);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_delta(t10, 1U, 1, 0LL);
    goto LAB2;

LAB5:    t7 = 0;

LAB8:    if (t7 < 4U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t8 = (t1 + t7);
    t9 = (t4 + t7);
    if (*((unsigned char *)t8) != *((unsigned char *)t9))
        goto LAB6;

LAB10:    t7 = (t7 + 1);
    goto LAB8;

LAB11:    t24 = (t0 + 4904);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    *((unsigned char *)t28) = (unsigned char)2;
    xsi_driver_first_trans_delta(t24, 1U, 1, 0LL);
    goto LAB2;

LAB13:    t21 = 0;

LAB16:    if (t21 < 4U)
        goto LAB17;
    else
        goto LAB15;

LAB17:    t22 = (t15 + t21);
    t23 = (t18 + t21);
    if (*((unsigned char *)t22) != *((unsigned char *)t23))
        goto LAB14;

LAB18:    t21 = (t21 + 1);
    goto LAB16;

LAB19:    t38 = (t0 + 4904);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t40 + 56U);
    t42 = *((char **)t41);
    *((unsigned char *)t42) = (unsigned char)2;
    xsi_driver_first_trans_delta(t38, 1U, 1, 0LL);
    goto LAB2;

LAB21:    t35 = 0;

LAB24:    if (t35 < 4U)
        goto LAB25;
    else
        goto LAB23;

LAB25:    t36 = (t29 + t35);
    t37 = (t32 + t35);
    if (*((unsigned char *)t36) != *((unsigned char *)t37))
        goto LAB22;

LAB26:    t35 = (t35 + 1);
    goto LAB24;

LAB28:    goto LAB2;

}


extern void work_a_3778331717_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3778331717_3212880686_p_0};
	xsi_register_didat("work_a_3778331717_3212880686", "isim/ProcesseurTB2_isim_beh.exe.sim/work/a_3778331717_3212880686.didat");
	xsi_register_executes(pe);
}
