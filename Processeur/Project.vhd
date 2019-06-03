----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:35:38 06/03/2019 
-- Design Name: 
-- Module Name:    Project - Behavioral 
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

entity Project is
generic(LEN_SEL: Natural:=16; LEN_INSTR: Natural:=28; MAX_BITS: Natural:=16; OP_BITS : Natural:=4; MAX_ADDR : NATURAL := 8);
    Port ( CLK : in  STD_LOGIC;
           INST_SEL : in  STD_LOGIC_VECTOR (LEN_SEL-1 downto 0);
           BR_RST : in  STD_LOGIC; -- Actif à 0.
           MEM_RST : in  STD_LOGIC -- Actif à 1.
	 );
end Project;

architecture Behavioral of Project is

	component ProcesseurComponent
		Port (
			CLK : in STD_LOGIC;
			dec_A, dec_B, dec_C, data_di : in STD_LOGIC_VECTOR(MAX_BITS-1 downto 0);
			dec_OP : in STD_LOGIC_VECTOR(OP_BITS-1 downto 0);
			BR_Reset : in STD_LOGIC;
			data_do : out STD_LOGIC_VECTOR(MAX_BITS-1 downto 0);
			data_a : out STD_LOGIC_VECTOR(MAX_ADDR-1 downto 0);
			data_we : out STD_LOGIC
		);
	end component;
	
	component MemInstComponent
		Port(
			Addr: in std_logic_vector(LEN_SEL-1 downto 0);
			S: out std_logic_vector(LEN_INSTR-1 downto 0)
		);
	end component;
	
	component DecodeurComponent
		Port ( 
			Ins : in  STD_LOGIC_VECTOR (LEN_INSTR-1 downto 0);
			A : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
			OP : out  STD_LOGIC_VECTOR (OP_BITS-1 downto 0);
			B : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
			C : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0)
		);
	end component;
	
	component MemDonComponent
		Port ( 
			Addr : in  STD_LOGIC_VECTOR (MAX_ADDR-1 downto 0);
			Input : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
			RW : in  STD_LOGIC; -- 0 pour écriture, 1 pour lecture.
			RST : in  STD_LOGIC; -- Actif à 1.
			CLK : in  STD_LOGIC;
			Output : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0)
		);
	end component;
		
	for all : ProcesseurComponent use entity Work.Processeur;
	for all : MemInstComponent use entity Work.MemoireInst;
	for all : DecodeurComponent use entity Work.Decodeur;
	for all : MemDonComponent use entity Work.MemoireDonnees;
	
	type memInst_record is
	record
		ins_a : STD_LOGIC_VECTOR(LEN_INSTR-1 downto 0);
	end record;
	
	type decodeur_record is
	record
		dec_A, dec_B, dec_C : STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
		dec_OP : STD_LOGIC_VECTOR(OP_BITS-1 downto 0);
	end record;
	
	type processeur_record is
	record
		data_do : STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
		data_a : STD_LOGIC_VECTOR (MAX_ADDR-1 downto 0);
		data_we : STD_LOGIC;
	end record;
	
	type memDon_record is
	record
		data_di : STD_LOGIC_VECTOR(MAX_BITS-1 downto 0);
	end record;
	
	-- Representation des signales de sortie de chaque component
	signal memInst_o : memInst_record;
	signal decodeur_o : decodeur_record;
	signal processeur_o : processeur_record;
	signal memDon_o : memDon_record;
	

begin

	Processeur : ProcesseurComponent port map (CLK, decodeur_o.dec_A, decodeur_o.dec_B, decodeur_o.dec_C, memDon_o.data_di, decodeur_o.dec_OP, BR_RST, processeur_o.data_do, processeur_o.data_a, processeur_o.data_we);
	MemoireInstructions : MemInstComponent port map(INST_SEL, memInst_o.ins_a);
	Decodeur : DecodeurComponent port map(memInst_o.ins_a, decodeur_o.dec_A, decodeur_o.dec_OP, decodeur_o.dec_B, decodeur_o.dec_C);
	MemoireDonnees : MemDonComponent port map(processeur_o.data_a, processeur_o.data_do, processeur_o.data_we, MEM_RST, CLK, memDon_o.data_di);

end Behavioral;

