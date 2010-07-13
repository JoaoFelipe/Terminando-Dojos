# Exemplo rspec ruby
# "spec banheiro_spec.rb" to run on Terminal


require 'rubygems'
require 'spec'
require 'sinuca'

describe Jogada do
  it 'acerta a bola da vez 1 e nao mata deve retornar 0' do
    bola_da_vez = 1
    bola_alvo = bola_da_vez
    acertou = true
    matou = false
    condicao = $normal
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).pontos().should == 0
  end

  it 'erra a bola da vez 1 e nao mata perde o ponto da bola da vez' do
    bola_da_vez = 1
    bola_alvo = bola_da_vez
    acertou = false
    matou = false
    condicao = $normal
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).pontos().should == -1
  end

  it 'erra a bola da vez 2 e nao mata perde o ponto da bola da vez' do
    bola_da_vez = 2
    bola_alvo = bola_da_vez
    acertou = false
    matou = false
    condicao = $normal
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).pontos().should == -2
  end

  it 'arrisca bola 7 e nao mata perde o ponto da bola com bola da vez 2' do
    bola_da_vez = 2
    bola_alvo = 7
    acertou = true
    matou = false
    condicao = $normal
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).pontos().should == -7
  end
  
  it 'acerta a bola da vez 1 e mata deve retornar 1' do
    bola_da_vez = 1
    bola_alvo = bola_da_vez
    acertou = true
    matou = true
    condicao = $normal
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).pontos().should == 1
  end
  
  it 'arrisca a bola 7 e mata deve retornar 7' do
    bola_da_vez = 1
    bola_alvo = 7
    acertou = true
    matou = true
    condicao = $normal
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).pontos().should == 7
  end
  
  it 'arrisca a bola 7 com direito e mata deve retornar 7' do
    bola_da_vez = 2
    bola_alvo = 7
    acertou = true
    matou = true
    condicao = $direito
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).pontos().should == 7
  end
  
  it 'arrisca a bola 7 com direito e não mata deve retornar 0' do
    bola_da_vez = 2
    bola_alvo = 7
    acertou = true
    matou = false
    condicao = $direito
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).pontos().should == 0
  end
  
  it 'arrisca a bola 7 com direito e erra, sendo a bola da vez = 2, deve retornar -2' do
    bola_da_vez = 2
    bola_alvo = 7
    acertou = false
    matou = false
    condicao = $direito
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).pontos().should == -2
  end
  
  it 'arrisca a bola 7 com obrigatoriedade de ir na bola da vez = 2, deve retornar -7' do
    bola_da_vez = 2
    bola_alvo = 7
    acertou = true
    matou = false
    condicao = $obrigatoriedade
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).pontos().should == -7
  end
  
  it 'acerta a bola da vez com obrigatoriedade de ir na bola da vez = 2, deve retornar 0' do
    bola_da_vez = 2
    bola_alvo = 2
    acertou = true
    matou = false
    condicao = $obrigatoriedade
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).pontos().should == 0
  end
  
  it 'mata a bola da vez com obrigatoriedade de ir na bola da vez = 2, deve retornar 2' do
    bola_da_vez = 2
    bola_alvo = 2
    acertou = true
    matou = true
    condicao = $obrigatoriedade
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).pontos().should == 2
  end
  
  it 'erra a bola da vez com obrigatoriedade de ir na bola da vez = 2, deve retornar -2' do
    bola_da_vez = 2
    bola_alvo = 2
    acertou = false
    matou = true
    condicao = $obrigatoriedade
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).pontos().should == -2
  end
  
  it 'proxima condicao: deve ser outro_jogador se errou' do
    bola_da_vez = 2
    bola_alvo = 2
    acertou = false
    matou = false
    condicao = $normal
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).proxima_condicao().should == $outro_jogador
  end
  
  it 'proxima condicao: deve ser outro_jogador se não matou' do
    bola_da_vez = 2
    bola_alvo = 2
    acertou = true
    matou = false
    condicao = $normal
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).proxima_condicao().should == $outro_jogador
  end
  
  it 'proxima condicao: deve ser direito se matou bola_da_vez' do
    bola_da_vez = 2
    bola_alvo = 2
    acertou = true
    matou = true
    condicao = $normal
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).proxima_condicao().should == $direito
  end
  
  it 'proxima condicao: deve ser obrigatoriedade se matou bola que não era da vez' do
    bola_da_vez = 2
    bola_alvo = 3
    acertou = true
    matou = true
    condicao = $normal
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).proxima_condicao().should == $obrigatoriedade
  end
  
  it 'proxima condicao: deve ser normal se matou bola qualquer em situação de direito' do
    bola_da_vez = 2
    bola_alvo = 3
    acertou = true
    matou = true
    condicao = $direito
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).proxima_condicao().should == $normal
  end
  
  it 'proxima condicao: deve ser direito se matou bola da vez em situação de obrigatoriedade' do
    bola_da_vez = 2
    bola_alvo = 2
    acertou = true
    matou = true
    condicao = $obrigatoriedade
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).proxima_condicao().should == $direito
  end

  it 'proxima condicao: deve ser outro_jogador se matou outra bola qualquer em situação de obrigatoriedade' do
    bola_da_vez = 2
    bola_alvo = 3
    acertou = true
    matou = true
    condicao = $obrigatoriedade
    Jogada.new(bola_da_vez, bola_alvo, acertou, matou, condicao).proxima_condicao().should == $outro_jogador
  end

