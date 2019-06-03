----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:04:26 05/13/2019 
-- Design Name: 
-- Module Name:    Processeur - Behavioral 
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

entity Processeur is
generic(MAX_BITS: Natural:=16; OP_BITS : Natural:=4; MAX_ADDR_BR : Natural:= 4; MAX_ADDR_MD : NATURAL := 8);
--MAX_BITS: Taille maximale des donnés.
--OP_BITS: Quantité d'opérations possibles.
--MAX_ADDR_MD: Quantité d'addresses disponibles dans la mémoire de données.
--MAX_ADDR_BR: Quantité d'addresses disponibles dans le banc de registres.
	Port (
		CLK : in STD_LOGIC;
		dec_A, dec_B, dec_C, data_di : in STD_LOGIC_VECTOR(MAX_BITS-1 downto 0);
		dec_OP : in STD_LOGIC_VECTOR(OP_BITS-1 downto 0);
		BR_Reset : in STD_LOGIC;
		data_do : out STD_LOGIC_VECTOR(MAX_BITS-1 downto 0);
		data_a : out STD_LOGIC_VECTOR(MAX_ADDR_MD-1 downto 0);
		data_we : out STD_LOGIC
		);
end Processeur;

architecture Behavioral of Processeur is
	
	component BRcomponent
		port (
			CLK : in STD_LOGIC;
			RST : in STD_LOGIC;
			addrA : in STD_LOGIC_VECTOR (MAX_ADDR_BR-1 downto 0); 
			addrB : in STD_LOGIC_VECTOR (MAX_ADDR_BR-1 downto 0);
			addrW : in STD_LOGIC_VECTOR (MAX_ADDR_BR-1 downto 0);
			W : in STD_LOGIC;
			DATA : in STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
			QA : out STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
			QB : out STD_LOGIC_VECTOR (MAX_BITS-1 downto 0)
		);
	end component;
	
	component ALUcomponent
		port (
			A : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
			B : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
			S : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
			OP : in  STD_LOGIC_VECTOR (OP_BITS-1 downto 0);
			N : out  STD_LOGIC;
			O : out  STD_LOGIC;
			C : out  STD_LOGIC;
			Z : out  STD_LOGIC
		);
	end component;
	
	component PL
		port (
			Ain : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
			Bin : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
			Opin : in  STD_LOGIC_VECTOR (OP_BITS-1 downto 0);
			Cin : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
			Aout : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
			Bout : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
			Opout : out  STD_LOGIC_VECTOR (OP_BITS-1 downto 0);
			Cout : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
			CLK : in  STD_LOGIC
		);
	end component;
		
	component MULcomponent
		port (
			Key : in STD_LOGIC_VECTOR((2**OP_BITS)-1 downto 0);
			OP : in  STD_LOGIC_VECTOR (OP_BITS-1 downto 0);
           I0 : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           I1 : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           S : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0)
		);
	end component;
	
	for all : BRcomponent use entity Work.BancRegistres;
	for all : ALUcomponent use entity Work.ALU;
	for all : PL use entity Work.Pipeline;
	for all: MULcomponent use entity Work.ChoiceMux;
	
	type Pipeline_record is 
	record
		op : std_logic_vector(OP_BITS-1 downto 0);
		a,b,c : std_logic_vector(MAX_BITS-1 downto 0);
	end record;
	
	type ALU_record is 
	record
		A,B,S : STD_LOGIC_VECTOR(MAX_BITS-1 downto 0);
		OP : STD_LOGIC_VECTOR(OP_BITS-1 downto 0);
		N,O,C,Z : STD_LOGIC;
	end record;
	
	type BR_record is
	record
		RST, W : STD_LOGIC;
		addrA, addrB, addrW : STD_LOGIC_VECTOR(MAX_ADDR_BR-1 downto 0);
		DATA, QA, QB : STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
	end record;
	
	type mul_record is
	record
		SRegs : STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
		SAlu : STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
		SMem : STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
		SStore : STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
	end record;
	
	-- Clés pour Multiplexeurs
	signal KeysRegistres : STD_LOGIC_VECTOR ((2**OP_BITS)-1 downto 0) := x"C0C0";
	signal KeysALU : STD_LOGIC_VECTOR ((2**OP_BITS)-1 downto 0) := x"C1E1";
	signal KeysStore : STD_LOGIC_VECTOR ((2**OP_BITS)-1 downto 0) := x"0100";
	signal KeysLoad : STD_LOGIC_VECTOR ((2**OP_BITS)-1 downto 0) := x"FF7F";
	
	
	-- Banc Registres
	signal BR : BR_record; 
	-- ALU
	signal ALU : ALU_record;
	-- Pipelines
	signal LI_DI_in, LI_DI_EX : Pipeline_record;
	signal DI_EX_Mem : Pipeline_record;
	signal EX_Mem_RE : Pipeline_record;
	signal Mem_RE_out : Pipeline_record;
	signal MUL : Mul_record;
	
