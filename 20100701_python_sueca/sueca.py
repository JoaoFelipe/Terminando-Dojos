# -*- coding: utf-8 -*-
valores = {
    'A':11,
    '7':10,
    'K':4,
    'J':3,
    'Q':2,
    '2':0,
    '3':0,
    '4':0,
    '5':0,
    '6':0,
}

class Carta(object):

    def __init__(self, naipe, nome):
        self.naipe = naipe
        self.nome = nome
        self.valor = valores[self.nome]

    def __gt__(self, carta):
        if self.valor == carta.valor == 0:
            return int(self.nome)>int(carta.nome)
        return self.valor > carta.valor
        

class Jogada(object):
    def __init__(self, nome, carta):
        self.nome = nome
        self.carta = carta
    
    def __gt__(self, jogada):
        return self.carta > jogada.carta
        


def somatorio(jogadas):
    return sum([jogada.carta.valor for jogada in jogadas])

def maior_carta(jogadas, trunfo):
    jogadas_avaliadas = [jogada for jogada in jogadas if jogada.carta.naipe == trunfo] or [jogada for jogada in jogadas if jogada.carta.naipe == jogadas[0].carta.naipe]  
    #Naipe Trunfo>Naipe inicial>Outros Naipes
    return max(jogadas_avaliadas)

def rodada(jogadas, trunfo):
    pontos_vencedor = somatorio(jogadas)
    vencedor = maior_carta(jogadas,trunfo).nome
    
    return (vencedor, pontos_vencedor)
