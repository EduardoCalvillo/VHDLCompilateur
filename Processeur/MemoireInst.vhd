library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.common.all;


entity MemoireInst is
generic(MAX_ADDR_MI: Natural:= 16; LEN_INSTR: Natural:= 28);
--MAX_ADDR_MI: Quantité d'addresses disponibles dans la mémoire d'instructions.
--LEN_INSTR: Longeur d'une instruction. 4 bits code opération + (8 bits pour un paramètre)*3
-- Format d'une instruction: 
--  			OP  A   B   C
--	0010203:	0   01  02  03
	port(
		Addr: in std_logic_vector(MAX_ADDR_MI-1 downto 0);
		S: out std_logic_vector(LEN_INSTR-1 downto 0)
	);
end entity;


architecture Behavioral of MemoireInst is

--	signal instr_memory: instrArray := init_rom(filename => "asmFileTest.asm");

	signal instr_memory: instrArray := (
		1 => x"600000A",
		2 => x"6010005", 
		7 => x"9020001", --(9) EGAL 
		8 => x"A030001", --(10) INF 
		9 => x"B040001", --(11) INFE 
		10 => x"C050001", --(12) SUP 
		11 => x"D060001", --(13) SUPE 
		others => x"0000000"
	);

begin

	S <= instr_memory(to_integer(unsigned(Addr)));

end architecture;
