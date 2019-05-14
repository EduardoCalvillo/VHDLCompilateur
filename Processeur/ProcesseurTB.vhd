--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:16:36 05/14/2019
-- Design Name:   
-- Module Name:   /home/calvillo/Bureau/Compilateur/VHDL/Processeur/ProcesseurTB.vhd
-- Project Name:  Processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Processeur
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
 
ENTITY ProcesseurTB IS
END ProcesseurTB;
 
ARCHITECTURE behavior OF ProcesseurTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Processeur
	 
generic(MAX_BITS: Natural:=16; OP_BITS : Natural:=4);
    PORT(
         CLK : IN  std_logic;
			LI_DI_A_in, LI_DI_B_in, LI_DI_C_in : in STD_LOGIC_VECTOR(MAX_BITS-1 downto 0);
			LI_DI_OP_in : in STD_LOGIC_VECTOR(OP_BITS -1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Processeur PORT MAP (
          CLK => CLK
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
      wait for 100 ns;	
		LI_DI_A_in <= x"0";
		LI_DI_B_in <= x"DEDE";
		LI_DI_C_in <= x"0";
		LI_DI_OP_in <= x"0";
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
