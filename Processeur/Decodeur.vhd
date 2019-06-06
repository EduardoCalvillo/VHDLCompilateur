----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:31:00 05/29/2019 
-- Design Name: 
-- Module Name:    Decodeur - Behavioral 
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

entity Decodeur is
generic(MAX_BITS: Natural:= 16; OP_BITS : Natural:= 4; MAX_ADDR_MI: Natural:= 16; LEN_INSTR: Natural:= 28);
--MAX_BITS: Taille maximale des donnés.
--OP_BITS: Quantité d'opérations possibles.
--MAX_ADDR_MI: Quantité d'addresses disponibles dans la mémoire d'instructions.
--LEN_INSTR: Longeur d'une instruction. 4 bits code opération + (8 bits pour un paramètre)*3
    Port ( Ins : in  STD_LOGIC_VECTOR (LEN_INSTR-1 downto 0);
           A : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           OP : out  STD_LOGIC_VECTOR (OP_BITS-1 downto 0);
           B : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           C : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0));
end Decodeur;

architecture Behavioral of Decodeur is
	alias CodeOP : STD_LOGIC_VECTOR(OP_BITS-1 downto 0) is Ins(LEN_INSTR-1 downto (LEN_INSTR-OP_BITS));
begin
	A <= x"0000" when Ins = x"0000000" or CodeOP = x"F" else --NOP
		x"00"&Ins(23 downto 16) when CodeOP = x"8" else --Addresse MemDon (STORE)
		Ins(23 downto 8) when CodeOP = x"E" else --Addresse MemIns (JMP)
		x"000"&Ins(19 downto 16); --Registre
		
	OP <= x"0" when Ins = x"0000000" or CodeOP = x"F" else --NOP
		CodeOP;
		
	B <= x"0000" when Ins = x"0000000" or CodeOP = x"E" or CodeOP = x"F" else --NOP
		Ins(15 downto 0) when CodeOP = x"6" else --Donée (AFC)
		x"00"&Ins(15 downto 8) when CodeOP = x"7" else--Addresse MemDon (LOAD)
		x"000"&Ins(11 downto 8); --Registre
		
	C <= x"0000" when Ins = x"0000000" or CodeOP = x"5" or CodeOP = x"6" or CodeOP = x"7" or CodeOP = x"8" or CodeOP = x"E" or CodeOP = x"F" else --Paramètre non utilisé
		x"000"&Ins(3 downto 0); --Registre
				
end Behavioral;

