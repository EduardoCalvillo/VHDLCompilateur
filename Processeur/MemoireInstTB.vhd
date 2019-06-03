--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:41:38 05/29/2019
-- Design Name:   
-- Module Name:   /home/calvillo/Bureau/Compilateur/VHDL/Processeur/MemoireInstTB.vhd
-- Project Name:  Processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MemoireInst
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
 
ENTITY MemoireInstTB IS
END MemoireInstTB;
 
ARCHITECTURE behavior OF MemoireInstTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MemoireInst
    PORT(
         sel : IN  std_logic_vector(15 downto 0);
         q : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal q : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MemoireInst PORT MAP (
          sel => sel,
          q => q
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		sel <= x"0001";
      wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
