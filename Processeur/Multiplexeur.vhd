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
use IEEE.math_real.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplexeur is
generic(MAX_BITS: Natural:=16; OP_BITS : Natural:=4);
    Port ( Cle : in STD_LOGIC_VECTOR ((2**OP_BITS)-1 downto 0);
				Sel : in  STD_LOGIC_VECTOR (OP_BITS-1 downto 0);
           I0 : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           I1 : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           S : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0));
end Multiplexeur;

-- diff (changé par NOP) 0 // On devrá oublier le diff. C'est pas demandé dans le pdf et on a besoin du NOP.
-- add 1
-- mul 2
-- sou 3
-- div 4 // not yet
-- cop 5
-- afc 6 *
-- load 7 *
-- store 8 @
-- equal 9 // not yet
-- inf 10 // not yet
-- infegal 11 // not yet
-- sup 12 // not yet
-- supegal 13 // not yet
-- jmp 14 * @ // not yet
-- jmpc 15 * @ // not yet

architecture Behavioral of Multiplexeur is

begin
-- Traiter chaque possibilité
	with Sel select
	--I0 = B !!! I1 = QA  S => B
		S <=  I0 when x"6",
		I0 when x"7",
		I0 when x"E",
		I0 when x"F",
		I1 when others;
end Behavioral;

