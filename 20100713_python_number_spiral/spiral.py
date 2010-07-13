# -*- coding: utf-8 -*-
linha_para_frente = (0, 1)
coluna_para_baixo = (1, 0)
linha_para_tras = (0, -1)
coluna_para_cima = (-1, 0)
    
sequencia_da_espiral = [
    linha_para_frente,
    coluna_para_baixo,
    linha_para_tras,
    coluna_para_cima,
    linha_para_frente
]


def in_range(matriz, i, j):
    return i >= 0 and j >= 0 and i < len(matriz) and j < len(matriz[0])

def possivel(matriz, i, j):
    return in_range(matriz, i, j) and matriz[i][j] == 0
        
def constroiSpiral(ordemI, ordemJ = 0):
    if ordemJ == 0:
        ordemJ = ordemI
        
    definir_linha = [0 for i in range(ordemJ)]
    matriz_resultado = [definir_linha[:] for i in range(ordemI)]
    
    numero_maximo = ordemI * ordemJ 
   
    linha, coluna = 0, 0
    estado_de_incremento = linha_para_frente

    for numero in range(1, numero_maximo + 1):
        matriz_resultado[linha][coluna] = numero
        if not possivel(matriz_resultado, linha + estado_de_incremento[0], coluna + estado_de_incremento[1] ):
            estado_de_incremento = sequencia_da_espiral[sequencia_da_espiral.index(estado_de_incremento) + 1]
        linha += estado_de_incremento[0]
        coluna += estado_de_incremento[1]
        
    return matriz_resultado
