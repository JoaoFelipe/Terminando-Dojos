# -*- coding: utf-8 -*-
import unittest
from espiral import Matriz, lista_sequencial

class TestVerificaListaOrdenada(unittest.TestCase):

    def test_lista_1_esta_ordenada(self):
        self.assertTrue(lista_sequencial([1]))

    def test_lista_1_2_esta_ordenada(self):
        self.assertTrue(lista_sequencial([1,2]))
        
    def test_lista_2_3_esta_ordenada(self):
        self.assertTrue(lista_sequencial([2,3]))

    def test_lista_1_2_3_4_esta_ordenada(self):
        self.assertTrue(lista_sequencial([1,2,3,4]))

    def test_lista_1_2_4_3_nao_esta_ordenada(self):
        self.assertFalse(lista_sequencial([1,2,4,3]))

    def test_lista_1_2_3_4_nao_esta_ordenada_reversamente(self):
        self.assertFalse(lista_sequencial([1,2,3,4], reverso=True))

    def test_lista_4_3_2_1_esta_ordenada_reversamente(self):
        self.assertTrue(lista_sequencial([4,3,2,1], reverso=True))

    def test_lista_3_4_2_1_nao_esta_ordenada_reversamente(self):
        self.assertFalse(lista_sequencial([3,4,2,1], reverso=True))

    def test_lista_1_3_nao_esta_sequecialmente_ordenada(self):
        self.assertFalse(lista_sequencial([1,3]))

    def test_lista_4_3_esta_sequecialmente_ordenada_reversamente(self):
        self.assertTrue(lista_sequencial([4,3], reverso=True))
        
       
class TestVerificaMatrizEspiral(unittest.TestCase):

    def test_matriz_1_x_1_retorna_true(self):
        matriz = Matriz([
            [1],
        ])
        self.assertTrue(matriz.eh_matriz_espiral())

    def test_matriz_1_x_2_retorna_true(self):
        matriz = Matriz([
            [1, 2],
        ])
        self.assertTrue(matriz.eh_matriz_espiral())

    def test_matriz_1_x_2_retorna_false(self):
        matriz = Matriz([
            [1, 3],
        ])
        self.assertFalse(matriz.eh_matriz_espiral())
        
    def test_matriz_2_x_2_retorna_true(self):
        matriz = Matriz([
            [1, 2],
            [4, 3],
        ])
        self.assertTrue(matriz.eh_matriz_espiral())

    def test_matriz_2_x_2_retorna_false_pela_primeira_linha(self):
        matriz = Matriz([
            [1, 5],
            [4, 3],
        ])
        self.assertFalse(matriz.eh_matriz_espiral())

    def test_matriz_2_x_2_retorna_false_pela_segunda_linha(self):
        matriz = Matriz([
            [1, 2],
            [4, 4],
        ])
        self.assertFalse(matriz.eh_matriz_espiral())
        
    def test_matriz_3_x_3_retorna_true(self):
        matriz = Matriz([
            [1, 2, 3],
            [8, 9, 4],
            [7, 6, 5],
        ])
        self.assertTrue(matriz.eh_matriz_espiral())
        
    def test_matriz_3_x_3_retorna_false_pela_primeira_linha(self):
        matriz = Matriz([
            [1, 5, 3],
            [8, 9, 4],
            [7, 6, 5],
        ])
        self.assertFalse(matriz.eh_matriz_espiral())
        
    def test_matriz_3_x_3_retorna_false_pela_ultima_coluna(self):
        matriz = Matriz([
            [1, 2, 3],
            [8, 9, 5],
            [7, 6, 5],
        ])
        self.assertFalse(matriz.eh_matriz_espiral())
        
    def test_matriz_3_x_3_retorna_false_pela_ultima_linha(self):
        matriz = Matriz([
            [1, 2, 3],
            [8, 9, 4],
            [7, 8, 5],
        ])
        self.assertFalse(matriz.eh_matriz_espiral())    
        
    def test_matriz_3_x_3_retorna_false_pela_primeira_coluna(self):
        matriz = Matriz([
            [1, 2, 3],
            [9, 9, 4],
            [7, 6, 5],
        ])
        self.assertFalse(matriz.eh_matriz_espiral())    
        
    def test_matriz_3_x_3_retorna_false_pelo_segundo_elemento_da_segunda_linha(self):
        matriz = Matriz([
            [1, 2, 3],
            [8, 7, 4],
            [7, 6, 5],
        ])
        self.assertFalse(matriz.eh_matriz_espiral())    
    
    def test_matriz_4_x_3_retorna_true(self):
        matriz = Matriz([
            [ 1,  2, 3],
            [10, 11, 4],
            [ 9, 12, 5],
            [ 8,  7, 6],
        ])
        self.assertTrue(matriz.eh_matriz_espiral())
        
    def test_matriz_5_x_4_retorna_true(self):
        matriz = Matriz([
            [ 1,  2,  3, 4],
            [14, 15, 16, 5],
            [13, 20, 17, 6],
            [12, 19, 18, 7],
            [11, 10,  9, 8],
        ])
        self.assertTrue(matriz.eh_matriz_espiral())
        
    def test_matriz_5_x_6_retorna_true(self):
        matriz = Matriz([
            [ 1,  2,  3,  4,  5,  6],
            [18, 19, 20, 21, 22,  7],
            [17, 28, 29, 30, 23,  8],
            [16, 27, 26, 25, 24,  9],
            [15, 14, 13, 12, 11, 10],
        ])
        self.assertTrue(matriz.eh_matriz_espiral())
        
    def test_matriz_6_x_5_retorna_true(self):
        matriz = Matriz([
            [ 1,  2,  3,  4,  5],
            [18, 19, 20, 21,  6],
            [17, 28, 29, 22,  7],
            [16, 27, 30, 23,  8],
            [15, 26, 25, 24,  9],
            [14, 13, 12, 11, 10],
        ])
        self.assertTrue(matriz.eh_matriz_espiral())
        
      
    def test_matriz_1_x_4_retorna_true(self):
        matriz = Matriz([
            [1, 2, 3, 4],
        ])
        self.assertTrue(matriz.eh_matriz_espiral())

    def test_matriz_4_x_1_retorna_true(self):
        matriz = Matriz([
            [1],
            [2],
            [3],
            [4],
        ])
        self.assertTrue(matriz.eh_matriz_espiral())
    
    def test_matriz_2_x_3_retorna_true(self):   
        matriz = Matriz([
            [1, 2, 3],
            [6, 5, 4],
        ])
        self.assertTrue(matriz.eh_matriz_espiral())
        
    def test_matriz_3_x_2_retorna_true(self):  
        matriz = Matriz([
            [1, 2],
            [6, 3],
            [5, 4],
        ])
        self.assertTrue(matriz.eh_matriz_espiral())
     
        
if __name__ == '__main__':
    unittest.main()
