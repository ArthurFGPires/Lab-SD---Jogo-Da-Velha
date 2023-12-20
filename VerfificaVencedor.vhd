LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity VerificaVencedor is
    port (
        tabuleiro_jogador 		: in std_logic_vector(8 downto 0);
		  tabuleiro_computador 	: in std_logic_vector(8 downto 0);
        
		  vitoria_usuario 	: out std_logic;
        vitoria_computador : out std_logic; 
        empate 				: out std_logic; 	
		  
		  fim						: out std_logic
    );
end VerificaVencedor;

architecture Behavioral of VerificaVencedor is
	signal result : std_logic_vector(8 downto 0) := "000000000";
begin

	process(tabuleiro_jogador, tabuleiro_computador, result)
	begin
		result <= tabuleiro_jogador or tabuleiro_computador;
		
		if( (tabuleiro_jogador(0) = '1' and tabuleiro_jogador(1) = '1' and tabuleiro_jogador(2) = '1') or 
			 (tabuleiro_jogador(3) = '1' and tabuleiro_jogador(4) = '1' and tabuleiro_jogador(5) = '1') or
			 (tabuleiro_jogador(6) = '1' and tabuleiro_jogador(7) = '1' and tabuleiro_jogador(8) = '1') or
			 (tabuleiro_jogador(0) = '1' and tabuleiro_jogador(3) = '1' and tabuleiro_jogador(6) = '1') or
			 (tabuleiro_jogador(1) = '1' and tabuleiro_jogador(4) = '1' and tabuleiro_jogador(7) = '1') or
			 (tabuleiro_jogador(2) = '1' and tabuleiro_jogador(5) = '1' and tabuleiro_jogador(8) = '1') or
			 (tabuleiro_jogador(0) = '1' and tabuleiro_jogador(4) = '1' and tabuleiro_jogador(8) = '1') or
			 (tabuleiro_jogador(2) = '1' and tabuleiro_jogador(4) = '1' and tabuleiro_jogador(6) = '1')
			) then
				vitoria_usuario <= '1';
				vitoria_computador <= '0';
				empate <= '0';
				fim <= '1';
		
		elsif ( (tabuleiro_computador(0) = '1' and tabuleiro_computador(1) = '1' and tabuleiro_computador(2) = '1') or 
				  (tabuleiro_computador(3) = '1' and tabuleiro_computador(4) = '1' and tabuleiro_computador(5) = '1') or
				  (tabuleiro_computador(6) = '1' and tabuleiro_computador(7) = '1' and tabuleiro_computador(8) = '1') or
				  (tabuleiro_computador(0) = '1' and tabuleiro_computador(3) = '1' and tabuleiro_computador(6) = '1') or
				  (tabuleiro_computador(1) = '1' and tabuleiro_computador(4) = '1' and tabuleiro_computador(7) = '1') or
				  (tabuleiro_computador(2) = '1' and tabuleiro_computador(5) = '1' and tabuleiro_computador(8) = '1') or
				  (tabuleiro_computador(0) = '1' and tabuleiro_computador(4) = '1' and tabuleiro_computador(8) = '1') or
				  (tabuleiro_computador(2) = '1' and tabuleiro_computador(4) = '1' and tabuleiro_computador(6) = '1')
			) then
				vitoria_usuario <= '0';
				vitoria_computador <= '1';
				empate <= '0';
				fim <= '1';
		
		elsif result = "111111111" then
				vitoria_usuario <= '0';
				vitoria_computador <= '0';
				empate <= '1';
				fim <= '1';
		
		else
			vitoria_usuario <= '0';
			vitoria_computador <= '0';
			empate <= '0';
			fim <= '0';
		
		end if;
			
	end process;
	 
end Behavioral;
