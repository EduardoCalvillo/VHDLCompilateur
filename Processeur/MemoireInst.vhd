library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.common.all;


entity MemoireInst is
generic(MAX_ADDR_MI: Natural:= 16; LEN_INSTR: Natural:= 28);
--MAX_ADDR_MI: Quantité d'addresses disponibles dans la mémoire d'instructions.
--LEN_INSTR: Longeur d'une instruction. 4 bits code opération + (8 bits pour un paramètre)*3
	port(
		Addr: in std_logic_vector(MAX_ADDR_MI-1 downto 0);
		S: out std_logic_vector(LEN_INSTR-1 downto 0)
	);
end entity;


architecture Behavioral of MemoireInst is

	--signal instr_memory: instrArray := init_rom(filename => "asmFile.asm");

	signal instr_memory: instrArray := (
--		X => x"OP(1),A(2),B(2),C(2)"
		1 => x"6000002", --(6) AFC Oui
		2 => x"6010005", 
--		2 => x"0020102", 
--		4 => x"6020001", 
--		3 => x"8000102",
--		5 => x"1010101", 
--		6 => x"1020001", --(1) ADD Oui
--		7 => x"2020001", --(2) MUL Oui
--		8 => x"3020001", --(3) SOU Oui
--		9 => x"4020001", --(4) DIV Oui. Division /0 égal a MAX_SIGNED_INT (x"7FFF" ou "0111111111111111". Division imparfaite réduit vers le bas (3/2 = 1)
--		6 => x"5000101", --(5) COP Oui
--		9 => x"8010100", --(8) STORE Oui
--		10 => x"7020100", --(7) LOAD Oui
--		9 => x"9020001", --(9) EGAL Oui
--		9 => x"A020001", --(10) INF Oui
--		9 => x"B020001", --(11) INFE Oui
--		9 => x"C020001", --(12) SUP Oui
--		9 => x"D020001", --(13) SUPE Oui
--		10 => x"E020001", --(14) JMP ?
--		10 => x"F020001", --(15) JMPC ?
		others => x"FFFFFFF"
	);

begin

	S <= instr_memory(to_integer(unsigned(Addr)));

end architecture;
