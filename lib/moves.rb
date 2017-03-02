#class Player
class Player
  attr_accessor :name, :king, :queen, :bishop1, :bishop2, :knight1, :knight2, :rook1, :rook2
  attr_accessor :pawn1, :pawn2, :pawn3, :pawn4, :pawn5, :pawn6, :pawn7, :pawn8
  
  def initialize(pieces)
    name = gets.chomp.upcase
    @name = name
    @king = King.new(pieces[0])
    @queen = Queen.new(pieces[1])
    @bishop1 = Bishop.new(pieces[2])
    @bishop2 = Bishop.new(pieces[2])
    @knight1 = Knight.new(pieces[3])
    @knight2 = Knight.new(pieces[3])
    @rook1 = Rook.new(pieces[4])
    @rook2 = Rook.new(pieces[4])
    @pawn1 = Pawn.new(pieces[5])
    @pawn2 = Pawn.new(pieces[5])
    @pawn3 = Pawn.new(pieces[5])
    @pawn4 = Pawn.new(pieces[5])
    @pawn5 = Pawn.new(pieces[5])
    @pawn6 = Pawn.new(pieces[5])
    @pawn7 = Pawn.new(pieces[5])
    @pawn8 = Pawn.new(pieces[5])
  end  
end

class King
  attr_accessor :position, :piece 
  def initialize(piece)
    @position = position
    @piece = piece
  end
  def move(position)
    posibles = [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [-1, -1], [1, -1], [-1, 1]]
    select_moves(position, posibles)   
  end  
end

class Queen
  attr_accessor :position, :piece 
  def initialize(piece)
    @position = position
    @piece = piece
  end
  def move(position)
    posibles = [
      [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],
      [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7],
      [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],
      [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0],
      [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
      [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7],
      [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7],
      [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]
    ]
    select_moves(position, posibles)
  end
end

class Bishop
  attr_accessor :position, :piece 
  def initialize(piece)
    @position = position
    @piece = piece
  end
  def move(position)
    posibles = [
      [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
      [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7],
      [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7],
      [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]
    ]
    select_moves(position, posibles)
  end
end
 
class Knight
  attr_accessor :position, :piece 
  def initialize(piece)
    @position = position
    @piece = piece
  end
  def move(position)
    posibles = [[-2,-1],[-2,1],[-1,-2],[-1,2],[2,-1],[2,1],[1,-2],[1,2]]
    select_moves(position, posibles)
  end
end

class Rook
  attr_accessor :position, :piece 
  def initialize(piece)
    @position = position
    @piece = piece
  end
  def move(position)
    posibles = [
      [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],
      [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7],
      [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],
      [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]
    ]
    select_moves(position, posibles)
  end
end
 
class Pawn
  attr_accessor :position, :piece, :path
  def initialize(piece)
    @position = position
    @piece = piece
    @path = 0
  end
  def move(position)
    if @path == 0
      posibles = [[1, 0], [2, 0]]
      @path += 1
    else
      posibles = [[1, 0], [1, -1], [1, 1]]
      @path += 1
    end
    select_moves(position, posibles)
  end
  def move2(position, path = 0)
    if @path == 0
      posibles = [[-1, 0], [-2, 0]]
      @path += 1
    else
      posibles = [[-1, 0], [-1, 1], [-1, -1]]
      @path += 1
    end
    select_moves(position, posibles)
  end
end

#Select the posible moves for the piece
def select_moves(position, posibles)
  moves = []
  posibles.each { |move| moves << [position[0] + move[0], position[1] + move[1]] }
  moves = moves.select { |move| move[0].between?(1,8) && move[1].between?(1,8) }
end


p "KING", King.new("\u2654").move([2,4])
p "QUEEN", Queen.new("\u2655").move([2,4])
p "BISHOP", Bishop.new("\u2656").move([2,4])
p "KNIGHT", Knight.new("\u2657").move([2,4])
p "ROOK", Rook.new("\u2658").move([2,4])
p "PAWN1", Pawn.new("\u2659").move([2,4])
p "PAWN2", Pawn.new("\u2659").move([4,4])
p "PAWN1", Pawn.new("\u2659").move2([7,4])
p "PAWN2", Pawn.new("\u2659").move2([6,4])