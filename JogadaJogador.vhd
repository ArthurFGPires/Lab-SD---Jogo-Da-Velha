library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity JogadaJogador is
    port (
        tabuleiro_jogador 		: in std_logic_vector(8 downto 0);
		  tabuleiro_computador 	: in std_logic_vector(8 downto 0);
		  
        entrada_jogada 		: in std_logic_vector(3 downto 0); 	
        computar_jogada 	: in std_logic; 							
        vez						: in std_logic_vector(1 downto 0);
		  clock 					: in std_logic;
        
		  saida_jogada 			: out std_logic_vector(3 downto 0);
		  insira_jogada 			: out std_logic						  
    );
end entity JogadaJogador;


architecture Behavioral of JogadaJogador is
begin
	
	process(clock, computar_jogada, vez, entrada_jogada)
	begin
		
		if rising_edge(clock) then

			if unsigned(entrada_jogada) <= "1000" then
				if computar_jogada = '1' and vez = "11" and tabuleiro_jogador(to_integer(unsigned(entrada_jogada))) = '0' and tabuleiro_computador(to_integer(unsigned(entrada_jogada))) = '0' then
					saida_jogada <= entrada_jogada;
					insira_jogada <= '0';
					
				else 
					saida_jogada <= "1111";
					insira_jogada <= '1';
				
				end if;
				
			else
				saida_jogada <= "1111";
				insira_jogada <= '1';
				
			end if;
			
		end if;
	end process;
	
	
end architecture Behavioral;
