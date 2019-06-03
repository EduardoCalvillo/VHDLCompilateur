----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:27:50 05/14/2019 
-- Design Name: 
-- Module Name:    MemoireDonnees - Behavioral 
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
use IEEE.MATH_REAL.all;
use IEEE.NUMERIC_STD.ALL;

entity MemoireDonnees is
generic (MAX_BITS : NATURAL:= 16 ; MAX_ADDR_MD : NATURAL := 8);
--MAX_BITS: Taille maximale des donnés.
--MAX_ADDR_MD: Quantité d'addresses disponibles dans la mémoire de données.
    Port ( Addr : in  STD_LOGIC_VECTOR (MAX_ADDR_MD-1 downto 0);
           Input : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           RW : in  STD_LOGIC; -- 0 pour écriture, 1 pour lecture.
           RST : in  STD_LOGIC; -- Actif à 1.
           CLK : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0)
		);
end MemoireDonnees;

architecture Behavioral of MemoireDonnees is
	type Memoire is array (0 to (2**MAX_ADDR_MD)-1) of std_logic_vector (MAX_BITS-1 downto 0);
	signal Mem : Memoire;
begin
	process
		begin
			wait until CLK'event and CLK ='1';
			if RST = '1' then
				Mem <= (others => (others => '0'));
			elsif RW = '1' then
				Output <= Mem(to_integer(unsigned(Addr)));
			elsif RW = '0' then
				Mem(to_integer(unsigned(Addr))) <= Input;
			end if;
	end process;
end Behavioral;

