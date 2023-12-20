# Jogo da Velha em VHDL para Placa Altera DE2

Este é um projeto RTL (Register-Transfer Level) desenvolvido em VHDL para implementar um jogo da velha em uma placa Altera DE2. O jogo foi criado para ser jogado utilizando os recursos disponíveis na placa, como o display de 7 segmentos e os botões para entrada de dados.

## Funcionalidades do Dispositivo

### Entradas:
- **RESET**: Sinal de reinício do jogo.
- **Seleção**: Permite selecionar quem inicia o jogo.
- **4 bits de posição da jogada**: Entrada para inserir a posição desejada no jogo da velha.
- **1 bit de confirmação da jogada**: Sinal para confirmar a jogada realizada.
- **1 bit para seleção do valor do visor**: Permite alternar entre a visualização da entrada da jogada ou a última jogada do computador.

### Saídas:
- **6 bits para o display de 7 segmentos**: Utilizados para mostrar informações visuais do jogo.
- **1 bit de espera por operação do usuário**: Indica se o dispositivo aguarda uma ação do usuário (realização de um lance ou reset).
- **1 bit para cada condição**:
  - Vitoria do usuário.
  - Vitoria do computador.
  - Empate.

## Como Utilizar o Projeto

Para utilizar este projeto na placa Altera DE2, siga as instruções abaixo para interagir com o dispositivo:

1. **Acionando o Reset**: Inicie o jogo acionando o sinal de RESET em nível alto para reiniciar o jogo.

2. **Seleção de Quem Inicia**:
   - Utilize a chave de seleção para escolher quem inicia o jogo:
     - 1: Usuário inicia o jogo.
     - 0: Computador inicia o jogo.

3. **Realização das Jogadas**:
   - As jogadas são realizadas em turnos, alternando entre o jogador e o computador.
   - Para inserir a jogada do usuário:
     - Aguarde o momento adequado para inserir a posição desejada nos 4 bits de entrada da jogada.
     - Após selecionar a posição, acione a entrada para inserir a jogada para confirmar.

4. **Visualização das Jogadas**:
   - O computador apresenta sua jogada no visor quando a chave de seleção do visor estiver em 0.
   - Se a chave estiver em 1, o valor inserido nos bits de entrada de jogada será exibido no visor.

5. **Condições de Jogo**:
   - Quando todas as casas estiverem preenchidas, uma das saídas (vitória do usuário, vitória do computador ou empate) será ativada em nível alto, indicando o resultado da partida.
