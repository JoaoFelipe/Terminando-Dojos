$outro_jogador = -1
$normal = 0
$direito = 1
$obrigatoriedade = 2


class JogadaBase
  
  def initialize(bola_alvo, acertou, matou)
    @bola_alvo = bola_alvo
    @acertou = acertou
    @matou = matou
  end
  
  def gerarJogada(bola_da_vez, condicao)
    return Jogada.new(bola_da_vez, @bola_alvo, @acertou, @matou, condicao)
  end
  
end


class Jogada

  def initialize(bola_da_vez, bola_alvo, acertou, matou, condicao)
    @bola_da_vez = bola_da_vez
    @bola_alvo = bola_alvo
    @acertou = acertou
    @matou = matou
    @condicao = condicao
  end

  def tentou_bola_da_vez
    if @matou
      @bola_alvo
    else
      0
    end
  end
  
  def nao_tentou_bola_da_vez
    if @condicao == $obrigatoriedade
      return -@bola_alvo
    end
      
    if @matou
      @bola_alvo
    elsif @condicao == $direito
      0
    else
      -@bola_alvo
    end
  end
  
  def pontos
    if not @acertou
      return -@bola_da_vez
    end
    
    if @bola_alvo == @bola_da_vez
      tentou_bola_da_vez
    else
      nao_tentou_bola_da_vez
    end
  end
  
  def proxima_condicao
    if not @matou or not @acertou
      return $outro_jogador
    end
    
    if @condicao == $normal
      if @bola_alvo == @bola_da_vez
        $direito
      else
        $obrigatoriedade
      end
    elsif @condicao == $direito
      $normal
    else 
      if @bola_alvo == @bola_da_vez
        $direito
      else
        $outro_jogador
      end
    end 
  end
  
  def matou_bola_da_vez?
    return ((@bola_alvo == @bola_da_vez) and @matou)
  end
  
end

def pontuacao_de_jogo(bola_da_vez_inicial, jogadas)
  pontuacao = 0
  jogador = 1
  bola_da_vez = bola_da_vez_inicial
  condicao = $normal
  
  jogadas.each do |jogadabase|
    jogada = jogadabase.gerarJogada(bola_da_vez, condicao)    
    pontuacao += jogada.pontos()*jogador 
    bola_da_vez += 1 if jogada.matou_bola_da_vez?
    condicao = jogada.proxima_condicao()
    if condicao == $outro_jogador  
      jogador *= -1
      condicao = $normal 
    end
  end
 
  
 
  return ["jogador2", -pontuacao] if pontuacao < 0
  return ["jogador1", pontuacao] if pontuacao > 0
  "empate"
end
