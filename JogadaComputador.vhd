library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity JogadaComputador is
    port (
        tabuleiro_jogador 		: in std_logic_vector(8 downto 0);
		  tabuleiro_computador 	: in std_logic_vector(8 downto 0);
		  
        vez 				: in std_logic_vector(1 downto 0); 						
		  
        jogada_computador 		: out std_logic_vector(3 downto 0)
    );
end entity JogadaComputador;

architecture Behavioral of JogadaComputador is
	
	function gerar_jogada(jogador, computador : std_logic_vector(8 downto 0)) return integer is
		variable position : integer := 0;
		
		begin
			
			if computador(0) = '0' and computador(1) = '1' and computador(2) = '1' and jogador(0) = '0' then
				position := 0;
				report "Linha superior comp, jogar 0";
				
			elsif computador(0) = '1' and computador(1) = '0' and computador(2) = '1' and jogador(1) = '0' then
				position := 1;
				report "Linha superior comp, jogar 1";
			
			elsif computador(0) = '1' and computador(1) = '1' and computador(2) = '0' and jogador(2) = '0' then
				position := 2;
				report "Linha superior comp, jogar 2";
			
			elsif computador(3) = '0' and computador(4) = '1' and computador(5) = '1' and jogador(3) = '0' then
				position := 3;
				report "Linha meio comp, jogar 3";
				
			elsif computador(3) = '1' and computador(4) = '0' and computador(5) = '1' and jogador(4) = '0' then
				position := 4;
				report "Linha meio comp, jogar 4";
				
			elsif computador(3) = '1' and computador(4) = '1' and computador(5) = '0' and jogador(5) = '0' then
				position := 5;
				report "Linha meio comp, jogar 5";
				
			elsif computador(6) = '0' and computador(7) = '1' and computador(8) = '1' and jogador(6) = '0' then
				position := 6;
				report "Linha inferior comp, jogar 6";
			
			elsif computador(6) = '1' and computador(7) = '0' and computador(8) = '1' and jogador(7) = '0' then
				position := 7;
				report "Linha inferior comp, jogar 7";
				
			elsif computador(6) = '1' and computador(7) = '1' and computador(8) = '0' and jogador(8) = '0' then
				position := 8;
				report "Linha inferior comp, jogar 8";
				
			elsif computador(0) = '0' and computador(3) = '1' and computador(6) = '1' and jogador(0) = '0' then
				position := 0;
				report "Coluna da esquerda comp, jogar 0";
			
			elsif computador(0) = '1' and computador(3) = '0' and computador(6) = '1' and jogador(3) = '0' then
				position := 3;
				report "Coluna da esquerda comp, jogar 3";
			
			elsif computador(0) = '1' and computador(3) = '1' and computador(6) = '0' and jogador(6) = '0' then
				position := 6;
				report "Coluna da esquerda comp, jogar 6";
				
			elsif computador(1) = '0' and computador(4) = '1' and computador(7) = '1' and jogador(1) = '0' then
				position := 1;
				report "Coluna do meio comp, jogar 1";
				
			elsif computador(1) = '1' and computador(4) = '0' and computador(7) = '1' and jogador(4) = '0' then
				position := 4;
				report "Coluna do meio comp, jogar 4";
				
			elsif computador(1) = '1' and computador(4) = '1' and computador(7) = '0' and jogador(7) = '0' then
				position := 7;
				report "Coluna do meio comp, jogar 7";
				
			elsif computador(2) = '0' and computador(5) = '1' and computador(8) = '1' and jogador(2) = '0' then
				position := 2;
				report "Coluna da direita comp, jogar 2";
				
			elsif computador(2) = '1' and computador(5) = '0' and computador(8) = '1' and jogador(5) = '0' then
				position := 5;
				report "Coluna da direita comp, jogar 5";
				
			elsif computador(2) = '1' and computador(5) = '1' and computador(8) = '0' and jogador(8) = '0' then
				position := 8;
				report "Coluna da direita comp, jogar 8";
				
			elsif computador(0) = '0' and computador(4) = '1' and computador(8) = '1' and jogador(0) = '0' then
				position := 0;
				report "Diagonal principal comp, jogar 0";
				
			elsif computador(0) = '1' and computador(4) = '0' and computador(8) = '1' and jogador(4) = '0' then
				position := 4;
				report "Diagonal principal comp, jogar 4";
				
			elsif computador(0) = '1' and computador(4) = '1' and computador(8) = '0' and jogador(8) = '0' then
				position := 8;
				report "Diagonal principal comp, jogar 8";
				
			elsif computador(2) = '0' and computador(4) = '1' and computador(6) = '1' and jogador(2) = '0' then
				position := 2;
				report "Diagonal secundaria comp, jogar 2";
				
			elsif computador(2) = '1' and computador(4) = '0' and computador(6) = '1' and jogador(4) = '0' then
				position := 4;
				report "Diagonal secundaria comp, jogar 4";
				
			elsif computador(2) = '1' and computador(4) = '1' and computador(6) = '0' and jogador(6) = '0' then
				position := 6;
				report "Diagonal secundaria comp, jogar 6";
				
			-- Checa por vitoria do Adversario
			elsif jogador(0) = '0' and jogador(1) = '1' and jogador(2) = '1' and computador(0) = '0' then
				position := 0;
				report "Linha superior jogador, jogar 0";
				
			elsif jogador(0) = '1' and jogador(1) = '0' and jogador(2) = '1' and computador(1) = '0' then
				position := 1;
				report "Linha superior jogador, jogar 1";
			
			elsif jogador(0) = '1' and jogador(1) = '1' and jogador(2) = '0' and computador(2) = '0' then
				position := 2;
				report "Linha superior jogador, jogar 2";
			
			elsif jogador(3) = '0' and jogador(4) = '1' and jogador(5) = '1' and computador(3) = '0' then
				position := 3;
				report "Linha do meio jogador, jogar 3";
				
			elsif jogador(3) = '1' and jogador(4) = '0' and jogador(5) = '1' and computador(4) = '0' then
				position := 4;
				report "Linha do meio jogador, jogar 4";
				
			elsif jogador(3) = '1' and jogador(4) = '1' and jogador(5) = '0' and computador(5) = '0' then
				position := 5;
				report "Linha do meio jogador, jogar 5";
				
			elsif jogador(6) = '0' and jogador(7) = '1' and jogador(8) = '1' and computador(6) = '0' then
				position := 6;
				report "Linha de baixo jogador, jogar 6";
			
			elsif jogador(6) = '1' and jogador(7) = '0' and jogador(8) = '1' and computador(7) = '0' then
				position := 7;
				report "Linha de baixo jogador, jogar 7";
				
			elsif jogador(6) = '1' and jogador(7) = '1' and jogador(8) = '0' and computador(8) = '0' then
				position := 8;
				report "Linha de baixo jogador, jogar 8";
				
			elsif jogador(0) = '0' and jogador(3) = '1' and jogador(6) = '1' and computador(0) = '0' then
				position := 0;
				report "Coluna esquerda jogador, jogar 0";
			
			elsif jogador(0) = '1' and jogador(3) = '0' and jogador(6) = '1' and computador(3) = '0' then
				position := 3;
				report "Coluna esquerda jogador, jogar 3";
			
			elsif jogador(0) = '1' and jogador(3) = '1' and jogador(6) = '0' and computador(6) = '0' then
				position := 6;
				report "Coluna esquerda jogador, jogar 6";
				
			elsif jogador(1) = '0' and jogador(4) = '1' and jogador(7) = '1' and computador(1) = '0' then
				position := 1;
				report "Coluna meio jogador, jogar 1";
				
			elsif jogador(1) = '1' and jogador(4) = '0' and jogador(7) = '1' and computador(4) = '0' then
				position := 4;
				report "Coluna meio jogador, jogar 4";
				
			elsif jogador(1) = '1' and jogador(4) = '1' and jogador(7) = '0' and computador(7) = '0' then
				position := 7;
				report "Coluna meio jogador, jogar 7";
				
			elsif jogador(2) = '0' and jogador(5) = '1' and jogador(8) = '1' and computador(2) = '0' then
				position := 2;
				report "Coluna direita jogador, jogar 2";
				
			elsif jogador(2) = '1' and jogador(5) = '0' and jogador(8) = '1' and computador(5) = '0' then
				position := 5;
				report "Coluna direita jogador, jogar 5";
				
			elsif jogador(2) = '1' and jogador(5) = '1' and jogador(8) = '0' and computador(8) = '0' then
				position := 8;
				report "Coluna direita jogador, jogar 8";
				
			elsif jogador(0) = '0' and jogador(4) = '1' and jogador(8) = '1' and computador(0) = '0' then
				position := 0;
				report "Diagonal principal jogador, jogar 0";
				
			elsif jogador(0) = '1' and jogador(4) = '0' and jogador(8) = '1' and computador(4) = '0' then
				position := 4;
				report "Diagonal principal jogador, jogar 4";
				
			elsif jogador(0) = '1' and jogador(4) = '1' and jogador(8) = '0' and computador(8) = '0' then
				position := 8;
				report "Diagonal principal jogador, jogar 8";
				
			elsif jogador(2) = '0' and jogador(4) = '1' and jogador(6) = '1' and computador(2) = '0' then
				position := 2;
				report "Diagonal secundaria jogador, jogar 2";
				
			elsif jogador(2) = '1' and jogador(4) = '0' and jogador(6) = '1' and computador(4) = '0' then
				position := 4;
				report "Diagonal secundaria jogador, jogar 4";
				
			elsif jogador(2) = '1' and jogador(4) = '1' and jogador(6) = '0' and computador(6) = '0' then
				position := 6;
				report "Diagonal secundaria jogador, jogar 6";
			
			-- Gera Jogada Aleatoria
			
			elsif jogador(4) = '0' and computador(4) = '0' then
				position := 4;
				report "Posicao livre, jogar 4";
			
			elsif jogador(0) = '0' and computador(0) = '0' then
				position := 0;
				report "Posicao livre, jogar 0";
			
			elsif jogador(2) = '0' and computador(2) = '0' then
				position := 2;
				report "Posicao livre, jogar 2";
				
			elsif jogador(6) = '0' and computador(6) = '0' then
				position := 6;
				report "Posicao livre, jogar 6";
				
			elsif jogador(8) = '0' and computador(8) = '0' then
				position := 8;
				report "Posicao livre, jogar 8";
			
			elsif jogador(1) = '0' and computador(1) = '0' then
				position := 1;
				report "Posicao livre, jogar 1";
				
			elsif jogador(3) = '0' and computador(3) = '0' then
				position := 3;
				report "Posicao livre, jogar 3";
				
			elsif jogador(5) = '0' and computador(5) = '0' then
				position := 5;
				report "Posicao livre, jogar 5";
			
			elsif jogador(7) = '0' and computador(7) = '0' then
				position := 7;
				report "Posicao livre, jogar 7";
				
			end if;

			return position;
	end function;
   
begin
	 
	 process (tabuleiro_jogador, tabuleiro_computador, vez)
		variable posicao_jogada : integer; 
	 begin
        if vez = "00" then
            posicao_jogada := gerar_jogada(tabuleiro_jogador, tabuleiro_computador);
            
            -- Saídas
            jogada_computador <= std_logic_vector(to_unsigned(posicao_jogada, 4));
        else
		  
            jogada_computador <= "1111"; -- Saída vazia
				
        end if;
    end process;
	 
end architecture Behavioral;
