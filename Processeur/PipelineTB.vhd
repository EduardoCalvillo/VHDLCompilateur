--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:13:11 05/10/2019
-- Design Name:   
-- Module Name:   /home/calvillo/Bureau/Compilateur/VHDL/Processeur/PipelineTB.vhd
-- Project Name:  Processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Pipeline
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
 
ENTITY PipelineTB IS
END PipelineTB;
 
ARCHITECTURE behavior OF PipelineTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Pipeline
    PORT(
         Ain : IN  std_logic_vector(15 downto 0);
         Bin : IN  std_logic_vector(15 downto 0);
         Opin : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         Aout : OUT  std_logic_vector(15 downto 0);
         Bout : OUT  std_logic_vector(15 downto 0);
         Opout : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic_vector(15 downto 0) := (others => '0');
   signal Bin : std_logic_vector(15 downto 0) := (others => '0');
   signal Opin : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Aout : std_logic_vector(15 downto 0);
   signal Bout : std_logic_vector(15 downto 0);
   signal Opout : std_logic_vector(3 downto 0);
   signal Cout : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Pipeline PORT MAP (
          Ain => Ain,
          Bin => Bin,
          Opin => Opin,
          Cin => Cin,
          Aout => Aout,
          Bout => Bout,
          Opout => Opout,
          Cout => Cout,
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
		Ain <= x"0001";
		Bin <= x"0002";
		Opin <= x"1";
		Cin <= '0';
      wait for CLK_period*10;
		
      wait for 100 ns;	
		Ain <= x"FFFF";
		Bin <= x"FFFF";
		Opin <= x"3";
		Cin <= '1';
      wait for CLK_period*10;



      -- insert stimulus here 

      wait;
   end process;

END;
