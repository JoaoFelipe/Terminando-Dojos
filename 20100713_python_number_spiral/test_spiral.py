# -*- coding: utf-8 -*-
import unittest
from spiral import constroiSpiral

class TestSpiral(unittest.TestCase):
    
    def test_spiral_1x1(self):
        retorno = [[1]]
        self.assertEqual(constroiSpiral(1), retorno)
        
    def test_spiral_2x2(self):
        retorno = [
                    [1, 2],
                    [4, 3],
        ]
        self.assertEqual(constroiSpiral(2), retorno)
    
    def test_spiral_3x3(self):
        retorno = [
                    [1, 2, 3],
                    [8, 9, 4],
                    [7, 6, 5],
        ]
        self.assertEqual(constroiSpiral(3), retorno)
        
    def test_spiral_4x4(self):
        retorno = [
                    [1,   2,  3, 4],
                    [12, 13, 14, 5],
                    [11, 16, 15, 6],
                    [10,  9,  8, 7],
        ]
        self.assertEqual(constroiSpiral(4), retorno)
        
    def test_spiral_1x3(self):
        retorno = [
                    [1,   2,  3],
        ]
        self.assertEqual(constroiSpiral(1,3), retorno)
        
    def test_spiral_2x3(self):
        retorno = [
                    [1,   2,  3],
                    [6,   5,  4],
        ]
        self.assertEqual(constroiSpiral(2,3), retorno)
        
    def test_spiral_4x3(self):
        retorno = [
                    [ 1,   2,  3],
                    [10,  11,  4],
                    [ 9,  12,  5],
                    [ 8,   7,  6],
        ]
        self.assertEqual(constroiSpiral(4,3), retorno)
    
    def test_spiral_6x5(self):
        retorno = [
                    [ 1,  2,  3,  4,  5],
                    [18, 19, 20, 21,  6],
                    [17, 28, 29, 22,  7],
                    [16, 27, 30, 23,  8],
                    [15, 26, 25, 24,  9],
                    [14, 13, 12, 11, 10],
        ]
        self.assertEqual(constroiSpiral(6,5), retorno)        
    
if __name__ == '__main__':
    unittest.main()

    