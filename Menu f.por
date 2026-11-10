programa{
	inclua biblioteca Util --> u
	inclua biblioteca Texto --> t

	
	funcao adFilmes(cadeia filmes[][], inteiro linha){
		
		cadeia locados[10][4], pausa, nomeFilme, filmeAlugado

		limpa()
		escreva("============================\n")
		escreva("      CADASTRO DE FILMES    \n")
		escreva("============================\n")

		// converter o nome do filme para caixa alta
		escreva("Digite o nome do filme: ")
		leia(nomeFilme)
		filmes[linha][0] = t.caixa_alta(nomeFilme)
		
		escreva("Digite o ano de lançamento do filme: ")
		leia(filmes[linha][1])
		
		escreva("Digite quantas vezes o filme já foi alugado: ")
		leia(filmes[linha][2])

		escreva("O filme está locado? (Responda com S ou N): ")
		leia(filmeAlugado)
		filmes[linha][3] = t.caixa_alta(filmeAlugado)
		
		escreva("Filme cadastrado com sucesso!\n")
		escreva("Pressione Enter para continuar!\n")
		leia(pausa)
		
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

	// ALAN
	funcao listarFilmes(cadeia matriz[][], inteiro total){
		cadeia pausa
		
		se(total == 0){
			limpa()
			escreva("Nenhum filme cadastrado!")	
			escreva("Pressione Enter para continuar!")
			leia(pausa)
		}
		senao{
			limpa()
			escreva("=======================\n")
			escreva("Filmes cadastrados: \n")
			escreva("=======================\n")
			
			para(inteiro i = 0; i < total; i++){
				escreva("Filme ", i + 1,": \n")
				escreva("Nome: ", matriz[i][0],"\n")
				escreva("Ano: ", matriz[i][1], "\n")
				escreva("Vezes Locados:", matriz[i][2], "\n")
				escreva("Filme Alugado(S / N): ", matriz[i][3], "\n")
				escreva("=======================\n")
			}	
			escreva("Pressione Enter para continuar!")
			leia(pausa)
		}
		
		
		
	
	
	
	}

	//ALAN
	funcao buscarFilmes(cadeia matriz[][], inteiro total){
		cadeia pausa, nomeFilme
		inteiro filmeEncontrado = 0 
		
		se(total == 0){
			limpa()
			escreva("Nenhum filme cadastrado!")	
			escreva("Pressione Enter para continuar!")
			leia(pausa)	
			
		}
		senao{
			limpa()
			escreva("============================\n")
			escreva("Digite o nome do filme para buscar: \n")
			escreva("============================\n")
			leia(nomeFilme)
			nomeFilme = t.caixa_alta(nomeFilme)

			para(inteiro i = 0; i< total; i++){
				
				se(matriz[i][0] == nomeFilme){
					limpa()
					escreva("Filme encontrado! \n")
					escreva("Nome: ", matriz[i][0],"\n")
					escreva("Ano: ", matriz[i][1], "\n")
					escreva("Vezes Locados:", matriz[i][2], "\n")
					escreva("Filme Alugado(S / N): ", matriz[i][3], "\n")
					escreva("=======================\n")
					filmeEncontrado = 1
					escreva("Pressione Enter para continuar!")
					leia(pausa)
				}
				
			}

			se(filmeEncontrado == 0){
				limpa()
				escreva("=======================\n")
				escreva("Filme não encontrado!\n")
				escreva("=======================\n")
				escreva("Pressione Enter para continuar!")
				leia(pausa)
				
			}
			
		}
		
		
		
		
	}
		
	

	
	funcao inicio()
	{
		inteiro menu = 0, i, i3 = 0, totalCadastrados = 0
		cadeia matriz[10][4], pausa
		faca{
			limpa()
			escreva("1. Cadastrar um filme \n2. Listar Filmes locados e disponíveis \n3. Filmes locados \n4. Alugar um filme \n5. Devolver um filme \n6. Filme mais locado \n7. Buscar um filme pelo nome \n8. Atualizar dados de um filme \n9. Estatísticas gerais \n10. Sair do programa \n\nQual A sua escolha? ")
			leia(menu)
			escreva("\n")

			escolha(menu){
				caso 1:
					se(totalCadastrados < 10){
					adFilmes(matriz, totalCadastrados)
					totalCadastrados = totalCadastrados +1
					}senao{
						escreva("O limite de filmes cadastrado foi atingido! (10 filmes)\n")
						escreva("Pressione Enter para continuar.\n")	
						leia(pausa)
					}
					
					
				pare
				caso 2:
					listarFilmes(matriz, totalCadastrados)
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
					buscarFilmes(matriz, totalCadastrados)
				
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
 * @POSICAO-CURSOR = 2964; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */