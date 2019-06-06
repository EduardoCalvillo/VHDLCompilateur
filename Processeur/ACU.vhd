----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:34:32 05/07/2019 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
generic(MAX_BITS: Natural :=16; OP_BITS: Natural:= 4);
--MAX_BITS: Taille maximale des donnés.
--OP_BITS: Quantité d'opérations possibles.
	Port ( A : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           B : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           S : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           OP : in  STD_LOGIC_VECTOR (OP_BITS-1 downto 0);
           N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           C : out  STD_LOGIC;
           Z : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
	signal Stmp : STD_LOGIC_VECTOR (MAX_BITS*2-1 downto 0);
begin
	Stmp <= 	-- Traitement des opérations arithmethiques.
				std_logic_vector(unsigned(x"0000"&A) + unsigned(x"0000"&B)) when OP = x"1" else
				std_logic_vector(unsigned(x"0000"&A) - unsigned(x"0000"&B)) when OP = x"3" else 
				std_logic_vector(unsigned(A) * unsigned(B)) when OP = x"2" else
				-- Vérification de division par 0.
				std_logic_vector(unsigned(x"0000"&A) / unsigned(x"0000"&B)) when OP = x"4" and B /= x"0000" else
				x"7FFF7FFF" when OP = x"4" and B = x"0000" else
				-- Traitement des calculs logiques.
				(0 => '1', others => '0') when OP = x"9" and A = B else
				(0 => '1', others => '0') when OP = x"A" and signed(A) < signed(B) else
				(0 => '1', others => '0') when OP = x"B" and signed(A) <= signed(B) else
				(0 => '1', others => '0') when OP = x"C" and signed(A) > signed(B) else
				(0 => '1', others => '0') when OP = x"D" and signed(A) >= signed(B) else
				(others => '0');
				
	C <= Stmp (MAX_BITS) when OP = x"1" else '0';
			
			-- Overflow dans le signe en cas d'addition
	O <=	'1' when OP = x"1" and A(MAX_BITS-1) = '0' and B(MAX_BITS-1) = '0' and Stmp(MAX_BITS-1) = '1' else
			'1' when OP = x"1" and A(MAX_BITS-1) = '1' and B(MAX_BITS-1) = '1' and Stmp(MAX_BITS-1) = '0' else
			-- Overflow dans le signe en cas de multiplication et division
			'1' when (OP = x"2" or OP = x"4") and A(MAX_BITS-1) = '0' and B(MAX_BITS-1) = '0' and Stmp(MAX_BITS-1) = '1' else
			'1' when (OP = x"2" or OP = x"4") and A(MAX_BITS-1) = '0' and B(MAX_BITS-1) = '1' and Stmp(MAX_BITS-1) = '0' else
			'1' when (OP = x"2" or OP = x"4") and A(MAX_BITS-1) = '1' and B(MAX_BITS-1) = '0' and Stmp(MAX_BITS-1) = '0' else
			'1' when (OP = x"2" or OP = x"4") and A(MAX_BITS-1) = '1' and B(MAX_BITS-1) = '1' and Stmp(MAX_BITS-1) = '1' else
			-- Overflow dans le signe en cas de soustraction
			'1' when OP = x"3" and A(MAX_BITS-1) = '0' and B(MAX_BITS-1) = '1' and Stmp(MAX_BITS-1) = '1' else
			'1' when OP = x"3" and A(MAX_BITS-1) = '1' and B(MAX_BITS-1) = '0' and Stmp(MAX_BITS-1) = '0' else
			'0';		
		
		
	Z <= '1' when Stmp = x"00000000" else '0';
	
	N <= Stmp(MAX_BITS-1);
	
	S <= Stmp (MAX_BITS-1 downto 0);

end Behavioral;

