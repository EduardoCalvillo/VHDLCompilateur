--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:07:05 05/07/2019
-- Design Name:   
-- Module Name:   /home/calvillo/Bureau/Compilateur/VHDL/Processeur/ALU_TB.vhd
-- Project Name:  Processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_TB IS
END ALU_TB;
 
ARCHITECTURE behavior OF ALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         S : OUT  std_logic_vector(15 downto 0);
         OP : IN  std_logic_vector(3 downto 0);
         N : OUT  std_logic;
         O : OUT  std_logic;
         C : OUT  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal OP : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(15 downto 0);
   signal N : std_logic;
   signal O : std_logic;
   signal C : std_logic;
   signal Z : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          S => S,
          OP => OP,
          N => N,
          O => O,
          C => C,
          Z => Z
        );

   -- Clock process definitions
 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		A <= "1111111111111111";
		B <= x"0001";
		OP <= x"1";
      wait for 100 ns;
		
		A <= x"0001";
		B <= x"0004";
		OP <= x"2";
      wait for 100 ns;
		
		B <= x"0001";
		A <= x"0004";
		OP <= x"2";
      wait for 100 ns;
		
		A <= x"EFFF";
		B <= x"0004";
		OP <= x"3";
		wait for 100 ns;
		
		A <= x"0004";
		B <= x"0004";
		OP <= x"2";
      wait for 100 ns;
		
		A <= "0111111111111111";
		B <= x"0001";
		OP <= x"1";
      wait for 100 ns;
		
		A <= "1111111111111111";
		B <= "1000000000000001";
		OP <= x"1";
      wait for 100 ns;
		
		A <= x"7FFF";
		B <= x"FFFE";
		OP <= x"2";
      wait for 100 ns;
		
		B <= x"7FFF";
		A <= x"FFFE";
		OP <= x"2";
      wait for 100 ns;
		
		
      -- insert stimulus here 

      wait;
   end process;

END;
