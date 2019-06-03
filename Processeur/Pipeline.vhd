----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:08:51 05/10/2019 
-- Design Name: 
-- Module Name:    Pipeline - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Pipeline is
generic(MAX_BITS: Natural :=16; OP_BITS: Natural:= 4);
--MAX_BITS: Taille maximale des donnés.
--OP_BITS: Quantité d'opérations possibles.
    Port ( Ain : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           Bin : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           Opin : in  STD_LOGIC_VECTOR (OP_BITS-1 downto 0);
           Cin : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           Aout : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           Bout : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           Opout : out  STD_LOGIC_VECTOR (OP_BITS-1 downto 0);
           Cout : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           CLK : in  STD_LOGIC);
end Pipeline;

architecture Behavioral of Pipeline is

begin
	process 
		begin
			wait until CLK'event and CLK ='1';
			Aout <= Ain;
			Bout <= Bin;
			Opout <= Opin;
			Cout <= Cin;
		end process;
end Behavioral;

