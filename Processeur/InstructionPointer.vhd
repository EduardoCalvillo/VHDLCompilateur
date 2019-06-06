----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:13:10 06/06/2019 
-- Design Name: 
-- Module Name:    InstructionPointer - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity InstructionPointer is
generic(MAX_BITS: Natural:=16; OP_BITS : Natural:=4; MAX_ADDR_MI: Natural:= 16);
--MAX_ADDR_MI: Quantité d'addresses disponibles dans la mémoire d'instructions.
    Port ( CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC; -- Actif à 1.
			  OP : in STD_LOGIC_VECTOR (OP_BITS-1 downto 0);
			  A : in STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           Addr : out  STD_LOGIC_VECTOR (MAX_ADDR_MI-1 downto 0)
			);
end InstructionPointer;

architecture Behavioral of InstructionPointer is
	signal Compteur : STD_LOGIC_VECTOR (MAX_ADDR_MI-1 downto 0) := (others => '0');
begin
	process
		begin
			wait until CLK'event and CLK ='1';
				if RST = '1' then
					Compteur <= (others => '0');
				elsif OP = x"E" then
					Compteur <= A;
				else
					Compteur <= STD_LOGIC_VECTOR(unsigned(Compteur) + x"0001");
				end if;
	end process;
	Addr <= Compteur;
end Behavioral;

