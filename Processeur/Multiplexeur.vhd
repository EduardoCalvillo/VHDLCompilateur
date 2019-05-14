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
    Port ( Cle : in STD_LOGIC_VECTOR (2**OP_BITS);
				Sel : in  STD_LOGIC_VECTOR (OP_BITS-1 downto 0);
           I0 : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           I1 : in  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0);
           S : out  STD_LOGIC_VECTOR (MAX_BITS-1 downto 0));
end Multiplexeur;

-- diff 0
-- add 1
-- mul 2
-- sou 3
-- div 4
-- cop 5
-- afc 6 *
-- load 7 *
-- store 8 @
-- equal 9 
-- inf 10
-- infegal 11
-- sup 12 
-- supegal 13
-- jmp 14 * @
-- jmpc 15 * @

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
	
	-- Ameliorer le code, et penser aux clés suivantes pour les mux's et bien initializer les muxseux
	Cle <= "0000011000000011";
	With Donnee(to_integer(unsigned(OP))) select
		S <= 	I0 when '1',
				I1 when others;
end Behavioral;

