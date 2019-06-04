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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *STD_STANDARD;
char *IEEE_P_2592010699;
char *STD_TEXTIO;
char *IEEE_P_1242562249;
char *IEEE_P_3564397177;
char *WORK_P_2188849903;
char *IEEE_P_3972351953;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    std_textio_init();
    ieee_p_3564397177_init();
    work_p_2188849903_init();
    ieee_p_3972351953_init();
    work_a_2798991474_3212880686_init();
    work_a_2760800999_3212880686_init();
    work_a_3025458149_3212880686_init();
    work_a_4153776291_3212880686_init();
    work_a_0358788911_3212880686_init();
    work_a_2422053399_3212880686_init();
    work_a_3137736301_3212880686_init();
    work_a_0964482903_3212880686_init();
    work_a_1442096686_3212880686_init();
    work_a_2779918217_2372691052_init();


    xsi_register_tops("work_a_2779918217_2372691052");

    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");
    WORK_P_2188849903 = xsi_get_engine_memory("work_p_2188849903");
    IEEE_P_3972351953 = xsi_get_engine_memory("ieee_p_3972351953");

    return xsi_run_simulation(argc, argv);

}
