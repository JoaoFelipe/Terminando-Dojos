# -*- coding: utf-8 -*-
class Matriz(object):

    def __init__(self, nova_matriz):
        self.matriz = nova_matriz

    def elemento(self, i, j):
        return self.matriz[i][j]

    @property
    def num_colunas(self):
        return len(self.matriz[0])

    @property
    def num_linhas(self):
        return len(self.matriz)

    def primeira_linha(self):
        return self.linha(0)
    
    def ultima_linha(self):
        return self.linha(-1)
        
    def primeira_coluna(self):
        return self.coluna(0)
        
    def ultima_coluna(self):
        return self.coluna(-1)

    def linha(self, i):
        return self.matriz[i]
        
    def coluna(self, i):
        return [self.matriz[linha][i] for linha in range(len(self.matriz))]
        
    def matriz_interna(self):
        matriz = []
        for i in range(1, self.num_linhas-1):
            linha = [self.matriz[i][j] for j in range(1, self.num_colunas-1)]
            matriz.append(linha)    
        return Matriz(matriz)
        
    def eh_matriz_nula(self):
        return self.matriz == [] or self.matriz.count([]) > 0
            

    def eh_matriz_espiral(self):
        verificando = Matriz(self.matriz)
        eh_espiral = True
        while eh_espiral and not verificando.eh_matriz_nula():
            #verificar primeira linha
            eh_espiral = lista_sequencial(verificando.primeira_linha())
            if verificando.num_linhas != 1:
                #verificar ultima coluna
                eh_espiral = eh_espiral and lista_sequencial(verificando.ultima_coluna())
                #verificar ultima linha
                eh_espiral = eh_espiral and lista_sequencial(verificando.ultima_linha(), reverso=True)
                #verificar primeira coluna
                if verificando.num_colunas != 1:
                    perimetro = 2*(verificando.num_linhas + verificando.num_colunas - 2)
                    primeiro_elemento = verificando.elemento(0, 0)
                    primeira_coluna = [] 
                    primeira_coluna.append(primeiro_elemento)
                    primeira_coluna += [primeiro_elemento + perimetro - i for i in range(1, verificando.num_linhas)]         
                    eh_espiral = eh_espiral and primeira_coluna == verificando.primeira_coluna()  
                    #verificar segundo elemento da segunda linha
                    if verificando.num_colunas > 2 and verificando.num_linhas > 2 :
                        eh_espiral = eh_espiral and verificando.elemento(1, 1) == verificando.elemento(0, 0) + perimetro
            #passar para matriz interna
            verificando = verificando.matriz_interna()          
        return eh_espiral

def lista_sequencial(lista, reverso = False):
    if not reverso:
        return lista == range(lista[0], len(lista)+ lista[0])
    return lista == range(lista[0], lista[-1] -1, -1)
