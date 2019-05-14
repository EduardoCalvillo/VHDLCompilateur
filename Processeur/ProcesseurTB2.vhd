--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:27:04 05/14/2019
-- Design Name:   
-- Module Name:   /home/calvillo/Bureau/Compilateur/VHDL/Processeur/ProcesseurTB2.vhd
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
 
ENTITY ProcesseurTB2 IS
END ProcesseurTB2;
 
ARCHITECTURE behavior OF ProcesseurTB2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Processeur
    PORT(
         CLK : IN  std_logic;
         LI_DI_A_in : IN  std_logic_vector(15 downto 0);
         LI_DI_B_in : IN  std_logic_vector(15 downto 0);
         LI_DI_C_in : IN  std_logic_vector(15 downto 0);
         LI_DI_OP_in : IN  std_logic_vector(3 downto 0);
			RST : IN std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal LI_DI_A_in : std_logic_vector(15 downto 0) := (others => '0');
   signal LI_DI_B_in : std_logic_vector(15 downto 0) := (others => '0');
   signal LI_DI_C_in : std_logic_vector(15 downto 0) := (others => '0');
   signal LI_DI_OP_in : std_logic_vector(3 downto 0) := (others => '0');

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Processeur PORT MAP (
          CLK => CLK,
			 RST => RST,
          LI_DI_A_in => LI_DI_A_in,
          LI_DI_B_in => LI_DI_B_in,
          LI_DI_C_in => LI_DI_C_in,
          LI_DI_OP_in => LI_DI_OP_in
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
		RST <= '1';
      wait for 100 ns;	
		RST <= '0';
		LI_DI_A_in <= x"0000";
		LI_DI_B_in <= x"FFFF";
		LI_DI_C_in <= x"0000";
		LI_DI_OP_in <= x"6";
      wait for CLK_period*10;
		
		LI_DI_A_in <= x"0001";
		LI_DI_B_in <= x"0006";
		LI_DI_C_in <= x"0000";
		LI_DI_OP_in <= x"6";
		
      wait for CLK_period*10;
		-- A: @W, B: DATA
		LI_DI_A_in <= x"0002";
		LI_DI_B_in <= x"0002";
		LI_DI_C_in <= x"0000";
		LI_DI_OP_in <= x"6";
		
      wait for CLK_period*10;      -- insert stimulus here 

		-- A: @A, B: @B
		LI_DI_A_in <= x"0003";
		LI_DI_B_in <= x"0001";
		LI_DI_C_in <= x"0002";
		LI_DI_OP_in <= x"4";
		
      wait for CLK_period*10;      -- insert stimulus here 

      wait;
   end process;

END;
