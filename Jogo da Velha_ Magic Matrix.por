programa {
	funcao inicio() {

    caracter jogo[3][3]
    inteiro instrucoes, iniciar, l, c, linha, coluna, jogador, ganhou, jogadas, opcao
    
        escreva("\n\nSeja muito Bem Vindo(a) ao meu Jogo Da Velha: *Magic Matrix*!\n\n")
		escreva("\nO intuito do Magic Matrix é levar diversão até você e seus amigos.\n")
		escreva("\nVocê gostaria de saber mais sobre? Digite o numero 1 para ler as instruções do jogo: ")
		leia(instrucoes)
		escreva("\n\n*Instruções do Magic Matrix*: \n\n")
		escreva("\n- O tabuleiro é uma matriz de três linhas por três colunas.\n")
		escreva("\n- As linhas são numeradas de 0 á 2 e as colunas também são numeradas de 0 á 2.\n")
		escreva("\n- Dois jogadores escolhem uma marcação cada um.\n")
		escreva("\n- Você deve escolher primeiro a linha desejada e depois escolha a coluna onde você quer se posicionar.\n")
		escreva("\n- O jogador numero 1 vai ser representado por um xis (X) e o jogador numero 2 vai ser representado por um circulo (0).\n")
		escreva("\n- Os jogadores jogam alternadamente, uma marcação por vez, numa lacuna que esteja vazia.\n")
		escreva("\n- O objetivo do jogo é conseguir três círculos ou três xis em linha, quer seja horizontal, vertical ou diagonal.\n")
		escreva("\n- Quando possível, você deve impedir seu adversário de ganhar na próxima jogada, tentando bloquea-lo de finalizar uma linha.\n")
		escreva("\n- Se os dois jogadores jogarem sempre da melhor forma, o jogo terminará sempre em empate.\n")
		escreva("\n**ROLE A PÁGINA PARA CIMA E LEIA AS INTRUÇÕES ANTES DE INICIAR**\n")
		escreva("\nEai vocês estão preparados para o melhor jogo da velha existente no mundo magico das matrizes? :D\n")
		escreva("\n\nDigite o numero 2 para iniciar o jogo *Magic Matrix*: \n")
		leia(iniciar)

    faca{
        
      jogador = 1
      ganhou = 0
      jogadas = 0
      
    para(l = 0; l < 3; l++){
        para(c = 0; c < 3; c++)
          jogo[l][c] = ' '
    }
  
    faca{
          
        // é preciso ser feito a impressão do tabuleiro
       
    escreva("  0     1     2\n\n")
    para(l = 0; l < 3; l++){
        para(c = 0; c < 3; c++){
             escreva( " ", jogo[l][c])
        se(c < 2)
             escreva ("  |  ")
            se(c == 2)
             escreva("  ", l)
    }
            se(l < 2)
             escreva("\n----------------") 
        	    escreva("\n") 
        
    }
    
        // é preciso ler as coordenadas
        
    faca{
        faca{
            
            escreva("\nJogador ",jogador,  " Digite a Linha e Coluna da Posição Desejada:  ")
                leia(linha, coluna)
            escreva("\n")
            }enquanto(linha < 0 ou linha > 2 ou coluna < 0 ou coluna > 2)
                 }enquanto(jogo[linha][coluna] != ' ')
        
        // é preciso salvar as coordenadas
        
    se(jogador == 1){
        jogo[linha][coluna] = '0'
        jogador++
    }
        
    senao{
        jogo[linha][coluna] = 'X'
        jogador = 1
    }
        jogadas++
        
        // é preciso verificar ganhador por linhas
        
    para(l = 0; l < 3; l++){
        se(jogo[l][0] == '0' e jogo[l][1] == '0' e jogo[l][2] == '0')
            ganhou = 1
    }
    
    para(l = 0; l < 3; l++){
        se(jogo[l][0] == 'X' e jogo[l][1] == 'X' e jogo[l][2] == 'X')
            ganhou = 2
    }
        
        // é preciso verificar ganhador por colunas
        
    para(c = 0; c < 3; c++){
        se(jogo[0][c] == '0' e jogo[1][c] == '0' e jogo[2][c] == '0')
            ganhou = 1
    }
    
    para(c = 0; c < 3; c++){
        se(jogo[0][c] == 'X' e jogo[1][c] == 'X' e jogo[2][c] == 'X')
            ganhou = 2
    }
        // é preciso verificar ganhador na diagonal principal
        
    se(jogo[0][0] == '0' e jogo[1][1] == '0' e jogo[2][2] == '0')
          ganhou = 1
    
    se(jogo[0][0] == 'X' e jogo[1][1] == 'X' e jogo[2][2] == 'X')
          ganhou = 2
        
        // é preciso verificar ganhador na diagonal secundária
        
    se(jogo[0][2] == '0' e jogo[1][1] == '0' e jogo[2][0] == '0')
          ganhou = 1  
    
    se(jogo[0][2] == 'X' e jogo[1][1] == 'X' e jogo[2][0] == 'X')
          ganhou = 2
          
    }enquanto(ganhou == 0 e jogadas < 9)
  
       
        // é preciso ser feito a impressão do tabuleiro
       
    escreva("  0     1     2\n\n")
    para(l = 0; l < 3; l++){
        para(c = 0; c < 3; c++){
             escreva( " ", jogo[l][c])
        se(c < 2)
             escreva ("  |  ")
            se(c == 2)
             escreva("  ", l)
    }
            se(l < 2)
             escreva("\n----------------") 
        	    escreva("\n") 
        
    }
  
    se(ganhou == 1)
        escreva("\n\n\tParabéns você é um excelente adversário, jogador 1.\n \n\tvocê ganhou essa partida!! :)\n") 
        

    se(ganhou == 2)
        escreva("\n\n\tparabéns você é um excelente adversário, jogador 2.\n \n\tvocê ganhou essa partida!! :)\n")
    
    se(ganhou == 0)
        escreva("\n\tUAU,Tivemos um Empate hahaha :)\n\n")
        
    escreva("\n\tmas me conta, você está preparado para uma revanche??\n")
        escreva("\n\tdigite 3 para jogar novamente: \n")
            leia(opcao)
    }enquanto(opcao == 3)
  }
}



/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4552; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */