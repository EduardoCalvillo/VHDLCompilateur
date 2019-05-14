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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity ALU is

	generic(MAX_BITS: Natural :=16; OP_BITS: Natural:= 4);
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
	Stmp <= 	std_logic_vector(unsigned(x"0000"&A) + unsigned(x"0000"&B)) when OP = x"1" else
				std_logic_vector(unsigned(x"0000"&A) - unsigned(x"0000"&B)) when OP = x"3" else 
				std_logic_vector(unsigned(A) * unsigned(B)) when OP = x"2" else
				std_logic_vector(unsigned(x"0000"&A) / unsigned(x"0000"&B)) when OP = x"4" else
				(others => '0');
	C <= Stmp (MAX_BITS) when OP = x"1" else '0';
	O <= Stmp (MAX_BITS) when OP = x"3" and not(Stmp((MAX_BITS*2)-1 downto MAX_BITS) = x"0000") and not(Stmp((MAX_BITS*2)-1 downto MAX_BITS) = x"FFFF")  else 
				'1' when OP = x"1" and A(MAX_BITS-1) = '0' and B(MAX_BITS-1) = '0' and Stmp(MAX_BITS-1) = '1' else
				'1' when OP = x"1" and A(MAX_BITS-1) = '1' and B(MAX_BITS-1) = '1' and Stmp(MAX_BITS-1) = '0' else
				'1' when OP = x"2" and A(MAX_BITS-1) = '0' and B(MAX_BITS-1) = '1' and Stmp(MAX_BITS-1) = '1' else
				'1' when OP = x"2" and A(MAX_BITS-1) = '1' and B(MAX_BITS-1) = '0' and Stmp(MAX_BITS-1) = '0' else
				'0';	
	Z <= '1' when Stmp = x"00000000" else '0';
	N <= Stmp(MAX_BITS-1);
	S <= Stmp (MAX_BITS-1 downto 0);

end Behavioral;

