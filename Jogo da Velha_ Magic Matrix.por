programa
{
	// --- Variável Global ---

	caracter jogo[3][3] 

	// Esta função desenha o tabuleiro na tela.
	funcao imprimirTabuleiro()
	{
		limpa() 
		escreva("\n--- Jogo da Velha: Magic Matrix ---\n\n")
		
		escreva("    0   1   2  <-- Colunas\n\n") 
		
		inteiro l, c 
		
		para(l = 0; l < 3; l++){
			se(l > 0){
				escreva("  ---+---+---\n") 
			}
			
			escreva(" ") 
			para(c = 0; c < 3; c++){
				escreva(" ", jogo[l][c], " ")
				se(c < 2)
					escreva("|") 
			}
			escreva(" ", l, " <-- Linha\n") 
		}
		escreva("\n")
	}
	
	
	// --- Função Principal (COM INÍCIO AUTOMÁTICO) ---
	funcao inicio()
	{
		inteiro instrucoes, iniciar, l, c, linha, coluna, jogador, ganhou, jogadas, opcao
		
		// --- Menu Inicial ---
		escreva("\n\nSeja muito Bem Vindo(a) ao meu Jogo Da Velha: *Magic Matrix*!\n\n")
		escreva("\nO intuito do Magic Matrix é levar diversão até você e seus amigos.\n")
		escreva("\nVocê gostaria de saber mais sobre? Digite o numero 1 para ler as instruções do jogo: ")
		leia(instrucoes)

		// Mostra instruções apenas se 'instrucoes == 1'
		se (instrucoes == 1)
		{
			limpa()
			escreva("\n\n*Instruções do Magic Matrix*: \n\n")
			escreva("\n- O tabuleiro é uma matriz de três linhas por três colunas.\n")
			escreva("\n- As linhas são numeradas de 0 á 2 e as colunas também são numeradas de 0 á 2.\n")
			escreva("\n- Dois jogadores escolhem uma marcação cada um.\n")
			escreva("\n- Você deve escolher primeiro a linha desejada e depois escolha a coluna onde você quer se posicionar.\n")
			escreva("\n- O jogador numero 1 vai ser representado por um circulo (0) e o jogador numero 2 vai ser representado por um xis (X).\n")
			escreva("\n- Os jogadores jogam alternadamente, uma marcação por vez, numa lacuna que esteja vazia.\n")
			escreva("\n- O objetivo do jogo é conseguir três círculos ou três xis em linha, quer seja horizontal, vertical ou diagonal.\n")
			escreva("\n- Quando possível, você deve impedir seu adversário de ganhar na próxima jogada, tentando bloquea-lo de finalizar uma linha.\n")
			escreva("\n- Se os dois jogadores jogarem sempre da melhor forma, o jogo terminará sempre em empate.\n")
		}

		escreva("\n\nEai vocês estão preparados para o melhor jogo da velha existente no mundo magico das matrizes? :D\n")
		escreva("\n\nDigite o numero 2 para iniciar o jogo *Magic Matrix*: ")
		leia(iniciar) 
		
		// --- Loop Principal (Jogar Novamente) ---
		faca
		{
			jogador = 1
			ganhou = 0
			jogadas = 0
			
			// Resetar o tabuleiro
			para(l = 0; l < 3; l++){
				para(c = 0; c < 3; c++)
				{
					jogo[l][c] = ' '
				}
			}
	
			// --- Loop da Partida ---
			faca
			{
				imprimirTabuleiro()
		
				faca
				{
					faca
					{
						se(jogador == 1){
							escreva("\nJogador 1 (0) - É a sua vez!")
						}senao{
							escreva("\nJogador 2 (X) - É a sua vez!")
						}
						
						escreva("\nDigite a Linha (0, 1 ou 2): ")
						leia(linha)
						escreva("Digite a Coluna (0, 1 ou 2): ")
						leia(coluna)
						escreva("\n")
					}
					enquanto(linha < 0 ou linha > 2 ou coluna < 0 ou coluna > 2)
					
					se (jogo[linha][coluna] != ' ')
					{
						escreva("--- Posição já ocupada! Tente novamente. ---\n")
					}
				}
				enquanto(jogo[linha][coluna] != ' ')
				
				// --- Salvar Coordenadas ---
				se(jogador == 1)
				{
					jogo[linha][coluna] = '0'
					jogador++
				}
				senao
				{
					jogo[linha][coluna] = 'X'
					jogador = 1
				}
				jogadas++
				
				// --- Verificação de Vitória ---
				
				// linhas
				para(l = 0; l < 3; l++){
					se(jogo[l][0] == '0' e jogo[l][1] == '0' e jogo[l][2] == '0')
						ganhou = 1
					se(jogo[l][0] == 'X' e jogo[l][1] == 'X' e jogo[l][2] == 'X')
						ganhou = 2
				}
				
				// colunas
				para(c = 0; c < 3; c++){
					se(jogo[0][c] == '0' e jogo[1][c] == '0' e jogo[2][c] == '0')
						ganhou = 1
					se(jogo[0][c] == 'X' e jogo[1][c] == 'X' e jogo[2][c] == 'X')
						ganhou = 2
				}
				
				// diagonal principal
				se(jogo[0][0] == '0' e jogo[1][1] == '0' e jogo[2][2] == '0')
						ganhou = 1
				se(jogo[0][0] == 'X' e jogo[1][1] == 'X' e jogo[2][2] == 'X')
						ganhou = 2
					
				// diagonal secundária
				se(jogo[0][2] == '0' e jogo[1][1] == '0' e jogo[2][0] == '0')
						ganhou = 1
				se(jogo[0][2] == 'X' e jogo[1][1] == 'X' e jogo[2][0] == 'X')
						ganhou = 2
					
			} // Fim do loop da partida
			enquanto(ganhou == 0 e jogadas < 9)
	
			// --- Fim de Jogo ---
			
			imprimirTabuleiro() // Mostra o tabuleiro final
		
			se(ganhou == 1)
				escreva("\n\n\tParabéns você é um excelente adversário, jogador 1 (0).\n \n\tvocê ganhou essa partida!! :)\n")
			
			se(ganhou == 2)
				escreva("\n\n\tparabéns você é um excelente adversário, jogador 2 (X).\n \n\tvocê ganhou essa partida!! :)\n")
			
			se(ganhou == 0)
				escreva("\n\tUAU,Tivemos um Empate hahaha :)\n\n")
				
			escreva("\n\tmas me conta, você está preparado para uma revanche??\n")
			escreva("\n\tdigite 3 para jogar novamente (ou outro número para sair): \n")
			leia(opcao)
			
			limpa()
		
		} // Fim do loop de "jogar novamente"
		enquanto(opcao == 3)
		
		
		escreva("\n--- Fim do Jogo. Obrigado por jogar! ---\n")
	}
}
