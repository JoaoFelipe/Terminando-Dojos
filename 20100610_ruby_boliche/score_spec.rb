require 'rubygems'
require 'spec'
require 'score'


describe Score do
  it 'should be [0,0][0,/][1,0] when score is [0,0][0,/,1]' do
    score = Score.new([[0, 0], [0, "/", 1]])
    score.frames.should == [[0, 0], [0, 10], [1, 0]]
  end
  
  it 'should be [0,0][0,/][1,0] when score is [0,0][X,X,0]' do
    score = Score.new([[0, 0], ["X", "X", 0]])
    score.frames.should == [[0, 0], [10, 10], [0, 0]]
  end
  
  it 'should be [0,0][0,/][1,0] when score is [0,0][X,0,1]' do
    score = Score.new([[0, 0], ["X", 0, 1]])
    score.frames.should == [[0, 0], [10, 0], [1, 0]]
  end
  
  it 'should be [0,0][0,/][1,0] when score is [0,0][X,0,/]' do
    score = Score.new([[0, 0], ["X", 0, "/"]])
    score.frames.should == [[0, 0], [10, 0], [10, 0]]
  end
  
  it 'should return zero when player misses all' do
    score = Score.new([[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0,0]])
    score.calculate.should == 0
  end

  it 'should return 9 when player hits 4 and 5' do
    score = Score.new([[4, 5]])
    score.calculate.should == 9
  end

  it 'should return 15 when player hits [4,5] and [3,3]' do
    score = Score.new([[4, 5], [3,3]])
    score.calculate.should == 15
  end

  it 'should return 10 when player hits [3,/]' do
    score = Score.new([[3, "/"]])
    score.calculate.should == 10
  end

  it 'should return 10 when player hits [X,-]' do
    score = Score.new([["X", "-"]])
    score.calculate.should == 10
  end
  
  it 'should return 21 when player hits [3,/] and [3,5]' do
    score = Score.new([[3, "/"], [3, 5]])
    score.calculate.should == 21
  end
  
  it 'should return 30 when player hits [3,/] and [X,-]' do
    score = Score.new([[3, "/"], ["X", "-"]])
    score.calculate.should == 30
  end
  
  it 'should return 29 when player hits [3,/] and [9,/]' do
    score = Score.new([[3, "/"], [9, "/"]])
    score.calculate.should == 29
  end
  
  it 'should return 28 when player hits [X,-] and [3,6]' do
    score = Score.new([["X", "-"], [3,6]])
    score.calculate.should == 28
  end
  
  it 'should return 30 when player hits [X,-] and [3,/]' do
    score = Score.new([["X", "-"], [3,"/"]])
    score.calculate.should == 30
  end
  
  it 'should return 30 when player hits [X,-] and [X,-]' do
    score = Score.new([["X", "-"], ["X","-"]])
    score.calculate.should == 30
  end
  
  it 'should return 60 when player hits [X,-] and [X,-] and [X,-]' do
    score = Score.new([["X", "-"], ["X","-"], ["X","-"]])
    score.calculate.should == 60
  end
  
  it 'should return 53 when player hits [X,-] and [X,-] and [3,/]' do
    score = Score.new([["X", "-"], ["X","-"], [3,"/"]])
    score.calculate.should == 53
  end
  
  it 'should return 20 when player hits [7,/] and [4,2]' do
    score = Score.new([[7, "/"], [4, 2]])
    score.calculate.should == 20
  end
  
  it 'should return 46 when player hits [X,-] and [X,-] and [4,2]' do
    score = Score.new([["X", "-"], ["X","-"], [4,2]])
    score.calculate.should == 46
  end
  
  it 'should return 78 when player hits [X,-] and [X,-] and [X,-] and [0,9]' do
    score = Score.new([["X", "-"], ["X","-"], ["X","-"], [0, 9]])
    score.calculate.should == 78
  end
  
  it 'should return 57 when player hits [X,-] and [X,-] and [9,0]' do
    score = Score.new([["X", "-"], ["X","-"], [9, 0]])
    score.calculate.should == 57
  end
  
  it 'should return 11 when player hits [9,/,1]' do
    score = Score.new([[9, "/",1]])
    score.calculate.should == 11
  end
  
  it 'should return 20 when player hits [9,/,X]' do
    score = Score.new([[9, "/","X"]])
    score.calculate.should == 20
  end
  
  it 'should return 12 when player hits [X,1,1]' do
    score = Score.new([["X", 1, 1]])
    score.calculate.should == 12
  end
  
  it 'should return 20 when player hits [X,X,0]' do
    score = Score.new([["X", "X", 0]])
    score.calculate.should == 20
  end
  
  it 'should return 50 when player hits [X, -] and [X,X,0]' do
    score = Score.new([["X", "-"], ["X", "X", 0]])
    score.calculate.should == 50
  end
  
  it 'should return 40 when player hits [3, /] and [X,X,0]' do
    score = Score.new([[3, "/"], ["X", "X", 0]])
    score.calculate.should == 40
  end
  
  it 'should return 90 when player hits [X,-] and [X,-] and [X,-] and [X,-]' do
    score = Score.new([["X", "-"], ["X","-"], ["X","-"], ["X","-"]])
    score.calculate.should == 90
  end
  
  it 'should return 300 when player hits [X,-],[X,-],[X,-],[X,-],[X,-],[X,-],[X,-],[X,-],[X,-],[X,X,X]' do
    score = Score.new([["X","-"], ["X","-"], ["X","-"], ["X","-"], ["X","-"], ["X","-"], ["X","-"], ["X","-"], ["X","-"], ["X", "X", "X"]])
    score.calculate.should == 300
  end
  
  it 'should return 152 when player hits [X,-],[X,-],[X,-],[7,2],[8,/],[0,9],[X,-],[7,/],[9,0]' do
    score = Score.new([["X","-"], ["X","-"], ["X","-"], [7,2], [8,"/"], [0,9], ["X","-"], [7,"/"], [9, 0]])
    score.calculate.should == 152
  end
  
  it 'should return 180 when player hits [X,-],[X,-],[X,-],[7,2],[8,/],[0,9],[X,-],[7,/],[9,0],[X,X,8]' do
    score = Score.new([["X","-"], ["X","-"], ["X","-"], [7,2], [8,"/"], [0,9], ["X","-"], [7,"/"], [9, 0],["X","X",8]])
    score.calculate.should == 180
  end
  
  it 'should return 104 when player hits [X,-],[6,0],[9,0],[8,1],[9,/],[6,/],[3,6],[8,0],[8,1],[9,0,0]' do
    score = Score.new([["X","-"], [6,0], [9,0], [8,1], [9,"/"], [6,"/"], [3,6], [8,0], [8, 1],[9,0,0]])
    score.calculate.should == 104
  end
  
  it 'should return 109 when player hits [8,0],[3,5],[6,2],[9,0],[7,/],[6,3],[7,/],[8,0],[0,9],[8,/,6]' do
    score = Score.new([[8,0], [3,5], [6,2], [9,0], [7,"/"], [6,3], [7,"/"], [8,0], [0, 9],[8,"/",6]])
    score.calculate.should == 109
  end
  
  it 'should return 79 when player hits [9,0],[4,2],[0,7],[3,0],[9,0],[8,1],[1,0],[1,6],[8,0],[6,/,X]' do
    score = Score.new([[9,0], [4,2], [0,7], [3,0], [9,0], [8,1], [1,0], [1,6], [8, 0],[6,"/","X"]])
    score.calculate.should == 79
  end
  
end
