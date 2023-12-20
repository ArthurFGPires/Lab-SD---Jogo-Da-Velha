library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_JogoDaVelha is
end tb_JogoDaVelha;

architecture testbench of tb_JogoDaVelha is
	
	component JogoDaVelha is
		port(
			clock : in std_logic;
			reset : in std_logic;
			
			entrada_jogada : in std_logic_vector(3 downto 0);
			inserir_jogada : in std_logic;
			selecao_inicio : in std_logic;
			visor				: in std_logic;
			
			vitoria_comp : out std_logic;
			vitoria_jog  : out std_logic;
			empate		 : out std_logic;
			
			esperando_jogada : out std_logic;

			Bcd_out : out std_logic_vector(6 downto 0)
		
		);
	end component;
	
	signal clock, reset, inserir_jogada, selecao_inicio, visor : std_logic := '0';
	signal entrada_jogada : std_logic_vector(3 downto 0) := "0000";
	signal vitoria_comp, vitoria_jog, empate, esperando_jogada : std_logic;
	signal Bcd_out : std_logic_vector(6 downto 0);
	
begin
	
	process
	begin
		while true loop
			clock <= not clock;
			wait for 1 ns;
		end loop;
	end process;
	
	JogoDaVelha_inst : JogoDaVelha port map (
		clock => clock,
		reset => reset,
		entrada_jogada => entrada_jogada,
		inserir_jogada => inserir_jogada,
		selecao_inicio => selecao_inicio,
		visor => visor,
		vitoria_comp => vitoria_comp,
		vitoria_jog => vitoria_jog,
		empate => empate,
		esperando_jogada => esperando_jogada,
		Bcd_out => Bcd_out
	);
	
	
	process
	begin
		
		wait for 10 ns;
		reset <= '1';
		selecao_inicio <= '0';
		
		wait for 10 ns;
		reset <= '0';
		
		wait for 10 ns;
		entrada_jogada <= "1000";
		
		wait for 10 ns;
		inserir_jogada <= '1';
		
		wait for 10 ns;
		inserir_jogada <= '0';
		entrada_jogada <= "0010";
		
		wait for 10 ns;
		inserir_jogada <= '1';
		
		wait for 10 ns;
		inserir_jogada <= '0';
		entrada_jogada <= "0110";
		
		wait for 10 ns;
		inserir_jogada <= '1';
		
		wait for 10 ns;
		inserir_jogada <= '0';
		entrada_jogada <= "0001";
		
		wait for 10 ns;
		inserir_jogada <= '1';
		
		wait for 10 ns;
		inserir_jogada <= '0';
		entrada_jogada <= "0011";
		
		wait for 10 ns;
		inserir_jogada <= '1';
		
		wait for 10 ns;
		inserir_jogada <= '0';
		entrada_jogada <= "1000";
		
		wait for 10 ns;
		inserir_jogada <= '1';
		
		wait for 10 ns;
		inserir_jogada <= '0';
		
		wait for 25 ns;
		visor <= '1';
		
		wait for 30 ns;
		visor <= '0';
		
		wait;
	end process;
	
end testbench;