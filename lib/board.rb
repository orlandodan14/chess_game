#class Board
class Board
  attr_accessor :cells
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @cells = Array.new(64, " ")
    start_positions
    @positions = [
      [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7], [1,8],
      [2,1], [2,2], [2,3], [2,4], [2,5], [2,6], [2,7], [2,8],
      [3,1], [3,2], [3,3], [3,4], [3,5], [3,6], [3,7], [3,8],
      [4,1], [4,2], [4,3], [4,4], [4,5], [4,6], [4,7], [4,8],
      [5,1], [5,2], [5,3], [5,4], [5,5], [5,6], [5,7], [5,8],
      [6,1], [6,2], [6,3], [6,4], [6,5], [6,6], [6,7], [6,8],
      [7,1], [7,2], [7,3], [7,4], [7,5], [7,6], [7,7], [7,8],
      [8,1], [8,2], [8,3], [8,4], [8,5], [8,6], [8,7], [8,8]
    ]
  end
  
  def start_positions
    @cells[56] = @player1.rook1.piece
    @player1.rook1.position = [8,1]
    @cells[63] = @player1.rook2.piece
    @player1.rook2.position = [8,8]
    @cells[57] = @player1.knight1.piece
    @player1.knight1.position = [8,2]
    @cells[62] = @player1.knight2.piece
    @player1.knight2.position = [8,7]
    @cells[58] = @player1.bishop1.piece
    @player1.bishop1.position = [8,3]
    @cells[61] = @player1.bishop2.piece
    @player1.bishop2.position = [8,6]
    @cells[59] = @player1.queen.piece
    @player1.queen.position = [8,4]
    @cells[60] = @player1.king.piece
    @player1.king.position = [8,5]
    @cells[48] = @player1.pawn1.piece
    @player1.pawn1.position = [7,1]
    @cells[49] = @player1.pawn2.piece
    @player1.pawn2.position = [7,2]
    @cells[50] = @player1.pawn3.piece
    @player1.pawn3.position = [7,3]
    @cells[51] = @player1.pawn4.piece
    @player1.pawn4.position = [7,4]
    @cells[52] = @player1.pawn5.piece
    @player1.pawn5.position = [7,5]
    @cells[53] = @player1.pawn6.piece
    @player1.pawn6.position = [7,6]
    @cells[54] = @player1.pawn7.piece
    @player1.pawn7.position = [7,7]
    @cells[55] = @player1.pawn8.piece
    @player1.pawn8.position = [7,8]
    @cells[0] = @player2.rook1.piece
    @player2.rook1.position = [1,1]
    @cells[7] = @player2.rook2.piece
    @player2.rook2.position = [1,8]
    @cells[1] = @player2.knight1.piece
    @player2.knight1.position = [1,2]
    @cells[6] = @player2.knight2.piece
    @player2.knight2.position = [1,7]
    @cells[2] = @player2.bishop1.piece
    @player2.bishop1.position = [1,3]
    @cells[5] = @player2.bishop2.piece
    @player2.bishop2.position = [1,6]
    @cells[3] = @player2.queen.piece
    @player2.queen.position = [1,4]
    @cells[4] = @player2.king.piece
    @player2.king.position = [1,5]
    @cells[8] = @player2.pawn1.piece
    @player2.pawn1.position = [2,1]
    @cells[9] = @player2.pawn2.piece
    @player2.pawn2.position = [2,2]
    @cells[10] = @player2.pawn3.piece
    @player2.pawn3.position = [2,3]
    @cells[11] = @player2.pawn4.piece
    @player2.pawn4.position = [2,4]
    @cells[12] = @player2.pawn5.piece
    @player2.pawn5.position = [2,5]
    @cells[13] = @player2.pawn6.piece
    @player2.pawn6.position = [2,6]
    @cells[14] = @player2.pawn7.piece
    @player2.pawn7.position = [2,7]
    @cells[15] = @player2.pawn8.piece
    @player2.pawn8.position = [2,8]
  end
  
  def show(piece = nil, start_position = [nil,nil], finish_position = [nil,nil])
    piece.position = finish_position if !piece.nil?
    i = 0
    @positions.each do |position|
      i += 1
      if position == start_position
        @cells[i-1] = " "
      end
      if position == finish_position
        @cells[i-1] = piece.piece
      end
    end
    puts "\n", " --+---+---+---+---+---+---+---+---+"
    puts " 8 | #{@cells[56]} | #{@cells[57]} | #{@cells[58]} | #{@cells[59]} | #{@cells[60]} | #{@cells[61]} | #{@cells[62]} | #{@cells[63]} | => #{@player1.name}"
    puts " --+---+---+---+---+---+---+---+---+"
    puts " 7 | #{@cells[48]} | #{@cells[49]} | #{@cells[50]} | #{@cells[51]} | #{@cells[52]} | #{@cells[53]} | #{@cells[54]} | #{@cells[55]} |"
    puts " --+---+---+---+---+---+---+---+---+"
    puts " 6 | #{@cells[40]} | #{@cells[41]} | #{@cells[42]} | #{@cells[43]} | #{@cells[44]} | #{@cells[45]} | #{@cells[46]} | #{@cells[47]} |"
    puts " --+---+---+---+---+---+---+---+---+"
    puts " 5 | #{@cells[32]} | #{@cells[33]} | #{@cells[34]} | #{@cells[35]} | #{@cells[36]} | #{@cells[37]} | #{@cells[38]} | #{@cells[39]} |"
    puts " --+---+---+---+---+---+---+---+---+"
    puts " 4 | #{@cells[24]} | #{@cells[25]} | #{@cells[26]} | #{@cells[27]} | #{@cells[28]} | #{@cells[29]} | #{@cells[30]} | #{@cells[31]} |"
    puts " --+---+---+---+---+---+---+---+---+"
    puts " 3 | #{@cells[16]} | #{@cells[17]} | #{@cells[18]} | #{@cells[19]} | #{@cells[20]} | #{@cells[21]} | #{@cells[22]} | #{@cells[23]} |"
    puts " --+---+---+---+---+---+---+---+---+"
    puts " 2 | #{@cells[8]} | #{@cells[9]} | #{@cells[10]} | #{@cells[11]} | #{@cells[12]} | #{@cells[13]} | #{@cells[14]} | #{@cells[15]} |"
    puts " --+---+---+---+---+---+---+---+---+"
    puts " 1 | #{@cells[0]} | #{@cells[1]} | #{@cells[2]} | #{@cells[3]} | #{@cells[4]} | #{@cells[5]} | #{@cells[6]} | #{@cells[7]} | => #{@player2.name}"
    puts " --+---+---+---+---+---+---+---+---+"
    puts "   | a | b | c | d | e | f | g | h |", "\n"
  end
end