----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:19:49 05/13/2019 
-- Design Name: 
-- Module Name:    Multiplexeur - Behavioral 
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

entity Multiplexeur is
    Port ( Sel : in  STD_LOGIC_VECTOR (3 downto 0);
           I0 : in  STD_LOGIC_VECTOR (15 downto 0);
           I1 : in  STD_LOGIC_VECTOR (15 downto 0);
           S : out  STD_LOGIC_VECTOR (15 downto 0));
end Multiplexeur;

architecture Behavioral of Multiplexeur is

begin
-- Traiter chaque possibilité
	with to_integer(unsigned(Sel)) select
		S <=  I0 when 0,
		I1 when 1,
		I1 when 2,
		I1 when 3,
		I1 when 4,
		I1 when 5,
		I1 when 6,
		I1 when 7;
	
end Behavioral;

