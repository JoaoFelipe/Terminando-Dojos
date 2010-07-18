# -*- coding: utf-8 -*-
import unittest
from espiral import numeros_espirais

class TestEspiral(unittest.TestCase):
    
    def test_matriz_1_x_1(self):
        self.assertEqual(numeros_espirais(1), [[1]])
        
    def test_matriz_2_x_2(self):
        self.assertEqual(numeros_espirais(2), [
	    [1, 2],
            [4, 3],
        ])
    
    def test_matriz_3_x_3(self):
        self.assertEqual(numeros_espirais(3), [
            [1, 2, 3],
            [8, 9, 4],
            [7, 6, 5],
        ])
        
    def test_matriz_4_x_4(self):
        self.assertEqual(numeros_espirais(4), [
            [1,   2,  3, 4],
            [12, 13, 14, 5],
            [11, 16, 15, 6],
            [10,  9,  8, 7],
        ])
        
    def test_matriz_1_x_3(self):
        self.assertEqual(numeros_espirais(1, 3), [
            [1,   2,  3],
        ])
        
    def test_matriz_2_x_3(self):
        self.assertEqual(numeros_espirais(2, 3), [
            [1,   2,  3],
            [6,   5,  4],
        ])
        
    def test_matriz_4_x_3(self):
        self.assertEqual(numeros_espirais(4, 3), [
            [ 1,   2,  3],
            [10,  11,  4],
            [ 9,  12,  5],
            [ 8,   7,  6],
        ])
    
    def test_matriz_6_x_5(self):
        self.assertEqual(numeros_espirais(6,5), [
            [ 1,  2,  3,  4,  5],
            [18, 19, 20, 21,  6],
            [17, 28, 29, 22,  7],
            [16, 27, 30, 23,  8],
            [15, 26, 25, 24,  9],
            [14, 13, 12, 11, 10],
        ])        
    
if __name__ == '__main__':
    unittest.main()

    