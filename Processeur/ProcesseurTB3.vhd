--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:51:41 05/28/2019
-- Design Name:   
-- Module Name:   /home/calvillo/Bureau/Compilateur/VHDL/Processeur/ProcesseurTB3.vhd
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
 
ENTITY ProcesseurTB3 IS
END ProcesseurTB3;
 
ARCHITECTURE behavior OF ProcesseurTB3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Processeur
    PORT(
         CLK : IN  std_logic;
         LI_DI_A_in : IN  std_logic_vector(15 downto 0);
         LI_DI_B_in : IN  std_logic_vector(15 downto 0);
         LI_DI_C_in : IN  std_logic_vector(15 downto 0);
         data_mem_in : IN  std_logic_vector(15 downto 0);
         LI_DI_OP_in : IN  std_logic_vector(3 downto 0);
         RST : IN  std_logic;
         data_mem_out : OUT  std_logic_vector(15 downto 0);
         data_mem_addr : OUT  std_logic_vector(8 downto 0);
         data_mem_RW : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal LI_DI_A_in : std_logic_vector(15 downto 0) := (others => '0');
   signal LI_DI_B_in : std_logic_vector(15 downto 0) := (others => '0');
   signal LI_DI_C_in : std_logic_vector(15 downto 0) := (others => '0');
   signal data_mem_in : std_logic_vector(15 downto 0) := (others => '0');
   signal LI_DI_OP_in : std_logic_vector(3 downto 0) := (others => '0');
   signal RST : std_logic := '0';

 	--Outputs
   signal data_mem_out : std_logic_vector(15 downto 0);
   signal data_mem_addr : std_logic_vector(8 downto 0);
   signal data_mem_RW : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Processeur PORT MAP (
          CLK => CLK,
          LI_DI_A_in => LI_DI_A_in,
          LI_DI_B_in => LI_DI_B_in,
          LI_DI_C_in => LI_DI_C_in,
          data_mem_in => data_mem_in,
          LI_DI_OP_in => LI_DI_OP_in,
          RST => RST,
          data_mem_out => data_mem_out,
          data_mem_addr => data_mem_addr,
          data_mem_RW => data_mem_RW
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
		LI_DI_B_in <= x"0004";
		LI_DI_C_in <= x"0000";
		LI_DI_OP_in <= x"6";
      wait for CLK_period;
		
		LI_DI_A_in <= x"0001";
		LI_DI_B_in <= x"0002";
		LI_DI_C_in <= x"0000";
		LI_DI_OP_in <= x"6";
		
      wait for CLK_period;
		-- R0 <= R0+ R1 = 4 + 2 = 6
		LI_DI_A_in <= x"0000";
		LI_DI_B_in <= x"0001";
		LI_DI_C_in <= x"0000";
		LI_DI_OP_in <= x"1";
		
		wait for CLK_period;      -- insert stimulus here 
		-- R0 <= R0 * R1 = 6 * 2 = 12
		LI_DI_A_in <= x"0000";
		LI_DI_B_in <= x"0001";
		LI_DI_C_in <= x"0000";
		LI_DI_OP_in <= x"2";
		
      wait for CLK_period;      -- insert stimulus here 
		
		

      wait;
   end process;

END;
