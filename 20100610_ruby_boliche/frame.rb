class Frame
  SPARE = '/'
  STRIKE = "X"

  attr_accessor "jogada_1","jogada_2"
  def initialize(jogada_1, jogada_2)
    @jogada_1 = jogada_1
    @jogada_2 = jogada_2
  end
  

  def spare?
    @jogada_2 == SPARE
  end

  def strike?
    @jogada_1 == STRIKE
  end

  def sum
    return 10 if spare? or strike?
    @jogada_1 + @jogada_2
  end
  
  def valor_jogada_1
    return 10 if strike?
    @jogada_1 
  end

end
