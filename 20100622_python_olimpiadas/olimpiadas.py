# -*- coding: utf-8 -*-
class Pais (object):
    nome = ""
    ouro = 0
    prata = 0
    bronze = 0

    def __init__(self, nome, ouro, prata, bronze):
        self.nome = nome
        self.ouro = ouro
        self.prata = prata
        self.bronze = bronze

    def __lt__(self, pais):
        if self.ouro != pais.ouro:
            return self.ouro < pais.ouro
        if self.prata != pais.prata:
            return self.prata < pais.prata
        if self.bronze != pais.bronze:
            return self.bronze < pais.bronze
        return self.nome > pais.nome

def calcula_ranking(paises):
    ordenada = sorted(paises, reverse = True)
    return [pais.nome for pais in ordenada]
