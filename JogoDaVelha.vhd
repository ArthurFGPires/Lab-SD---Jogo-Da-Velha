library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity JogoDaVelha is
	port(
		clock : in std_logic;
		reset : in std_logic;
		
		entrada_jogada : in std_logic_vector(3 downto 0);
		inserir_jogada : in std_logic;
		selecao_inicio : in std_logic;
		visor 			: in std_logic;
		
		vitoria_comp : out std_logic;
		vitoria_jog  : out std_logic;
		empate		 : out std_logic;
		
		esperando_jogada : out std_logic;
		
		Bcd_out : out std_logic_vector(6 downto 0)
	
	);
end JogoDaVelha;

architecture Comportamental of JogoDaVelha is
	
	component Fluxo is
		port (
			clock : in std_logic;
			reset	: in std_logic;
			
			jogada	: in std_logic_vector(3 downto 0);
			fim		: in std_logic;
			inicio	: in std_logic;
			
			tabuleiro_jogador 	: out std_logic_vector(8 downto 0);
			tabuleiro_computador : out std_logic_vector(8 downto 0);
			vez_saida			: out std_logic_vector(1 downto 0)
		);
	end component;
	
	component Datapath is
		port (
			tabuleiro_jogador 		: in std_logic_vector(8 downto 0);
			tabuleiro_computador 	: in std_logic_vector(8 downto 0);
			vez		 : in std_logic_vector(1 downto 0);
			clock 	: in std_logic;
			
			jogada_entrada : in std_logic_vector(3 downto 0);
			inserir_jogada : in std_logic;
			visor 			: in std_logic;
			
			jogada_saida 		: out std_logic_vector(3 downto 0);
			fim 					: out std_logic;
			esperando_jogada	: out std_logic;
			
			vitoria_comp : out std_logic;
			vitoria_jog  : out std_logic;
			empate		 : out std_logic;
			
			Bcd_out		 : out std_logic_vector(6 downto 0)
		);
	end component;
	
	signal jogada_signal : std_logic_vector(3 downto 0);
	signal vez_signal : std_logic_vector(1 downto 0);
	signal fim_signal : std_logic;
	signal tabuleiro_jogador_signal, tabuleiro_computador_signal : std_logic_vector(8 downto 0);
	
	begin
	
	Fluxo_inst : Fluxo port map (
		clock => clock,
		reset => reset,
		jogada => jogada_signal,
		fim => fim_signal,
		inicio => selecao_inicio,
		tabuleiro_jogador => tabuleiro_jogador_signal,
		tabuleiro_computador => tabuleiro_computador_signal,
		vez_saida => vez_signal
	);
	
	Datapath_inst : Datapath port map (
		tabuleiro_jogador => tabuleiro_jogador_signal,
		tabuleiro_computador => tabuleiro_computador_signal,
		vez => vez_signal,
		clock => clock,
		jogada_entrada => entrada_jogada,
		inserir_jogada => inserir_jogada,
		visor => visor,
		jogada_saida => jogada_signal,
		fim => fim_signal,
		esperando_jogada => esperando_jogada,
		vitoria_comp => vitoria_comp,
		vitoria_jog => vitoria_jog,
		empate => empate,
		Bcd_out => Bcd_out
	);
	
end Comportamental;