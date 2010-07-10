# -*- coding: utf-8 -*-
import unittest
from sueca import Carta
from sueca import somatorio
from sueca import rodada
from sueca import Jogada

class TestGanhadorDaRodada(unittest.TestCase):

    def test_jogador_1_ganha_com_A_copas_trunfo_Copas(self):
        jogadas = [
            Jogada('Alice', Carta('Copas', 'A')),
            Jogada('Bob', Carta('Copas', '3')),
            Jogada('Charlie', Carta('Copas', '4')),
            Jogada('Debora', Carta('Copas', '5')),
        ]
        trunfo = "Copas"
        self.assertEquals(rodada(jogadas, trunfo), ('Alice', 11))

    def test_jogador_2_ganha_com_A_copas_trunfo_Copas(self):
        jogadas = [
            Jogada('Alice', Carta('Copas', '3')),
            Jogada('Bob', Carta('Copas', 'A')),
            Jogada('Charlie', Carta('Copas', '4')),
            Jogada('Debora', Carta('Copas', '5')),
        ]
        trunfo = "Copas"
        self.assertEquals(rodada(jogadas, trunfo), ('Bob', 11))
        
    def test_jogador_3_ganha_com_4_espada_trunfo_espadas(self):
        jogadas = [
            Jogada('Alice', Carta('Copas', '3')),
            Jogada('Bob', Carta('Copas', 'A')),
            Jogada('Charlie', Carta('Espadas', '4')),
            Jogada('Debora', Carta('Copas', '5')),
        ]
        trunfo = "Espadas"
        self.assertEquals(rodada(jogadas, trunfo), ('Charlie', 11))
    
    def test_jogador_4_ganha_com_5_espada_trunfo_espadas(self):
        jogadas = [
            Jogada('Alice', Carta('Copas', '3')),
            Jogada('Bob', Carta('Copas', 'A')),
            Jogada('Charlie', Carta('Espadas', '4')),
            Jogada('Debora', Carta('Espadas', '5')),
        ]
        trunfo = "Espadas"
        self.assertEquals(rodada(jogadas, trunfo), ('Debora', 11))
        
    def test_jogador_2_ganha_com_A_copas_trunfo_Ouros(self):
        jogadas = [
            Jogada('Alice', Carta('Copas', '3')),
            Jogada('Bob', Carta('Copas', 'A')),
            Jogada('Charlie', Carta('Espadas', '4')),
            Jogada('Debora', Carta('Espadas', '5')),
        ]
        trunfo = "Ouros"
        self.assertEquals(rodada(jogadas, trunfo), ('Bob', 11))
        
    def test_jogador_1_ganha_com_3_copas_trunfo_Ouros(self):
        jogadas = [
            Jogada('Alice', Carta('Copas', '3')),
            Jogada('Bob', Carta('Paus', 'A')),
            Jogada('Charlie', Carta('Espadas', '4')),
            Jogada('Debora', Carta('Espadas', '5')),
        ]
        trunfo = "Ouros"
        self.assertEquals(rodada(jogadas, trunfo), ('Alice', 11))
        
    def test_jogador_3_ganha_com_4_Ouros_trunfo_Ouros(self):
        jogadas = [
            Jogada('Alice', Carta('Copas', '4')),
            Jogada('Bob', Carta('Paus', 'A')),
            Jogada('Charlie', Carta('Ouros', '4')),
            Jogada('Debora', Carta('Espadas', '5')),
        ]
        trunfo = "Ouros"
        self.assertEquals(rodada(jogadas, trunfo), ('Charlie', 11))
        
    def test_jogador_3_ganha_com_K_Ouros_trunfo_Ouros(self):
        jogadas = [
            Jogada('Alice', Carta('Copas', '4')),
            Jogada('Bob', Carta('Paus', 'A')),
            Jogada('Charlie', Carta('Ouros', 'K')),
            Jogada('Debora', Carta('Copas', '5')),
        ]
        trunfo = "Ouros"
        self.assertEquals(rodada(jogadas, trunfo), ('Charlie', 15))

class TestSomatorioMesa(unittest.TestCase):
    def test_2_3_4_5_retorna_0(self):
        jogadas = [
            Jogada('Alice', Carta('Copas', '2')),
            Jogada('Bob', Carta('Copas', '3')),
            Jogada('Charlie', Carta('Copas', '4')),
            Jogada('Debora', Carta('Copas', '5')),
        ]
        self.assertEquals(somatorio(jogadas), 0)

    def test_A_3_4_5_retorna_11(self):
        cartas = [
            Jogada('Alice', Carta('Copas', 'A')),
            Jogada('Bob', Carta('Copas', '3')),
            Jogada('Charlie', Carta('Copas', '4')),
            Jogada('Debora', Carta('Copas', '5'))]
        self.assertEquals(somatorio(cartas), 11)
        
    def test_A_3_A_5_retorna_22(self):
        cartas = [
            Jogada('Alice', Carta('Copas', 'A')),
            Jogada('Bob', Carta('Copas', '3')),
            Jogada('Charlie', Carta('Espadas', 'A')),
            Jogada('Debora', Carta('Copas', '5'))]
        self.assertEquals(somatorio(cartas), 22)

if __name__ == '__main__':
    unittest.main()
