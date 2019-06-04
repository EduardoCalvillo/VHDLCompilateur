--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:25:45 06/03/2019
-- Design Name:   
-- Module Name:   /home/calvillo/Bureau/Compilateur/VHDL/Processeur/ProjectTB.vhd
-- Project Name:  Processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Project
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ProjectTB IS
END ProjectTB;
 
ARCHITECTURE behavior OF ProjectTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Project
    PORT(
         CLK : IN  std_logic;
         INST_SEL : IN  std_logic_vector(15 downto 0);
         BR_RST : IN  std_logic;
         MEM_RST : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal INST_SEL : std_logic_vector(15 downto 0) := (others => '0');
   signal BR_RST : std_logic := '1';
   signal MEM_RST : std_logic := '0';

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Project PORT MAP (
          CLK => CLK,
          INST_SEL => INST_SEL,
          BR_RST => BR_RST,
          MEM_RST => MEM_RST
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		BR_RST <= '0';
		MEM_RST <= '1';
      wait for 100 ns;	
		BR_RST <= '1';
		MEM_RST <= '0';

		INST_SEL <= x"0001";
      wait for CLK_period;
		INST_SEL <= x"0002";
      wait for CLK_period;
		INST_SEL <= x"0003";
      wait for CLK_period;
		INST_SEL <= x"0004";
      wait for CLK_period;
		INST_SEL <= x"0005";
      wait for CLK_period;
		INST_SEL <= x"0006";
      wait for CLK_period;
		INST_SEL <= x"0007";
      wait for CLK_period;
		INST_SEL <= x"0008";
      wait for CLK_period;
		INST_SEL <= x"0009";
      wait for CLK_period;
		INST_SEL <= x"000A";
      wait for CLK_period;
		INST_SEL <= x"000B";
      wait for CLK_period;
		INST_SEL <= x"000C";
      wait for CLK_period;
		INST_SEL <= x"000D";
      wait for CLK_period;
		INST_SEL <= x"000E";
      wait for CLK_period;
		INST_SEL <= x"000F";
      wait for CLK_period;
		INST_SEL <= x"0010";
      wait for CLK_period;
		INST_SEL <= x"0011";
      wait for CLK_period;
		INST_SEL <= x"0012";
      wait for CLK_period;
		INST_SEL <= x"0013";
      wait for CLK_period;
		INST_SEL <= x"0014";
      wait for CLK_period;
		INST_SEL <= x"0015";
      wait for CLK_period;
		INST_SEL <= x"0016";
      wait for CLK_period;
		INST_SEL <= x"0017";
      wait for CLK_period;
		INST_SEL <= x"0018";
      wait for CLK_period;
		INST_SEL <= x"0019";
      wait for CLK_period;
		INST_SEL <= x"001A";
      wait for CLK_period;
		INST_SEL <= x"001B";
      wait for CLK_period;
		INST_SEL <= x"001C";
      wait for CLK_period;
		INST_SEL <= x"001D";
      wait for CLK_period;
		INST_SEL <= x"001E";
      wait for CLK_period;
		INST_SEL <= x"001F";
      wait for CLK_period;
		INST_SEL <= x"0020";
      wait for CLK_period;
		INST_SEL <= x"0021";
      wait for CLK_period;
		
      wait;
   end process;

END;
