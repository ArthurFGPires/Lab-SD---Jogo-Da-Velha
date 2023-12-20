library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Fluxo is
	port (
		clock : in std_logic;
		reset	: in std_logic;
		
		jogada	: in std_logic_vector(3 downto 0);
		fim		: in std_logic;
		inicio	: in std_logic;
		
		tabuleiro_jogador 	: out std_logic_vector(8 downto 0);
		tabuleiro_computador : out std_logic_vector(8 downto 0);
		vez_saida				: out std_logic_vector(1 downto 0)
	);
end Fluxo;

architecture Comportamental of Fluxo is
	
	Type state is (ESTADO_RESET, ESTADO_INICIAL, ESTADO_JOGADOR, ESTADO_COMPUTADOR, ESTADO_VERIFICACAO, ESTADO_FINAL);
	
	signal estado, prox_estado : state;
	
	signal tab_jogador, tab_computador : std_logic_vector(8 downto 0) := "000000000";
	signal jogada_inserida : std_logic_vector(3 downto 0) := "1111";
	signal vez, prox_vez: std_logic_vector(1 downto 0)  := "00";
	
begin
	---------------------------------------------------------
	--------------------- Sequencial ------------------------
	---------------------------------------------------------
	process(clock, reset, jogada_inserida, prox_estado, prox_vez)
		variable posicao : integer := 0;
	begin
		
		if rising_edge(clock) then
			
			if reset = '1' then
				tab_jogador <= "000000000";
				tab_computador <= "000000000";
			
			elsif jogada_inserida /= "1111" and unsigned(jogada_inserida) <= "1000" then
				
				posicao := to_integer(unsigned(jogada_inserida));
				report "Jogada Valida, posicao = " & integer'image(posicao);
				
				if vez = "00" then
					tab_computador(posicao) <= '1';
				elsif vez = "11" then
					tab_jogador(posicao) <= '1';
				end if;
			
			end if;
			
			estado <= prox_estado;
			vez <= prox_vez;
			
		end if;
	end process;
	
	
	---------------------------------------------------------
	------------------- Combinacional -----------------------
	---------------------------------------------------------
	-- Se vez = 10 prox vez 11, se vez = 01 prox vez 00
	
	
	process(reset, fim, jogada, vez, estado, inicio)
	begin
		if reset = '1' then
			report "Estado Reset";
			
			prox_estado <= ESTADO_INICIAL;
			jogada_inserida <= "1111";
			prox_vez <= "01";					-- Vez vazio
			
		else
			case estado is
				when ESTADO_INICIAL =>
					report "Estado Inicial";
					
					if inicio = '1' then
						prox_estado <= ESTADO_JOGADOR;
						jogada_inserida <= "1111";
						prox_vez <= "11";
						
						report "Jogador Inicia";
						
					else
						prox_estado <= ESTADO_COMPUTADOR;
						jogada_inserida <= "1111";
						prox_vez <= "00";
						
						report "Computador Inicia";
						
					end if;
					
				when ESTADO_JOGADOR =>
					report "Estado Jogador";
					
					if jogada = "1111" then
						prox_estado <= ESTADO_JOGADOR;
						jogada_inserida <= "1111";
						prox_vez <= "11";
					else
						prox_estado <= ESTADO_VERIFICACAO;
						jogada_inserida <= jogada;
						prox_vez <= "01";
					end if;
					
				when ESTADO_COMPUTADOR =>
					report "Estado Computador";
					
					if jogada = "1111" then
						prox_estado <= ESTADO_COMPUTADOR;
						jogada_inserida <= "1111";
						prox_vez <= "00";
					else
						prox_estado <= ESTADO_VERIFICACAO;
						jogada_inserida <= jogada;
						prox_vez <= "10";
					end if;
					
				when ESTADO_VERIFICACAO => 
					report "Estado Verificação";
					
					if fim = '1' then
						prox_estado <= ESTADO_FINAL;
						jogada_inserida <= jogada;
						prox_vez <= "01";				-- Vez vazio 
					
					else
					
						if vez = "01" then
							prox_estado <= ESTADO_COMPUTADOR;
							jogada_inserida <= "1111";
							prox_vez <= "00";
						
						else
							prox_estado <= ESTADO_JOGADOR;
							jogada_inserida <= "1111";
							prox_vez <= "11";
							
						end if;
						
					end if;
					
				when ESTADO_FINAL =>
					report "Estado Final";
					
					prox_estado <= ESTADO_FINAL;
					prox_vez <= "01";
					jogada_inserida <= "1111";
					
				when others =>
					report "Estado não previsto";
					
					prox_estado <= ESTADO_INICIAL;
					prox_vez <= "01";
					jogada_inserida <= "1111";
					
			end case;
			
		end if;
		
	end process;
	
	vez_saida <= vez;
	tabuleiro_jogador <= tab_jogador;
	tabuleiro_computador <= tab_computador;
	
end Comportamental;