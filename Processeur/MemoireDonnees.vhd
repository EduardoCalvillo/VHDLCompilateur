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
use IEEE.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MemoireDonnees is
generic (MAX_BITS : NATURAL:= 16 ; MAX_ADDR : NATURAL := 4);
    Port ( addr : in  STD_LOGIC_VECTOR (MAX_ADDR-1 downto 0);
           Input : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           RW : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0)
		);
end MemoireDonnees;

architecture Behavioral of MemoireDonnees is
	type Memoire is array (0 to (2**MAX_ADDR)-1) of std_logic_vector (MAX_BITS-1 downto 0);
	signal Mem : Memoire;
begin
process
		begin
			wait until CLK'event and CLK ='1';
			if RST = '1' then -- Est-ce qu'on reset toute la memoire? ou seulement a l'@?
				Mem <= (others => (others => '0'));
			elsif RW = '1' then
				Output <= Mem(to_integer(unsigned(addr)));
			elsif RW = '0' then
				Mem(to_integer(unsigned(addr))) <= Input;
			end if;
	end process;
end Behavioral;

