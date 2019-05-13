----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:15:31 05/13/2019 
-- Design Name: 
-- Module Name:    BancRegistres - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BancRegistres is
    Port (	
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
end BancRegistres;

architecture Behavioral of BancRegistres is

	type bancRegs is array (0 to 15) of std_logic_vector (7 downto 0);
	signal registers: bancRegs;
	
begin
	process
		begin
			wait until CLK'event and CLK ='1';
			if RST = '1' then
				registers <= (others => (others => '0'));
			elsif W = '1' then
				registers (to_integer(unsigned(addrW))) <= DATA;
			end if;
	end process;
	-- Bypass
		QA <= DATA when (addrW = addrA) else registers(to_integer(unsigned(addrA))); 
		QB <= DATA when (addrW = addrB) else registers(to_integer(unsigned(addrB)));
end Behavioral;

