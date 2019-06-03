--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:58:29 05/29/2019
-- Design Name:   
-- Module Name:   /home/calvillo/Bureau/Compilateur/VHDL/Processeur/help.vhd
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
 
ENTITY help IS
END help;
 
ARCHITECTURE behavior OF help IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Processeur
    PORT(
         CLK : IN  std_logic;
         Processeur_in : IN  std_logic_vector(15 downto 0);
         data_mem_in : IN  std_logic_vector(15 downto 0);
         BR_Reset : IN  std_logic;
         data_mem_out : OUT  std_logic_vector(15 downto 0);
         data_mem_addr : OUT  std_logic_vector(7 downto 0);
         data_mem_RW : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal Processeur_in : std_logic_vector(15 downto 0) := (others => '0');
   signal data_mem_in : std_logic_vector(15 downto 0) := (others => '0');
   signal BR_Reset : std_logic := '1';

 	--Outputs
   signal data_mem_out : std_logic_vector(15 downto 0);
   signal data_mem_addr : std_logic_vector(7 downto 0);
   signal data_mem_RW : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Processeur PORT MAP (
          CLK => CLK,
          Processeur_in => Processeur_in,
          data_mem_in => data_mem_in,
          BR_Reset => BR_Reset,
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
		BR_Reset <= '0';
      wait for 100 ns;	
		BR_Reset <= '1';
		Processeur_in <= x"0000";
      wait for CLK_period;
		Processeur_in <= x"0001";
      wait for CLK_period;
		Processeur_in <= x"0002";
      wait for CLK_period;
		Processeur_in <= x"0003";
      wait for CLK_period;
		Processeur_in <= x"0004";
      wait for CLK_period;
		Processeur_in <= x"0005";
      wait for CLK_period;
		Processeur_in <= x"0006";
      wait for CLK_period;
		Processeur_in <= x"0007";
      wait for CLK_period;
		Processeur_in <= x"0008";
      wait for CLK_period;
		Processeur_in <= x"0009";
      wait for CLK_period;
		Processeur_in <= x"000A";

      -- insert stimulus here 

      wait;
   end process;

END;
