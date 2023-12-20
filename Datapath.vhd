library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Datapath is
	port (
		tabuleiro_jogador 		: in std_logic_vector(8 downto 0);
		tabuleiro_computador 	: in std_logic_vector(8 downto 0);
		vez		: in std_logic_vector(1 downto 0);
		clock 	: in std_logic;
		
		jogada_entrada : in std_logic_vector(3 downto 0);
		inserir_jogada : in std_logic;
		visor				: in std_logic;
		
		jogada_saida 		: out std_logic_vector(3 downto 0);
		fim 					: out std_logic;
		esperando_jogada	: out std_logic;
		
		vitoria_comp : out std_logic;
		vitoria_jog  : out std_logic;
		empate		 : out std_logic;
		
		Bcd_out		 : out std_logic_vector(6 downto 0)
	);
end Datapath;

architecture Comportamental of Datapath is

-----------------------------------------------------------------------
-------------------------- Componentes --------------------------------
-----------------------------------------------------------------------
	
	component JogadaComputador is
		 port (
			  tabuleiro_jogador 		: in std_logic_vector(8 downto 0);
			  tabuleiro_computador 	: in std_logic_vector(8 downto 0);
			  vez 				: in std_logic_vector(1 downto 0); 						
			  
			  jogada_computador 		: out std_logic_vector(3 downto 0)
		 );
	end component;
	
	component JogadaJogador is
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
	end component;
	
	component VerificaVencedor is
		 port (
			  tabuleiro_jogador 		: in std_logic_vector(8 downto 0);
			  tabuleiro_computador 	: in std_logic_vector(8 downto 0);
			  
			  vitoria_usuario 	: out std_logic;
			  vitoria_computador : out std_logic;
			  empate 				: out std_logic; 	
			  
			  fim						: out std_logic
		 );
	end component;
	
	component Bcd is
		Port ( 
			entrada : in STD_LOGIC_VECTOR (3 downto 0);
			saida : out STD_LOGIC_VECTOR (6 downto 0)
		);
	end component;
	
	----------------------------------------------------------------------
	---------------------------- Sinais ----------------------------------
	----------------------------------------------------------------------
	signal jogada_computador, jogada_jogador, jogada_visor : std_logic_vector(3 downto 0);
	signal ultima_jogada : std_logic_vector(3 downto 0) := "1111";

	begin
	
	----------------------------------------------------------------------
	-------------------------- Instancias --------------------------------
	----------------------------------------------------------------------
		JogadaComputador_inst: JogadaComputador port map (
			tabuleiro_jogador => tabuleiro_jogador,
			tabuleiro_computador => tabuleiro_computador,
			vez => vez, 						
			jogada_computador => jogada_computador
		);

		JogdaJogador_inst: JogadaJogador port map (
			tabuleiro_jogador => tabuleiro_jogador,
			tabuleiro_computador => tabuleiro_computador,
			entrada_jogada => jogada_entrada,
			computar_jogada => inserir_jogada,
			vez => vez,
			clock => clock,
			saida_jogada => jogada_jogador,
			insira_jogada => esperando_jogada
		);
		
		VerificaVencedor_inst: VerificaVencedor port map (
			tabuleiro_jogador => tabuleiro_jogador,
			tabuleiro_computador => tabuleiro_computador,	  
			vitoria_usuario => vitoria_jog,
			vitoria_computador => vitoria_comp,
			empate => empate,
			fim => fim		
		);
		
		Bcd_inst : Bcd port map (
			entrada => jogada_visor,
			saida => Bcd_out
		);
	
	-----------------------------------------------------
	------------------- Process -------------------------
	-----------------------------------------------------
	
	process (vez, jogada_entrada, jogada_computador, jogada_jogador)
	begin
		 if vez = "11" then
			  jogada_saida <= jogada_jogador;
			  
		 elsif vez = "00" then
			  jogada_saida <= jogada_computador;
			  
		 else
			  jogada_saida <= "1111";
			  
		 end if;
	end process;
	
	process(clock)
	begin
		if rising_edge(clock) then
			if jogada_computador /= "1111" then
				ultima_jogada <= jogada_computador;
			end if;
		end if;		
	end process;
	
	process(visor, ultima_jogada, jogada_entrada)
	begin

		if visor = '1' then
			jogada_visor <= jogada_entrada;
			
		else
			jogada_visor <= ultima_jogada;
			
		end if;
		
	end process;
	
end Comportamental;