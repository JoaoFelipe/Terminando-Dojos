def avalia_jogo(entrada):
    return avalia_linhas(entrada)

def avalia_linhas(entrada):
    for i in range(3):
        if entrada[i][0] == entrada [i][1] == entrada[i][2]:
            return entrada[i][0]



    if entrada[0][0] == entrada[0][1] == entrada[0][2]:
        return entrada[0][0]
    if entrada[1][0] == entrada[1][1] == entrada[1][2]:
        return entrada[1][0]
