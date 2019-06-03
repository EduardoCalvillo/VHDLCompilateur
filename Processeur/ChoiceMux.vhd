----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:20:34 05/28/2019 
-- Design Name: 
-- Module Name:    ChoiceMux - Behavioral 
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

entity ChoiceMux is
generic(MAX_BITS: Natural:=16; OP_BITS : Natural:=4);
--MAX_BITS: Taille maximale des donnés.
--OP_BITS: Quantité d'opérations possibles.
    Port ( Key : in  STD_LOGIC_VECTOR ((2**OP_BITS)-1 downto 0);
           OP : in  STD_LOGIC_VECTOR (OP_BITS-1 downto 0);
           I0 : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           I1 : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           S : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0)
			 );
end ChoiceMux;

architecture Behavioral of ChoiceMux is

begin
	-- Utilisation de clé pour faire la selection. Chaque bit correspond à une operation en utilisant son position comme valeur d'opération. 
	-- Clé "0011" Signifie que l'opération 0 et 1 utilisent I0 et l'operation 2 et 3 utilisent I1.
	With Key(to_integer(unsigned(OP))) select
		S <= 	I0 when '1',
				I1 when others;
end Behavioral;

