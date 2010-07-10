# -*- coding: utf-8 -*-
import unittest
from jogo_da_velha import avalia_jogo

class TestJogoDaVelha(unittest.TestCase):

    def test_X_ganha_linha_1(self):
        entrada = [
            ('X', 'X', 'X'),
            ('O', '', ''),
            ('', 'O', ''),
        ]
        self.assertEquals(avalia_jogo(entrada), 'X')

    def test_O_ganha_linha_1(self):
        entrada = [
            ('O', 'O', 'O'),
            ('X', '', ''),
            ('', 'X', ''),
        ]
        self.assertEquals(avalia_jogo(entrada), 'O')

    def test_0_ganha_linha_2(self):
        entrada = [
            ('X', '', ''),
            ('O', 'O', 'O'),
            ('', 'X', ''),
        ]
        self.assertEquals(avalia_jogo(entrada), 'O')

    def test_X_ganha_linha_2(self):
        entrada = [
            ('O', '', ''),
            ('X', 'X', 'X'),
            ('', 'O', ''),
        ]
        self.assertEquals(avalia_jogo(entrada), 'X')

    def test_X_ganha_linha_2_primeira_linha_vazia(self):
        entrada = [
            ('', '', ''),
            ('X', 'X', 'X'),
            ('O', 'O', ''),
        ]
        self.assertEquals(avalia_jogo(entrada), 'X')

    def test_O_ganha_linha_2_primeira_linha_vazia(self):
        entrada = [
            ('', '', ''),
            ('O', 'O', 'O'),
            ('X', 'X', ''),
        ]
        self.assertEquals(avalia_jogo(entrada), 'O')

    def test_X_ganha_coluna_1(self):
        entrada = [
            ('X', '', 'O'),
            ('X', '', ''),
            ('X', 'O', ''),
        ]
        self.assertEquals(avalia_jogo(entrada), 'X')

    def test_O_ganha_coluna_1(self):
        entrada = [
            ('O', '', 'X'),
            ('O', '', ''),
            ('O', 'X', ''),
        ]
        self.assertEquals(avalia_jogo(entrada), 'O')

    def test_X_ganha_coluna_2(self):
        entrada = [
            ('', 'X', 'O'),
            ('', 'X', ''),
            ('O', 'X', ''),
        ]
        self.assertEquals(avalia_jogo(entrada), 'X')

    def test_O_ganha_coluna_2(self):
        entrada = [
            ('', 'O', 'X'),
            ('', 'O', ''),
            ('X', 'O', ''),
        ]
        self.assertEquals(avalia_jogo(entrada), 'O')

    def test_X_ganha_coluna_2_coluna_1_vazia(self):
        entrada = [
            ('', 'X', 'O'),
            ('', 'X', ''),
            ('', 'X', 'O'),
        ]
        self.assertEquals(avalia_jogo(entrada), 'X')

    def test_O_ganha_coluna_2_coluna_1_vazia(self):
        entrada = [
            ('', 'O', 'X'),
            ('', 'O', ''),
            ('', 'O', 'X'),
        ]
        self.assertEquals(avalia_jogo(entrada), 'O')
        
    def test_O_ganha_diagonal_1(self):
        entrada = [
            ('O', 'X', 'X'),
            ('', 'O', ''),
            ('', '', 'O'),
        ]
        self.assertEquals(avalia_jogo(entrada), 'O')
        
    def test_X_ganha_diagonal_1(self):
        entrada = [
            ('X', 'O', 'O'),
            ('', 'X', ''),
            ('', '', 'X'),
        ]
        self.assertEquals(avalia_jogo(entrada), 'X')

    def test_O_ganha_diagonal_2(self):
        entrada = [
            ('X', 'X', 'O'),
            ('', 'O', ''),
            ('O', '', ''),
        ]
        self.assertEquals(avalia_jogo(entrada), 'O')
        
    def test_X_ganha_diagonal_2(self):
        entrada = [
            ('O', 'O', 'X'),
            ('', 'X', ''),
            ('X', '', ''),
        ]
        self.assertEquals(avalia_jogo(entrada), 'X')
        
    def test_velha(self):
        entrada = [
            ('O', 'X', 'X'),
            ('X', 'O', 'O'),
            ('X', 'O', 'X'),
        ]
        self.assertEquals(avalia_jogo(entrada), 'velha')

if __name__ == '__main__':
    unittest.main()
