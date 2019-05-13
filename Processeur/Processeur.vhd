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



-- !!!! Trouver la bonne facon de faire l'include des components

use Processeur.ALU;
use Processeur.BancRegistres;
use Processeur.Pipeline;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Processeur is
end Processeur;

architecture Behavioral of Processeur is

	component BR
		port (
			CLK : in STD_LOGIC;
			RST : in STD_LOGIC;
			addrA : in STD_LOGIC_VECTOR (3 downto 0); 
			addrB : in STD_LOGIC_VECTOR (3 downto 0);
			addrW : in STD_LOGIC_VECTOR (3 downto 0);
			W : in STD_LOGIC;
			DATA : in STD_LOGIC_VECTOR (7 downto 0);
			QA : out STD_LOGIC_VECTOR (7 downto 0);
			QB : out STD_LOGIC_VECTOR (7 downto 0)
		);
	end component;
	
	component ALU
		port (
			A : in  STD_LOGIC_VECTOR (15 downto 0);
			B : in  STD_LOGIC_VECTOR (15 downto 0);
			S : out  STD_LOGIC_VECTOR (15 downto 0);
			OP : in  STD_LOGIC_VECTOR (3 downto 0);
			N : out  STD_LOGIC;
			O : out  STD_LOGIC;
			C : out  STD_LOGIC;
			Z : out  STD_LOGIC
		);
	end component;
	
	component PL
		port (
			Ain : in  STD_LOGIC_VECTOR (15 downto 0);
			Bin : in  STD_LOGIC_VECTOR (15 downto 0);
			Opin : in  STD_LOGIC_VECTOR (3 downto 0);
			Cin : in  STD_LOGIC;
			Aout : out  STD_LOGIC_VECTOR (15 downto 0);
			Bout : out  STD_LOGIC_VECTOR (15 downto 0);
			Opout : out  STD_LOGIC_VECTOR (3 downto 0);
			Cout : out  STD_LOGIC;
			CLK : in  STD_LOGIC
		);
	end component;
	
	for all : BR use entity Processeur.BancRegistres;
	for all : ALU use entity Processeur.ALU;
	for all : PL use entity Processeur.Pipeline;
	
	type record_stage is record
		signal op : std_logic_vector(3 downto 0);
		signal a,b,c : std_logic_vector(15 downto 0);
	end type
	
	signal LI/DI_in, LI/DI_out : record_stage;
	--Apres on peut acceder aux donnés en utilisant LI/DI_in.a,LI/DI_in.b,LI/DI_in.c,LI/DI_in.op etc.
	--Continuer de cette facon et oublier tout en dessous
	
	signal LI/DI_A_in, LI/DI_A_out : STD_LOGIC_VECTOR(15 downto 0);
	signal LI/DI_OP_in, LI/DI_OP_out : STD_LOGIC_VECTOR(7 downto 0);
	signal LI/DI_B_in, LI/DI_B_out : STD_LOGIC_VECTOR(15 downto 0);
	signal LI/DI_C_in, LI/DI_C_out : STD_LOGIC_VECTOR(15 downto 0);
	signal DI/EX_A_in, DI/EX_A_out : STD_LOGIC_VECTOR(15 downto 0);
	signal DI/EX_OP_in, DI/EX_OP_out : STD_LOGIC_VECTOR(7 downto 0);
	signal DI/EX_B_in, DI/EX_B_out : STD_LOGIC_VECTOR(15 downto 0);
	signal DI/EX_C_in, DI/EX_C_out : STD_LOGIC_VECTOR(15 downto 0);
	signal EX/Mem_A_in, EX/Mem_A_out : STD_LOGIC_VECTOR(15 downto 0);
	signal EX/Mem_OP_in, EX/Mem_OP_out : STD_LOGIC_VECTOR(7 downto 0);
	signal EX/Mem_B_in, EX/Mem_B_out : STD_LOGIC_VECTOR(15 downto 0);
	signal EX/Mem_C_in, EX/Mem_C_out : STD_LOGIC_VECTOR(15 downto 0);
	signal Mem/RE_A_in, Mem/RE_A_out : STD_LOGIC_VECTOR(15 downto 0);
	signal Mem/RE_OP_in, Mem/RE_OP_out : STD_LOGIC_VECTOR(7 downto 0);
	signal Mem/RE_B_in, Mem/RE_B_out : STD_LOGIC_VECTOR(15 downto 0);
	signal Mem/RE_C_in, Mem/RE_C_out : STD_LOGIC_VECTOR(15 downto 0);
	
begin

	-- Finir l'instantiation
	BR : BR port map();
	ALU : ALU port map();
	LI/DI : PL port map();
	DI/EX : PL port map();
	EX/Mem : PL port map();
	Mem/RE : PL port map();
	
end Behavioral;