end

describe 'pontuacao_de_jogo' do
  
  it 'empate
      jogador não mata bola 1' do
    jogada1 = JogadaBase.new(1, true, false)
    bola_da_vez = 1
    lista_de_jogadas = [jogada1]
    pontuacao_de_jogo(bola_da_vez, lista_de_jogadas).should == "empate"
  end
  
  it 'jogador2 vence
      jogador1 não mata bola 1
      jogador2 mata bola 1' do
    jogada1 = JogadaBase.new(1, true, false)
    jogada2 = JogadaBase.new(1, true, true)
    bola_da_vez = 1
    lista_de_jogadas = [jogada1, jogada2]
    pontuacao_de_jogo(bola_da_vez, lista_de_jogadas).should == ["jogador2", 1]
  end
  
  it 'jogador2 vence
      jogador1 não mata bola 1
      jogador2 mata bola 1, bola 7, erra a bola 7' do
    jogada1 = JogadaBase.new(1, true, false)
    jogada2 = JogadaBase.new(1, true, true)
    jogada3 = JogadaBase.new(7, true, true)
    jogada4 = JogadaBase.new(7, true, false)
    bola_da_vez = 1
    lista_de_jogadas = [jogada1, jogada2, jogada3, jogada4]
    pontuacao_de_jogo(bola_da_vez, lista_de_jogadas).should == ["jogador2", 1]
  end
  
  it 'jogador1 vence
      jogador1 não mata bola 1
      jogador2 mata bola 1, bola 7, erra a bola 7 
      jogador1 mata a bola 3' do
    jogada1 = JogadaBase.new(1, true, false)
    jogada2 = JogadaBase.new(1, true, true)
    jogada3 = JogadaBase.new(7, true, true)
    jogada4 = JogadaBase.new(7, true, false)
    jogada5 = JogadaBase.new(3, true, true)
    bola_da_vez = 1
    lista_de_jogadas = [jogada1, jogada2, jogada3, jogada4, jogada5]
    pontuacao_de_jogo(bola_da_vez, lista_de_jogadas).should == ["jogador1", 2]
  end
  
  it 'jogador2 vence
      jogador1 não mata bola 1
      jogador2 mata bola 1, bola 7, erra a bola 7 
      jogador1 mata a bola 3 e arrisca em hora errada na bola 7' do
    jogada1 = JogadaBase.new(1, true, false)
    jogada2 = JogadaBase.new(1, true, true)
    jogada3 = JogadaBase.new(7, true, true)
    jogada4 = JogadaBase.new(7, true, false)
    jogada5 = JogadaBase.new(3, true, true)
    jogada6 = JogadaBase.new(7, true, false)
    bola_da_vez = 1
    lista_de_jogadas = [jogada1, jogada2, jogada3, jogada4, jogada5, jogada6]
    pontuacao_de_jogo(bola_da_vez, lista_de_jogadas).should == ["jogador2", 5]
  end
  
  it 'jogador2 vence
      jogador1 não mata bola 1
      jogador2 mata bola 1, bola 7, erra a bola 7 
      jogador1 mata a bola 3 e arrisca em hora errada na bola 7
      jogador2 erra todas as bolas' do
    jogada1 = JogadaBase.new(1, true, false)
    jogada2 = JogadaBase.new(1, true, true)
    jogada3 = JogadaBase.new(7, true, true)
    jogada4 = JogadaBase.new(7, true, false)
    jogada5 = JogadaBase.new(3, true, true)
    jogada6 = JogadaBase.new(7, true, false)
    jogada7 = JogadaBase.new(7, false, false)
    bola_da_vez = 1
    lista_de_jogadas = [jogada1, jogada2, jogada3, jogada4, jogada5, jogada6, jogada7]
    pontuacao_de_jogo(bola_da_vez, lista_de_jogadas).should == ["jogador2", 3]
  end
  
  it 'jogador2 vence
      jogador1 não mata bola 1
      jogador2 mata bola 1, bola 7, erra a bola 7 
      jogador1 mata a bola 3 e arrisca em hora errada na bola 7
      jogador2 erra todas as bolas
      jogador1 mata bola 2' do
    jogada1 = JogadaBase.new(1, true, false)
    jogada2 = JogadaBase.new(1, true, true)
    jogada3 = JogadaBase.new(7, true, true)
    jogada4 = JogadaBase.new(7, true, false)
    jogada5 = JogadaBase.new(3, true, true)
    jogada6 = JogadaBase.new(7, true, false)
    jogada7 = JogadaBase.new(7, false, false)
    jogada8 = JogadaBase.new(2, true, true)
    bola_da_vez = 1
    lista_de_jogadas = [jogada1, jogada2, jogada3, jogada4, jogada5, jogada6, jogada7, jogada8]
    pontuacao_de_jogo(bola_da_vez, lista_de_jogadas).should == ["jogador2", 1]
  end
  
  it 'jogador1 vence
      jogador1 não mata bola 1
      jogador2 mata bola 1, bola 7, erra a bola 7 
      jogador1 mata a bola 3 e arrisca em hora errada na bola 7
      jogador2 erra todas as bolas
      jogador1 mata bola 2, bola 7 e bola 7' do
    jogada1 = JogadaBase.new(1, true, false)
    jogada2 = JogadaBase.new(1, true, true)
    jogada3 = JogadaBase.new(7, true, true)
    jogada4 = JogadaBase.new(7, true, false)
    jogada5 = JogadaBase.new(3, true, true)
    jogada6 = JogadaBase.new(7, true, false)
    jogada7 = JogadaBase.new(7, false, false)
    jogada8 = JogadaBase.new(2, true, true)
    jogada9 = JogadaBase.new(7, true, true)
    jogada10 = JogadaBase.new(7, true, true)
    bola_da_vez = 1
    lista_de_jogadas = [jogada1, jogada2, jogada3, jogada4, jogada5, jogada6, jogada7, jogada8, jogada9, jogada10]
    pontuacao_de_jogo(bola_da_vez, lista_de_jogadas).should == ["jogador1", 13]
  end
  
  it 'jogador1 vence
      jogador1 não mata bola 1
      jogador2 mata bola 1, bola 7, erra a bola 7 
      jogador1 mata a bola 3 e arrisca em hora errada na bola 7
      jogador2 erra todas as bolas
      jogador1 mata bola 2, bola 7 e bola 7 e arrisca em hora errada a 7' do
    jogada1 = JogadaBase.new(1, true, false)
    jogada2 = JogadaBase.new(1, true, true)
    jogada3 = JogadaBase.new(7, true, true)
    jogada4 = JogadaBase.new(7, true, false)
    jogada5 = JogadaBase.new(3, true, true)
    jogada6 = JogadaBase.new(7, true, false)
    jogada7 = JogadaBase.new(7, false, false)
    jogada8 = JogadaBase.new(2, true, true)
    jogada9 = JogadaBase.new(7, true, true)
    jogada10 = JogadaBase.new(7, true, true)
    jogada11 = JogadaBase.new(7, true, false)
    bola_da_vez = 1
    lista_de_jogadas = [jogada1, jogada2, jogada3, jogada4, jogada5, jogada6, jogada7, jogada8, jogada9, jogada10, jogada11]
    pontuacao_de_jogo(bola_da_vez, lista_de_jogadas).should == ["jogador1", 6]
  end
  
  it 'empate
      jogador1 não mata bola 1
      jogador2 mata bola 1, bola 7, erra a bola 7 
      jogador1 mata a bola 3 e arrisca em hora errada na bola 7
      jogador2 erra todas as bolas
      jogador1 mata bola 2, bola 7 e bola 7 e arrisca em hora errada a 7
      jogador2 mata bola 6' do
    jogada1 = JogadaBase.new(1, true, false)
    jogada2 = JogadaBase.new(1, true, true)
    jogada3 = JogadaBase.new(7, true, true)
    jogada4 = JogadaBase.new(7, true, false)
    jogada5 = JogadaBase.new(3, true, true)
    jogada6 = JogadaBase.new(7, true, false)
    jogada7 = JogadaBase.new(7, false, false)
    jogada8 = JogadaBase.new(2, true, true)
    jogada9 = JogadaBase.new(7, true, true)
    jogada10 = JogadaBase.new(7, true, true)
    jogada11 = JogadaBase.new(7, true, false)
    jogada12 = JogadaBase.new(6, true, true)
    bola_da_vez = 1
    lista_de_jogadas = [jogada1, jogada2, jogada3, jogada4, jogada5, jogada6, jogada7, jogada8, jogada9, jogada10, jogada11, jogada12]
    pontuacao_de_jogo(bola_da_vez, lista_de_jogadas).should == "empate"
  end
  
  it 'jogador1 faz pontuação máxima' do
    jogada1 = JogadaBase.new(1, true, true)
    jogada2 = JogadaBase.new(2, true, true)
    jogada3 = JogadaBase.new(3, true, true)
    jogada4 = JogadaBase.new(4, true, true)
    jogada5 = JogadaBase.new(5, true, true)
    jogada6 = JogadaBase.new(6, true, true)
    jogada7 = JogadaBase.new(7, true, true)
    bola_da_vez = 1
    lista_de_jogadas = [jogada7, jogada1, jogada7,
                        jogada7, jogada2, jogada7,
                        jogada7, jogada3, jogada7,
                        jogada7, jogada4, jogada7,
                        jogada7, jogada5, jogada7,
                        jogada7, jogada6, jogada7,
                        jogada7]
    pontuacao_de_jogo(bola_da_vez, lista_de_jogadas).should == ["jogador1", 112]
  end
  
  it 'jogador2 faz pontuação máxima' do
    jogada0 = JogadaBase.new(1, true, false)
    jogada1 = JogadaBase.new(1, true, true)
    jogada2 = JogadaBase.new(2, true, true)
    jogada3 = JogadaBase.new(3, true, true)
    jogada4 = JogadaBase.new(4, true, true)
    jogada5 = JogadaBase.new(5, true, true)
    jogada6 = JogadaBase.new(6, true, true)
    jogada7 = JogadaBase.new(7, true, true)
    bola_da_vez = 1
    lista_de_jogadas = [jogada0,
                        jogada7, jogada1, jogada7,
                        jogada7, jogada2, jogada7,
                        jogada7, jogada3, jogada7,
                        jogada7, jogada4, jogada7,
                        jogada7, jogada5, jogada7,
                        jogada7, jogada6, jogada7,
                        jogada7]
    pontuacao_de_jogo(bola_da_vez, lista_de_jogadas).should == ["jogador2", 112]
  end
  
  it 'jogador1 faz pontuação maxima a partir da bola 5' do
    jogada5 = JogadaBase.new(5, true, true)
    jogada6 = JogadaBase.new(6, true, true)
    jogada7 = JogadaBase.new(7, true, true)
    bola_da_vez = 5
    lista_de_jogadas = [jogada7, jogada5, jogada7,
                        jogada7, jogada6, jogada7,
                        jogada7]
    pontuacao_de_jogo(bola_da_vez, lista_de_jogadas).should == ["jogador1", 46]
  end
  
  it 'jogador2 vence
      jogador1 mata bola 5, arrisca com direito a 7
      jogador2 mata a bola6' do
    jogada1 = JogadaBase.new(5, true, true)
    jogada2 = JogadaBase.new(7, true, false)
    jogada3 = JogadaBase.new(6, true, true)
    bola_da_vez = 5
    lista_de_jogadas = [jogada1, jogada2, jogada3]
    pontuacao_de_jogo(bola_da_vez, lista_de_jogadas).should == ["jogador2", 1]
  end
  
end