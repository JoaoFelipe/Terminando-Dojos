# -*- coding: utf-8 -*-
class CampoMinado(object):

    def __init__(self, minas):
        linhas = minas.splitlines()
        campo = []
        for linha in linhas:
            linha = linha.strip()
            if linha:
                campo.append([caracter for caracter in linha])
        self.campo = campo

    def dentro_do_campo(self, linha, coluna):
        return linha >= 0 and linha < len(self.campo) and coluna >= 0 and coluna < len(self.campo[0])
    
    def mina(self, linha, coluna):
        return self.campo[linha][coluna] == '*'
    
    def vazio(self, linha, coluna):
        return self.campo[linha][coluna] == '-'

    def solucao(self):   
        camporesultado = self.campo
        numero_de_linhas = len(self.campo)
        numero_de_colunas = len(self.campo[0])
        for linha in range(numero_de_linhas):
            for coluna in range(numero_de_colunas):
                if not self.mina(linha, coluna):
                    if self.vazio(linha, coluna):
                        camporesultado[linha][coluna] = 0
                    for i in range(-1,2): 
                        for j in range(-1,2):
                            if self.dentro_do_campo(linha+i, coluna+j) and self.mina(linha+i, coluna+j):
                                camporesultado[linha][coluna] += 1
        return camporesultado               

