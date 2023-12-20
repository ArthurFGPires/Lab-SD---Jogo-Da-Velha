library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity Bcd is
	Port ( 
		entrada : in STD_LOGIC_VECTOR (3 downto 0);
		saida : out STD_LOGIC_VECTOR (6 downto 0)
	);
end Bcd;
 
architecture Behavioral of Bcd is
 
begin
 
process(entrada)
begin
	
	-- Vetor GFEDCBA
	
	case entrada is
		when "0000" =>
			saida <= "1000000"; ---0
		when "0001" =>
			saida <= "1111001"; ---1
		when "0010" =>
			saida <= "0100100"; ---2
		when "0011" =>
			saida <= "0110000"; ---3
		when "0100" =>
			saida <= "0011001"; ---4
		when "0101" =>
			saida <= "0010010"; ---5
		when "0110" =>
			saida <= "0000010"; ---6
		when "0111" =>
			saida <= "1111000"; ---7
		when "1000" =>
			saida <= "0000000"; ---8
		when "1001" =>
			saida <= "0010000"; ---9
		when others =>
			saida <= "1111111"; ---null
	end case;
 
end process;
 
end Behavioral;
