# -*- coding: utf-8 -*-
def calcula_caminho(matriz):

    posicoes = []

    for linha in matriz:
        if (posicoes == []):
            indice_menor_elemento = -1
            menor_elemento = -1
            for posicao in range(len(linha)):
                if menor_elemento == -1 or linha[posicao]<=menor_elemento:
                    menor_elemento = linha[posicao]
                    indice_menor_elemento = posicao
            posicoes.append(indice_menor_elemento)
        else:
            de_baixo = linha[indice_menor_elemento]
            da_direita = -1
            if indice_menor_elemento+1<= len(linha) -1:
                da_direita = linha[indice_menor_elemento + 1]
            if da_direita <= de_baixo and da_direita != -1:
                indice_menor_elemento +=1
            posicoes.append(indice_menor_elemento)
       
        if indice_menor_elemento == len(linha)-1:
            break
          
    return posicoes
