programa
{


	funcao adFilmes(cadeia filmes[][]){
		

		inteiro i, j
		cadeia locados[2][4]
		para(i = 0; i < 2; i++){
			para(j = 0; j < 4; j++){
				se(j == 0){
					escreva("                Filme N ", i+1)
					escreva("\n==============================================\n")
					escreva("Digite o nome do Filme: ")
					leia(filmes[i][j])
				}
				senao se(j == 1){
					escreva("Digite o ano de lançamento do filme: ")
					leia(filmes[i][j])
				}
				
				senao se(j == 2){
					escreva("Digite Quantas vezes o filem ja foi alugado: ")
					leia(filmes[i][j])
				}

				senao{
					escreva("Filme Alocado? (Responda com S Ou N) ")
					leia(filmes[i][j])
					escreva("==============================================\n")

					
						
					}

					
					
				}
			}
			
		
	}

		
	



	funcao filmesLoc(cadeia filLocados[][]){
		inteiro l = 0, c = 0
		para(l = 0; l < 2; l++){
			escreva("\n")
			para(c = 0; c < 4; c++){
				se(c == 3 e filLocados[l][c] == "S"){
						para(c = 0; c < 4; c++){
							escreva(filLocados[l][c], "\t")
							}
					
				}

			
		
	}
		}
	}
		
		
	

	
	funcao inicio()
	{
		inteiro menu = 0, i, i3 = 0
		cadeia matriz[2][4]
		faca{
			limpa()
			escreva("1. Cadastrar um filme \n2. Listar Filmes locados e disponíveis \n3. Filmes locados \n4. Alugar um filme \n5. Devolver um filme \n6. Filme mais locado \n7. Buscar um filme pelo nome \n8. Atualizar dados de um filme \n9. Estatísticas gerais \n10. Sair do programa \n\nQual A sua escolha? ")
			leia(menu)
			escreva("\n")

			escolha(menu){
				caso 1:
					adFilmes(matriz)
				pare
				caso 2:
				pare
				caso 3:
					faca{
						filmesLoc(matriz)

						escreva("\n\nDigite 2 para sair: ")
						leia(i3)
					}enquanto(i3 != 2)
				pare
				caso 4:
				pare
				caso 5:
				pare
				caso 6:
				pare
				caso 7:
				pare
				caso 8:
				pare
				caso 9:
				pare
				caso 10:
					escreva("Este Programa vai explodir em:")
					para(i = 10;i > 0; i--){
						escreva("\n",i)
					}
					escreva("\nBOOOOOOOOMMMM")
				
				pare
			}
			
		}enquanto(menu != 10)

       
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 897; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {matriz, 75, 9, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */