----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:15:31 05/13/2019 
-- Design Name: 
-- Module Name:    BancRegistres - Behavioral 
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

entity BancRegistres is
generic(MAX_BITS: Natural:=16; MAX_ADDR_BR : Natural:= 4);
--MAX_BITS: Taille maximale des donnés.
--MAX_ADDR_BR: Quantité d'addresses disponibles dans le banc de registres.
    Port (	
	 CLK : in STD_LOGIC;
	 RST : in STD_LOGIC; -- Actif à 0.
	 addrA : in STD_LOGIC_VECTOR (MAX_ADDR_BR-1 downto 0); 
	 addrB : in STD_LOGIC_VECTOR (MAX_ADDR_BR-1 downto 0);
	 addrW : in STD_LOGIC_VECTOR (MAX_ADDR_BR-1 downto 0);
	 W : in STD_LOGIC; --Écriture en 1, Lecture en 0.
	 DATA : in STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
	 QA : out STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
	 QB : out STD_LOGIC_VECTOR (MAX_BITS-1 downto 0)
	 );
end BancRegistres;

architecture Behavioral of BancRegistres is

	type bancRegs is array (0 to (2**MAX_ADDR_BR)-1) of std_logic_vector (MAX_BITS-1 downto 0);
	signal registers: bancRegs;
	
begin
	-- Que la lecture est faite en asynchrone.
	process
		begin
			wait until CLK'event and CLK ='1';
			if RST = '0' then
				registers <= (others => (others => '0'));
			elsif W = '1' then
				registers (to_integer(unsigned(addrW))) <= DATA;
			end if;
	end process;
	-- Bypass.
		QA <= DATA when (addrW = addrA and W = '1') else registers(to_integer(unsigned(addrA))); 
		QB <= DATA when (addrW = addrB and W = '1') else registers(to_integer(unsigned(addrB)));
end Behavioral;

