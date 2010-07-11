require 'array'
require 'frame'

class Score
  attr_accessor "frames"
  def initialize(frames)
    jogadas = []
    frames_usage = frames
    frames_usage.each do |frame|
      jogadas.push(frame) if frame.length == 2
      if frame.length == 3 
        frame[0] = 10 if frame[0] == "X"
        frame[1] = 10 if frame[1] == "X"
        frame[2] = 10 if frame[2] == "X" or frame[2] == "/"
        frame[1] = 10-frame[0] if frame[1] == "/"
        jogadas.push([frame[0],frame[1]], [frame[2], 0])
      end
    end
    @frames = jogadas
  end
  
  def calculate
    score = 0
    
    for i in 0..@frames.length-1 do
      frame = Frame.new(@frames[i][0], @frames[i][1])
      score += frame.sum
      if frame.spare? and @frames.in_range(i+1) 
        nextframe = Frame.new(@frames[i+1][0],@frames[i+1][1]) 
        score += nextframe.valor_jogada_1
      end
      if frame.strike? and @frames.in_range(i+1) 
        nextframe = Frame.new(@frames[i+1][0],@frames[i+1][1])
        if nextframe.strike? and @frames.in_range(i+2) 
          nextnextframe = Frame.new(@frames[i+2][0],@frames[i+2][1])
          score += nextframe.valor_jogada_1
          score += nextnextframe.valor_jogada_1
        else
          score += nextframe.sum
        end
      end
    end
    score
    
  end

end
