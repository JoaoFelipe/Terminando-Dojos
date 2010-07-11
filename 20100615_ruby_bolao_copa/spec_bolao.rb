require 'rubygems'
require 'spec'
require 'bolao'

describe 'bolao' do

  it 'deve retornar 0 pontos quando toda aposta estiver errada' do
    aposta = Resultado.new(0, 0)
    resultado_final = Resultado.new(2, 1)
    aposta.pontuacao_resultado(resultado_final).should == 0
  end

  it 'deve retornar 1 ponto quando acerta gols do time B' do
    aposta = Resultado.new(0, 1)
    resultado_final = Resultado.new(2, 1)
    aposta.pontuacao_resultado(resultado_final).should == 1
  end

  it 'deve retornar 1 ponto quando acerta gols do time A' do
    aposta = Resultado.new(2, 0)
    resultado_final = Resultado.new(2, 3)
    aposta.pontuacao_resultado(resultado_final).should == 1
  end

  it 'deve retornar 2 pontos quando acerta empate' do
    aposta = Resultado.new(0, 0)
    resultado_final = Resultado.new(1, 1)
    aposta.pontuacao_resultado(resultado_final).should == 2
  end

  it 'deve retornar 2 pontos quando acerta time A ganha' do
    aposta = Resultado.new(1, 0)
    resultado_final = Resultado.new(2, 1)
    aposta.pontuacao_resultado(resultado_final).should == 2
  end
  
  it 'deve retornar 4 pontos quando acerta time A ganha e numero de gols' do
      aposta = Resultado.new(2, 1)
      resultado_final = Resultado.new(2, 1)
      aposta.pontuacao_resultado(resultado_final).should == 4
  end
  
  it 'deve retornar 4 pontos quando acerta time B ganha e numero de gols' do
      aposta = Resultado.new(1, 2)
      resultado_final = Resultado.new(1, 2)
      aposta.pontuacao_resultado(resultado_final).should == 4
  end

  it 'deve retornar 1 ponto quando acerta gols do time B' do
      aposta = Resultado.new(1, 2)
      resultado_final = Resultado.new(1, 1)
      aposta.pontuacao_resultado(resultado_final).should == 1
  end
  
  it '"Mario" nao acerta nada' do
    aposta1 = Apostas.new("Mario", [Resultado.new(0, 0)])
    resultados = [Resultado.new(2, 1)]
    lista_de_apostas = [aposta1]
    bolao(lista_de_apostas,resultados).should == [["Mario", 0]]
  end
  
  it '"Mario" acerta um resultadoo' do
    aposta1 = Apostas.new("Mario", [Resultado.new(0, 1)])
    resultados = [Resultado.new(2, 1)]
    lista_de_apostas = [aposta1]
    bolao(lista_de_apostas,resultados).should == [["Mario", 1]]
  end
  
  it '"Mario" acerta vitoria' do
    aposta1 = Apostas.new("Mario", [Resultado.new(1, 0)])
    resultados = [Resultado.new(2, 1)]
    lista_de_apostas = [aposta1]
    bolao(lista_de_apostas,resultados).should == [["Mario", 2]]
  end
  
  it '"Mario" acerta uma vitoria e um resultado' do
    aposta1 = Apostas.new("Mario", [Resultado.new(1, 0), Resultado.new(1, 0)])
    resultados = [Resultado.new(2, 1), Resultado.new(1, 0)]
    lista_de_apostas = [aposta1]
    bolao(lista_de_apostas,resultados).should == [["Mario", 6]]
  end
  
  it '"Mario" acerta uma vitoria e um empate ,mas erra os pontos' do
    aposta1 = Apostas.new("Mario", [Resultado.new(1, 0), Resultado.new(2, 2)])
    resultados = [Resultado.new(2, 1), Resultado.new(1, 1)]
    lista_de_apostas = [aposta1]
    bolao(lista_de_apostas,resultados).should == [["Mario", 4]]
  end
  
  it '"Mario" acerta uma vitoria e um empate' do
    aposta1 = Apostas.new("Mario", [Resultado.new(1, 0), Resultado.new(1, 1)])
    resultados = [Resultado.new(2, 1), Resultado.new(1, 1)]
    lista_de_apostas = [aposta1]
    bolao(lista_de_apostas,resultados).should == [["Mario", 6]]
  end
  
  it '"João" acerta um resultado e ganha de "Mario" que nao acerta nada' do
    aposta1 = Apostas.new("Mario", [Resultado.new(0, 0)])
    aposta2 = Apostas.new("João", [Resultado.new(0, 1)])
    resultados = [Resultado.new(2, 1)]
    lista_de_apostas = [aposta1,aposta2]
    bolao(lista_de_apostas,resultados).should == [["João", 1],["Mario", 0]]
  end
  
  it '"João" acerta uma partida e ganha de "Mario" acerta um placar' do
    aposta1 = Apostas.new("Mario", [Resultado.new(3, 2),Resultado.new(3, 2)])
    aposta2 = Apostas.new("João", [Resultado.new(0, 1),Resultado.new(1, 1)])
    resultados = [Resultado.new(0, 1),Resultado.new(0, 2)]
    lista_de_apostas = [aposta1,aposta2]
    bolao(lista_de_apostas,resultados).should == [["João", 4],["Mario", 1]]
  end
  
  it '"João" acerta uma partida e ganha de "Mario" acerta um placar (inverso)' do
    aposta1 = Apostas.new("Mario", [Resultado.new(3, 2),Resultado.new(3, 2)])
    aposta2 = Apostas.new("João", [Resultado.new(0, 1),Resultado.new(1, 1)])
    resultados = [Resultado.new(0, 1),Resultado.new(0, 2)]
    lista_de_apostas = [aposta2,aposta1]
    bolao(lista_de_apostas,resultados).should == [["João", 4],["Mario", 1]]
  end
  
  it '"Mario" acerta uma partida e ganha de "Joao" acerta um placar' do
    aposta1 = Apostas.new("João", [Resultado.new(3, 2),Resultado.new(3, 2)])
    aposta2 = Apostas.new("Mario", [Resultado.new(0, 1),Resultado.new(1, 1)])
    resultados = [Resultado.new(0, 1),Resultado.new(0, 2)]
    lista_de_apostas = [aposta1,aposta2]
    bolao(lista_de_apostas,resultados).should == [["Mario", 4],["João", 1]]
  end
  
  it '"Mario" acerta uma partida e ganha de "Joao" acerta um placar, ambos erram ultima partida' do
    aposta1 = Apostas.new("João", [Resultado.new(3, 2),Resultado.new(3, 2),Resultado.new(3, 2)])
    aposta2 = Apostas.new("Mario", [Resultado.new(0, 1),Resultado.new(1, 1),Resultado.new(3, 2)])
    resultados = [Resultado.new(0, 1),Resultado.new(0, 2),Resultado.new(0, 0)]
    lista_de_apostas = [aposta1,aposta2]
    bolao(lista_de_apostas,resultados).should == [["Mario", 4],["João", 1]]
  end
  
  it '"Mario" acerta uma partida e erra a oura de "Joao" acerta estado de 2 partidas' do
    aposta1 = Apostas.new("João", [Resultado.new(3, 2),Resultado.new(3, 2),Resultado.new(3, 2)])
    aposta2 = Apostas.new("Mario", [Resultado.new(1, 0),Resultado.new(0, 1),Resultado.new(3, 2)])
    resultados = [Resultado.new(1, 0),Resultado.new(1, 0),Resultado.new(0, 0)]
    lista_de_apostas = [aposta1,aposta2]
    bolao(lista_de_apostas,resultados).should == [["João", 4],["Mario", 4]]
  end
  
  it '"Mario" acerta uma partida e erra a oura de "Joao" acerta estado de 2 partidas, Ana erra 3 partidas' do
    aposta1 = Apostas.new("João", [Resultado.new(3, 2),Resultado.new(3, 2),Resultado.new(3, 2)])
    aposta2 = Apostas.new("Mario", [Resultado.new(1, 0),Resultado.new(0, 1),Resultado.new(3, 2)])
    aposta3 = Apostas.new("Ana", [Resultado.new(0, 1),Resultado.new(0, 1),Resultado.new(3, 2)])
    resultados = [Resultado.new(1, 0),Resultado.new(1, 0),Resultado.new(0, 0)]
    lista_de_apostas = [aposta1,aposta2,aposta3]
    bolao(lista_de_apostas,resultados).should == [["João", 4],["Mario", 4],["Ana", 0]]
  end

  it '"Ana" acerta uma partida e erra a oura de "Joao" acerta estado de 2 partidas. Empate, Ana ganha pelo nome' do
    aposta1 = Apostas.new("João", [Resultado.new(3, 2),Resultado.new(3, 2),Resultado.new(3, 2)])
    aposta2 = Apostas.new("Ana", [Resultado.new(1, 0),Resultado.new(0, 1),Resultado.new(3, 2)])
    resultados = [Resultado.new(1, 0),Resultado.new(1, 0),Resultado.new(0, 0)]
    lista_de_apostas = [aposta1,aposta2]
    bolao(lista_de_apostas,resultados).should == [["Ana", 4],["João", 4]]
  end
  

end
