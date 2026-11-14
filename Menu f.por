programa{
	inclua biblioteca Util --> u
	inclua biblioteca Texto --> t
	inclua biblioteca Tipos --> ti
	inclua biblioteca Calendario --> c
	

	//Ryan/Weliton/ALan - Cadastrar um filme
	funcao adFilmes(cadeia filmes[][], inteiro linha){
		
		cadeia pausa, nomeFilme, filmeAlugado, anoCadeia, anoC, qtdC 
		inteiro ano = 0, anoAtual = c.ano_atual(), i = 0, qtd = 0

		limpa()
		escreva("============================\n")
		escreva("      CADASTRO DE FILMES    \n")
		escreva("============================\n")

		// converter o nome do filme para caixa alta
		escreva("Digite o nome do filme: ")
		leia(nomeFilme)
		filmes[linha][0] = t.caixa_alta(nomeFilme)

		//Trava de entradas
		escreva("Digite o ano de lançamento do filme (somente números): ")
		leia(anoC)
		faca{
			se(nao ti.cadeia_e_inteiro(anoC, 10)){
				escreva("Entrada inválida! Digite o ano utilizando apenas números:  \n")
				leia(anoC)
				i = 5
			}
			senao{
				ano = ti.cadeia_para_inteiro(anoC, 10)
				i = 10
			}
			se(ano < 0 ou ano > anoAtual){
				escreva("Digite um ano válido, maior que 0 e anterior ao ano atual \n")
				leia(anoC)
			}
		
			filmes[linha][1] = ti.inteiro_para_cadeia(ano, 10)
		
		}enquanto(ano < 0 ou ano > anoAtual ou i != 10)
	
		//Travas de entradas
		escreva("Digite quantas vezes o filme já foi alugado: ")
		leia(qtdC)
		faca{
			se(nao ti.cadeia_e_inteiro(qtdC, 10)){
				escreva("Entrada inválida! Digite a quantidade utilizando apenas números:  \n")
				leia(qtdC)
				i = 5
			}
			senao{
				qtd = ti.cadeia_para_inteiro(qtdC, 10)
				i = 10
			}
			se(qtd < 0){
				escreva("Digite um numero válido, maior que 0: \n")
				leia(qtdC)
			}
			
			filmes[linha][2] = ti.inteiro_para_cadeia(qtd, 10)
			
		}enquanto(qtd < 0 ou i != 10)

		

		escreva("O filme está locado? (Responda com S ou N): ")
		leia(filmeAlugado)
		filmes[linha][3] = t.caixa_alta(filmeAlugado)
		se(filmes[linha][3] != "S" e filmes[linha][3] != "N"){
			faca{
				escreva("Entrada inválida! Digite apenas S ou N:  \n")
				leia(filmes[linha][3])
			}enquanto(filmes[linha][3] != "S" e filmes[linha][3] != "N")
		}	
		
			
		
		
		escreva("Filme cadastrado com sucesso!\n")
		escreva("Pressione Enter para continuar!\n")
		leia(pausa)
		
	}
	// Ryan - Listar filmes locados
	funcao filmesLoc(cadeia filLocados[][], inteiro total){
		inteiro l = 0, c = 0
		cadeia pausa
		
		limpa()
		se(total == 0){
			limpa()
			escreva("Nenhum filme cadastrado!\n")	
			escreva("Pressione Enter para continuar!")
			leia(pausa)
			retorne
		}
		
		escreva("=======================\n")
		escreva("    Filmes locados     \n")
		escreva("=======================\n")
		
		para(l = 0; l < total; l++){
			para(c = 0; c < 4; c++){
				se(c == 3 e filLocados[l][c] == "S"){
					escreva("Filme ", l + 1,": \n")
					escreva("Nome: ", filLocados[l][0],"\n")
					escreva("Ano: ",filLocados[l][1], "\n")
					escreva("Vezes Locados: ", filLocados[l][2], "\n")
					escreva("Filme Alugado(S / N): ", filLocados[l][3], "\n")
					escreva("=======================\n")

							
							
					
				}	
	
			}
		}
	}
	

	// ALAN - filmes disponiveis
	funcao listarFilmes(cadeia matriz[][], inteiro total){
		cadeia pausa
		inteiro validLocados = 0, validDisp = 0
		
		se(total == 0){
			limpa()
			escreva("Nenhum filme cadastrado!\n")	
			escreva("Pressione Enter para continuar!")
			leia(pausa)
			retorne
		}
		senao{
			limpa()
			escreva("=======================\n")
			escreva("        Locados        \n")
			escreva("=======================\n")

			para(inteiro i = 0; i < total; i++){

				se(matriz[i][3] == "S"){	
					validLocados++
					escreva("Filme ", i + 1,": \n")
					escreva("Nome: ", matriz[i][0],"\n")
					escreva("Ano: ", matriz[i][1], "\n")
					escreva("Vezes Locados:", matriz[i][2], "\n")
					escreva("---------------------\n")
				}
			}	
			se(validLocados == 0){
				escreva("Nenhum filme locado no momento!\n")	
			}

			escreva("=======================\n")
			escreva("      Disponiveis      \n")
			escreva("=======================\n")

			para(inteiro i = 0; i < total; i++){

				se(matriz[i][3] == "N"){	
					escreva("Filme ", i + 1,": \n")
					escreva("Nome: ", matriz[i][0],"\n")
					escreva("Ano: ", matriz[i][1], "\n")
					escreva("Vezes Locados:", matriz[i][2], "\n")
					escreva("---------------------\n")
				}
			}
			se(validDisp == 0){
				escreva("Nenhum filme locado no momento!\n")	
			}			
			escreva("Pressione Enter para continuar!")
			leia(pausa)
		}
		
	}

	//ALAN - Buscar um filme pelo nome
	funcao buscarFilmes(cadeia matriz[][], inteiro total){
		cadeia pausa, nomeFilme
		inteiro filmeEncontrado = 0 
		
		se(total == 0){
			limpa()
			escreva("Nenhum filme cadastrado!\n")	
			escreva("Pressione Enter para continuar!")
			leia(pausa)	
			retorne
		}
		senao{
			limpa()
			escreva("====================================\n")
			escreva("Digite o nome do filme para buscar: \n")
			escreva("====================================\n")
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
		
	//Renan - Alugar um filme
	funcao alugarFilmes(cadeia alugarFilms[][], inteiro total){
			cadeia pausa
			inteiro contadorAlugar = 0

		se(total == 0){
			limpa()
			escreva("Nenhum filme cadastrado!\n")	
			escreva("Pressione Enter para continuar!")
			leia(pausa)
			retorne
		}
		senao{

			inteiro filmeLocado = 0
			limpa()
			escreva("=======================\n")
			escreva("Filmes disponiveis para locação: \n")
			escreva("=======================\n")
		
			para(inteiro i = 0; i < total; i++){
				
				se(alugarFilms[i][3] == "N"){
					contadorAlugar++
					escreva(i+1,". Nome: ", alugarFilms[i][0]," | ")
					escreva("Ano: ", alugarFilms[i][1], "\n")
					escreva("=======================\n")
				}		
			
			}		
				escreva("Escolha um filme para locar: ")
				leia(filmeLocado)
				
				filmeLocado = filmeLocado - 1
				
				escreva("O filme: ", alugarFilms[filmeLocado][0], " | Ano: ", alugarFilms[filmeLocado][1], " Foi locado por você. Obrigado!")

					 alugarFilms[filmeLocado][3] = "S"
					 
					 inteiro validmaislocado = ti.cadeia_para_inteiro(alugarFilms[filmeLocado][2], 10)
					 alugarFilms[filmeLocado][2] = ti.inteiro_para_cadeia(validmaislocado + 1,10)
				
		}	
			se(contadorAlugar == 0){
				escreva("Todos os filmes estão locados!")
			}
					escreva("Pressione Enter para continuar!")
					leia(pausa)
	}

	//Renan - Devolver um filme
	funcao devolverFilme(cadeia devolverFilms[][], inteiro total){
			cadeia pausa
			inteiro contadorDevolver = 0

		se(total == 0){
			limpa()
			escreva("Nenhum filme cadastrado!\n")	
			escreva("Pressione Enter para continuar!")
			leia(pausa)
			retorne
		}
		senao{

			inteiro filmeDevolvido = 0
			limpa()
			escreva("=======================\n")
			escreva("Filmes disponiveis para devolução: \n")
			escreva("=======================\n")
		
			para(inteiro i = 0; i < total; i++){
				
				se(devolverFilms[i][3] == "S"){
					contadorDevolver++
					escreva(i+1,". Nome: ", devolverFilms[i][0]," | ")
					escreva("Ano: ", devolverFilms[i][1], "\n")
					escreva("=======================\n")
				}		
			
			}		
				escreva("Escolha um filme para devolver: ")
				leia(filmeDevolvido)
				
				filmeDevolvido = filmeDevolvido - 1
				limpa()
				escreva("O filme: ", devolverFilms[filmeDevolvido][0], " | Ano: ", devolverFilms[filmeDevolvido][1], " Foi devolvido por você. Obrigado!")

					 devolverFilms[filmeDevolvido][3] = "N"
				
		}	

			se(contadorDevolver == 0){
				escreva("Todos os filmes estão locados!")
			}
					
			escreva("Pressione Enter para continuar!")
			leia(pausa)	
	}

	//Vitor - Filme mais locado
	funcao maisLocado(cadeia maisLoc[][], inteiro total){ 
		inteiro i, j, k, filmeML = 0, counter = 0
		cadeia pausa
		
		se(total == 0){
			limpa()
			escreva("Nenhum filme cadastrado!\n")	
			escreva("Pressione Enter para continuar!")
			leia(pausa)
			retorne
		}
		senao{
		
			para(i = 0; i < total; i++){
				se(ti.cadeia_para_inteiro(maisLoc[i][2], 10) > filmeML){
				filmeML = ti.cadeia_para_inteiro(maisLoc[i][2], 10)
				}
			}
			
				para(j = 0; j < total; j++){
					se(ti.cadeia_para_inteiro(maisLoc[j][2], 10) == filmeML){
					counter++
					}
				}
						se(counter == 1){
						limpa()
						escreva("=======================\n")
						escreva("Filme mais locado: \n")
						escreva("=======================\n")
						}senao{
						limpa()
						escreva("=======================\n")
						escreva("Filmes mais locados: \n")
						escreva("=======================\n")
						}
							para(k = 0; k < total; k++){
								se(ti.cadeia_para_inteiro(maisLoc[k][2], 10) == filmeML){
								escreva("Nome: ", maisLoc[k][0]," | ")
								escreva("Ano: ", maisLoc[k][1], " | ")
								escreva("Vezes locado: ", maisLoc[k][2], "\n")											
								}

							}
		}

	}

	// Weliton - Atualizar dados de um filme
	funcao atualizarFilmes(cadeia matriz[][], inteiro total){
		cadeia nomeFilme, pausa, novoNome, resposta
    		inteiro encontrado = 0, opcao

    		limpa()

    		se(total == 0){
    			escreva("Nenhum filme cadastrado!\n")
    			escreva("Pressione Enter para continuar!")
			leia(pausa)
    			retorne
   		}
    		senao{
        	escreva("============================\n")
        	escreva("      ATUALIZAR FILME       \n")
        	escreva("============================\n")

        	escreva("Digite o nome do filme que deseja atualizar: ")
        	leia(nomeFilme)

        		nomeFilme = t.caixa_alta(nomeFilme)

			para(inteiro i = 0; i < total; i++){

            		se(matriz[i][0] == nomeFilme){
					encontrado = 1

                	limpa()

                	escreva("Filme encontrado!\n")
                	escreva("============================\n")
                	escreva("Nome: ", matriz[i][0], "\n")
                	escreva("Ano: ", matriz[i][1], "\n")
                	escreva("Vezes locados: ", matriz[i][2], "\n")
                	escreva("Alugado: ", matriz[i][3], "\n")

                	escreva("============================\n")
                	escreva("O que deseja atualizar?\n")
                	escreva("1 - Nome do filme\n")
                	escreva("2 - Ano de lançamento\n")
                	escreva("3 - Quantidade de locações\n")
                	escreva("4 - Situação do filme (S/N)\n")
                	escreva("5 - Atualizar todos os dados\n")
                	escreva("0 - Cancelar\n")

                	escreva("\nEscolha uma opção: ")
                		leia(opcao)

                		escolha(opcao){

                    	caso 1:
                        	escreva("Digite o novo nome: ")
					leia(novoNome)

					matriz[i][0] = t.caixa_alta(novoNome)

					escreva("\nNome atualizado com sucesso!")
                    	pare

                    	caso 2:
					escreva("Digite o novo ano: ")
					leia(matriz[i][1])

					escreva("\nAno atualizado com sucesso!")
					pare
                    	caso 3:

					escreva("Digite a nova quantidade de locações: ")
					leia(matriz[i][2])

					escreva("\nQuantidade atualizada com sucesso!")
                    	pare

					caso 4:
					escreva("O filme está alugado? (S/N): ")
					leia(resposta)

					matriz[i][3] = t.caixa_alta(resposta)

					escreva("\nSituação atualizada com sucesso!")
                    pare

                    caso 5:
					escreva("Digite o novo nome: ")
					leia(novoNome)

					matriz[i][0] = t.caixa_alta(novoNome)

					escreva("Digite o novo ano: ")
					leia(matriz[i][1])

					escreva("Digite a quantidade de locações: ")
					leia(matriz[i][2])

					escreva("O filme está alugado? (S/N): ")
					leia(resposta)

					matriz[i][3] = t.caixa_alta(resposta)

					escreva("\nTodos os dados foram atualizados!")
                    pare

                    caso 0:

                        escreva("\nAtualização cancelada!")
                    pare

                    caso contrario:

                        escreva("\nOpção inválida!")
                    pare
                		}
            		}
			}

        				se(encontrado == 0){
            				escreva("\nFilme não encontrado!")
        				}
    		}

						escreva("\nPressione Enter para continuar!")
    							leia(pausa)
	}
	
	funcao inicio()
	{
		inteiro menu = 0, i, i3 = 0, totalCadastrados = 0
		cadeia matriz[10][4], pausa, men

		faca{
			limpa()
			escreva("1. Cadastrar um filme \n2. Listar Filmes locados e disponíveis \n3. Filmes locados \n4. Alugar um filme \n5. Devolver um filme \n6. Filme mais locado \n7. Buscar um filme pelo nome \n8. Atualizar dados de um filme \n9. Estatísticas gerais \n10. Sair do programa \n\nQual A sua escolha? ")
			leia(men)
			escreva("\n")

			
			faca{
			se(nao ti.cadeia_e_inteiro(men, 10)){
				escreva("Entrada inválida! Digite utilizando apenas números:  \n")
				leia(men)
				i = 15
			}

			senao{
				menu = ti.cadeia_para_inteiro(men, 10)
				se(menu < 0 ou menu > 10){
					escreva("Entrada inválida! Digite um numero entre 1 e 10  \n")
					u.aguarde(2000)
					//leia(men)
					i = 15
				}
				/*
				se(nao ti.cadeia_e_inteiro(men, 10)){
				escreva("Entrada inválida! Digite utilizando apenas números:  \n")
				leia(men)
				i = 15
			}*/
					
				i = 11
			}
			}enquanto(i == 15)
			
	
					
			escolha(menu){
				caso 1: // Ryan/Weliton - Cadastrar FIlme
					se(totalCadastrados < 10){
					adFilmes(matriz, totalCadastrados)
					totalCadastrados = totalCadastrados +1
					}senao{
						escreva("O limite de filmes cadastrado foi atingido! (10 filmes)\n")
						escreva("Pressione Enter para continuar.\n")	
						leia(pausa)
					}
					
					
				pare
				caso 2: // Alan = Listar filmes locados e disponiveis
					listarFilmes(matriz, totalCadastrados)
				pare
				caso 3: //Ryan - FIlmes Locados
						filmesLoc(matriz, totalCadastrados)
					
				pare
				caso 4: // Renan - Alugar um filme
						alugarFilmes(matriz, totalCadastrados)
				pare
				caso 5: // Renan - Devolver um filme
						devolverFilme(matriz, totalCadastrados)				
				pare
				caso 6: // Vitor - FIlme mais locado
						maisLocado(matriz, totalCadastrados)
				pare
				caso 7: // Alan - Buscar FIlme pelo Nome
					buscarFilmes(matriz, totalCadastrados)
				
				pare
				caso 8: // Weliton - Atualizar dados de um filme 
					atualizarFilmes(matriz, totalCadastrados)
				pare
				caso 9: // Vitor - Estatistica Geral
				pare
				caso 10:
					escreva("Este Programa vai explodir em:")
					para(i = 10;i > 0; i--){
						escreva("\n",i)
						u.aguarde(300)
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
 * @POSICAO-CURSOR = 4945; 
 * @DOBRAMENTO-CODIGO = [233, 283, 332, 380];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */