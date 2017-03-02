load 'board.rb'
load 'moves.rb'

#class Game
class Game
  
  def initialize
    start_game
  end
  
  def start_game
    puts %{Welcome to CHESS GAME!!
      What do you want to do?
        --N-- Start a new game.
        --L-- Load a saved game.
        --E-- Exit.}
    choice = gets.chomp.downcase
    case choice
    when 'n' then new_game
    when 'l' then load_game
    when 'e' then exit
    else 
      puts "I didn't understand, try again!"
      start_game
    end
  end
  
  def new_game    
    print "Enter a name for Player 1: "
    @player1 = Player.new(["\u2654".encode('utf-8'), "\u2655".encode('utf-8'), "\u2657".encode('utf-8'), "\u2658".encode('utf-8'), "\u2656".encode('utf-8'), "\u2659".encode('utf-8')])
    print "Enter a name for Player 2: "
    @player2 = Player.new(["\u265a".encode('utf-8'), "\u265b".encode('utf-8'), "\u265d".encode('utf-8'), "\u265e".encode('utf-8'), "\u265c".encode('utf-8'), "\u265f".encode('utf-8')])
    @board = Board.new(@player1, @player2)
    @board.show
    @curr_player = @player1
    play
  end
  
  def play
    puts %{#{@curr_player.name}, you can make a move, save your game or Exit the game!!
      c2-c4 : Moves the piece in: c2 To: c4.
      2c-4c : Moves the piece in: c2 To: c4.
        s   : Save the game.
        e   : Exit the game.}    
    print "Please type your selection: "
    choise = gets.chomp.downcase
    case choise
    when 's' then save_game
    when 'e' then exit
    else
      make_move(choise)
    end
  end
  
  def make_move(move)
    move = move.split('-')
    start_position = move[0]
    start = convert_position(start_position)
    finish_position = move[1]
    finish = convert_position(finish_position)
    if start == @curr_player.king.position
      piece = @curr_player.king
    elsif @curr_player.queen.position == start
      piece = @curr_player.queen
    elsif @curr_player.bishop1.position == start
      piece = @curr_player.bishop1
    elsif @curr_player.bishop2.position == start
      piece = @curr_player.bishop2
    elsif @curr_player.knight1.position == start
      piece = @curr_player.knight1
    elsif @curr_player.knight2.position == start
      piece = @curr_player.knight2
    elsif start == @curr_player.rook1.position
      piece = @curr_player.rook1
    elsif @curr_player.rook2.position == start
      piece = @curr_player.rook2
    elsif @curr_player.pawn1.position == start
      piece = @curr_player.pawn1
    elsif @curr_player.pawn2.position == start
      piece = @curr_player.pawn2
    elsif @curr_player.pawn3.position == start
      piece = @curr_player.pawn3
    elsif @curr_player.pawn4.position == start
      piece = @curr_player.pawn4
    elsif @curr_player.pawn5.position == start
      piece = @curr_player.pawn5
    elsif @curr_player.pawn6.position == start
      piece = @curr_player.pawn6
    elsif @curr_player.pawn7.position == start
      piece = @curr_player.pawn7
    elsif @curr_player.pawn8.position == start
      piece = @curr_player.pawn8
    end
    if @curr_player == @player1 && ( piece == @player1.pawn1 || 
    piece == @player1.pawn2 || piece == @player1.pawn3 || 
    piece == @player1.pawn4 || piece == @player1.pawn5 || 
    piece == @player1.pawn6 || piece == @player1.pawn7 || 
    piece == @player1.pawn8 )
      posible_moves = piece.move2(start)
    else
      posible_moves = piece.move(start)
    end
    if posible_moves.include?(finish)
      piece.position = finish
      @board.show(piece.piece, start, finish)
      switch_players
      play
    else
      puts "Wrong input, try again."
      play
    end
  end
  
  def convert_position(position)
    position = position.split("")
    if position.none? { |coord| coord.between?("1", "8") } || position.none? { |coord| coord.between?("a", "h") }
      puts "Wrong input. Try again."
      
      play
    end
    axis_y = ["a", "b", "c", "d", "e", "f", "g", "h"]
    if axis_y.include?(position[0])
      position[0] = axis_y.index(position[0]) + 1
      order = position.shift
      position << order
      position[0] = position[0].to_i
    end
    if axis_y.include?(position[1])
      position[1] = axis_y.index(position[1]) + 1
      position[0] = position[0].to_i
    end
    position
  end
  
  def switch_players
    if @curr_player == @player1
      @curr_player = @player2
    else
      @curr_player = @player1
    end
  end
end

Game.new
