class Resultado

  attr_accessor "gols_time_a","gols_time_b"
  def initialize(gols_time_a, gols_time_b)
    @gols_time_a = gols_time_a
    @gols_time_b = gols_time_b
  end

  def acertou_gols_time_a(resultado)
    return @gols_time_a == resultado.gols_time_a
  end

  def acertou_gols_time_b(resultado)
    return @gols_time_b == resultado.gols_time_b
  end

  
  def time_a_ganhou?
    return @gols_time_a > @gols_time_b
  end
  
  def empate?
    return @gols_time_a == @gols_time_b
  end
  
  def time_a_perdeu?
    return @gols_time_a < @gols_time_b
  end
  
  def acertou_estado(resultado)
    acertou_vitoria_de_a = (time_a_ganhou? and resultado.time_a_ganhou?)
    acertou_empate = (empate? and resultado.empate?)
    acertou_derrota_de_a = (time_a_perdeu? and resultado.time_a_perdeu?)
    return (acertou_vitoria_de_a or acertou_empate or acertou_derrota_de_a)
  end

  def pontuacao_resultado(resultado_final)
    pontos_feitos = 0
    pontos_feitos += 1 if acertou_gols_time_a(resultado_final)
    pontos_feitos += 1 if acertou_gols_time_b(resultado_final)
    pontos_feitos += 2 if acertou_estado(resultado_final)
    return pontos_feitos
  end

end

class Apostas
  
  attr_accessor "jogador","apostas"
  def initialize(jogador, apostas)
    @jogador = jogador
    @apostas = apostas
  end
  
  def pontos(resultados)
    soma = 0
    for indice in 0..apostas.length-1
      soma += apostas[indice].pontuacao_resultado(resultados[indice])
    end
    return soma
  end
  
end


def bolao(apostas_gerais, resultados)
  resultado_final = []
  apostas = apostas_gerais
  for i in 0..apostas.length-1 do
    maior_pontuacao = -1
    indice_da_maior_pontuacao = -1
    for j in 0..apostas.length-1 do
      if ((apostas[j].pontos(resultados) > maior_pontuacao))
        indice_da_maior_pontuacao = j
        maior_pontuacao = apostas[j].pontos(resultados)
      end
      if ((apostas[j].pontos(resultados) == maior_pontuacao) and (apostas[j].jogador < apostas[indice_da_maior_pontuacao].jogador))
        indice_da_maior_pontuacao = j
        maior_pontuacao = apostas[j].pontos(resultados)
      end
    end
    resultado_final.push([apostas[indice_da_maior_pontuacao].jogador, maior_pontuacao])
    apostas.slice!(indice_da_maior_pontuacao)
  end    
  return resultado_final

end
