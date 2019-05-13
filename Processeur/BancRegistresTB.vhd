--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:22:07 05/13/2019
-- Design Name:   
-- Module Name:   /home/calvillo/Bureau/Compilateur/VHDL/Processeur/BancRegistresTB.vhd
-- Project Name:  Processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BancRegistres
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
 
ENTITY BancRegistresTB IS
END BancRegistresTB;
 
ARCHITECTURE behavior OF BancRegistresTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BancRegistres
    PORT(
         CLK : IN  std_logic;
         addrA : IN  std_logic_vector(3 downto 0);
         addrB : IN  std_logic_vector(3 downto 0);
         addrW : IN  std_logic_vector(3 downto 0);
         W : IN  std_logic;
         DATA : IN  std_logic_vector(7 downto 0);
         RST : IN  std_logic;
         QA : OUT  std_logic_vector(7 downto 0);
         QB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal addrA : std_logic_vector(3 downto 0) := (others => '0');
   signal addrB : std_logic_vector(3 downto 0) := (others => '0');
   signal addrW : std_logic_vector(3 downto 0) := (others => '0');
   signal W : std_logic := '0';
   signal DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal RST : std_logic := '0';

 	--Outputs
   signal QA : std_logic_vector(7 downto 0);
   signal QB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BancRegistres PORT MAP (
          CLK => CLK,
          addrA => addrA,
          addrB => addrB,
          addrW => addrW,
          W => W,
          DATA => DATA,
          RST => RST,
          QA => QA,
          QB => QB
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
		RST <= '1';
      wait for CLK_period*10;
		RST <= '0';
		addrA <= x"0";
		addrB <= x"1";
      wait for CLK_period*10;
		W <= '1';
		addrW <= x"0";
		DATA <= x"09";
      wait for CLK_period*10;
		W<= '1';
		addrW <= x"1";	
		DATA <= x"4B";
      wait for CLK_period*10;
		W<= '0';
      wait for CLK_period*10;
		W<= '1';
		addrW <= x"0";
		DATA <= x"05";
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