begin
	
	LI_DI : PL port map(dec_A, dec_B, dec_OP, dec_C, LI_DI_EX.A, LI_DI_EX.B, LI_DI_EX.OP, LI_DI_EX.C, CLK);
	
	BancRegistres : BRcomponent port map(CLK, BR_Reset, LI_DI_EX.B(MAX_ADDR_BR-1 downto 0), LI_DI_EX.C (MAX_ADDR_BR-1 downto 0), Mem_RE_out.A(MAX_ADDR_BR-1 downto 0), BR.W, Mul.SMem, BR.QA, BR.QB);
	
	Muliplexeur_registre : MULcomponent port map(keysRegistres, LI_DI_EX.OP, LI_DI_EX.B, BR.QA, Mul.SRegs);
	
	DI_EX : PL port map(LI_DI_EX.A, Mul.SRegs, LI_DI_EX.OP, BR.QB, DI_EX_Mem.A, DI_EX_Mem.B, DI_EX_Mem.OP, DI_EX_Mem.C, CLK);
	
	ALUnit : ALUcomponent port map(DI_EX_MEM.B, DI_EX_MEM.C, ALU.S, DI_EX_MEM.OP, ALU.N, ALU.O, ALU.C, ALU.Z);
	
	Muliplexeur_alu : MULcomponent port map(keysALU, DI_EX_MEM.OP, DI_EX_MEM.B, ALU.S, Mul.SAlu);
	
	EX_Mem : PL port map(DI_EX_Mem.A, Mul.SAlu, DI_EX_Mem.OP, DI_EX_Mem.C, EX_Mem_RE.A, EX_Mem_RE.B, EX_Mem_RE.OP, EX_Mem_RE.C, CLK);
	
	Muliplexeur_store : MULcomponent port map(keysStore, EX_Mem_RE.OP, EX_Mem_RE.A, EX_Mem_RE.B, Mul.SStore);
	
	Mem_RE : PL port map(EX_Mem_RE.A, EX_Mem_RE.B, EX_Mem_RE.OP, EX_Mem_RE.C, Mem_RE_out.A, Mem_RE_out.B, Mem_RE_out.OP, Mem_RE_out.C, CLK);
	
	Muliplexeur_memoire : MULcomponent port map(keysLoad, Mem_RE_out.OP, Mem_RE_out.B, data_di, Mul.SMem);
	
	-- Control logique pour écriture dans la mémoire de données. 
	data_we <= '0' when Ex_Mem_RE.OP = x"8" else
				'1';
				
	-- Control logique pour écriture dans le banc de registres.
	BR.W <= 	'0' when Mem_RE_out.OP=x"8" else
				'0' when Mem_RE_out.OP=x"E" else
				'0' when Mem_RE_out.OP=x"F" else
				'0' when Mem_RE_out.OP=x"0" else
				'1';
				
	data_a <= Mul.SStore(MAX_ADDR_MD-1 downto 0);
	
	data_do <= Ex_Mem_RE.B;
	
end Behavioral;

