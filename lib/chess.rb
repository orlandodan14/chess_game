require "yaml"
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
    @other_player = @player2
    play
  end
  
  def play
    @board.show(piece = nil, start = nil, finish = nil)
    puts %{#{@curr_player.name}, you can make a move, save your game or Exit the game!!
      c2-c4 : Moves the piece in: c2 To: c4.
      2c-4c : Moves the piece in: c2 To: c4, too.
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
    if move[2] == '-'
      move = move.split('-')
    else
      puts "That isn't a movement, try again!"
      play
    end
    
    start_position = move[0]
    start = convert_position(start_position)
    finish_position = move[1]
    finish = convert_position(finish_position)
    
    piece = nil
    @curr_player.pieces.each do |p|
      if p.position == start
        piece = p
      end
    end
    
    if piece.nil?
      puts "Wrong position for your piece, tray again"
      play
    end
    
    if @curr_player == @player1 && ( @player1.pawns.include?(piece) )
      posible_moves = piece.move2(start, @curr_player, @other_player)
    else
      posible_moves = piece.move(start, @curr_player, @other_player)
    end

    if posible_moves.include?(finish)
      if @curr_player.pawns.include?(piece)
        piece.path += 1
        piece = pawn_crown(@curr_player, piece, finish)
      end
      piece.position = finish
      @other_player.pieces.each do |other_piece|
        if other_piece.position == finish
          @other_player.pieces.delete(other_piece)
        end
      end
      checkmate(piece, start, finish, @curr_player, @other_player)
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
      @other_player = @player1
    else
      @curr_player = @player1
      @other_player = @player2
    end
  end
  
  def pawn_crown(curr_player, piece, finish_position)
    positions = [[1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7], [1,8],
                 [8,1], [8,2], [8,3], [8,4], [8,5], [8,6], [8,7], [8,8]]
    positions.each do |position|
      if position == finish_position
        puts %{#{curr_player.name}, you have crowned a pawn, please select your new piece!!        
      1 => #{curr_player.pieces[0].piece}
      2 => #{curr_player.pieces[1].piece}
      3 => #{curr_player.pieces[2].piece}
      4 => #{curr_player.pieces[3].piece}
      5 => #{curr_player.pieces[4].piece}}      
        print "Please type your selection: "
        
        choise = gets.chomp
        case choise
        when "1" then piece = curr_player.pieces[0]
        when "2" then piece = curr_player.pieces[1]
        when "3" then piece = curr_player.pieces[2]
        when "4" then piece = curr_player.pieces[4]
        when "5" then piece = curr_player.pieces[6]
        end
      end
    end
    piece
  end
  
  def checkmate(piece, start, finish, curr_player, other_player)
    curr_king_moves = []
    other_king_moves = []
    curr_pieces_moves = []
    other_pieces_moves = []
    
    curr_player.pieces.each do |piece|
      if curr_player == @player1 && ( @player1.pawns.include?(piece) )
        moves = piece.move2(piece.position, curr_player, other_player)
        curr_pieces_moves += moves
      elsif piece == curr_player.king
        moves = piece.move(piece.position, curr_player, other_player)
        curr_pieces_moves += moves
        curr_king_moves = moves
      else
        moves = piece.move(piece.position, curr_player, other_player)
        curr_pieces_moves += moves
      end
    end
    
    other_player.pieces.each do |piece|
      if other_player == @player1 && ( @player1.pawns.include?(piece) )
        moves = piece.move2(piece.position, other_player, curr_player)
        other_pieces_moves += moves
      elsif piece == other_player.king
        moves = piece.move(piece.position, other_player, curr_player)
        other_pieces_moves += moves
        other_king_moves = moves
      else
        moves = piece.move(piece.position, other_player, curr_player)
        other_pieces_moves += moves
      end
    end
        
    if other_pieces_moves.include?(curr_player.king.position)
      piece.position = start
      puts "#{curr_player.name}, you are in CHECK!!!!!!!!!!!! Tray again."
    elsif other_king_moves.all? { |move_king| curr_pieces_moves.include?(move_king) } &&
      curr_pieces_moves.include?(other_player.king.position)
      @board.show(piece, start, finish)
      puts "#{curr_player.name}, WON!!!!!!!!!!! CONGRATULATION!!!!!!!!!!!!!"
      exit
     elsif curr_pieces_moves.include?(other_player.king.position)
      puts "#{other_player.name}, you are in CHECK!!!!!!!!!!!!"
      switch_players
    else
      @board.show(piece, start, finish)
      switch_players
    end
        
  end
  
  #Save the game: 
  #Serializes the game object to a file with the chosen name.
  def save_game
    puts "Enter a name for your saved game:"
    name = gets.chomp
    if Dir.exists?("saves")
       File.open("saves/#{name}.sv", 'w') {|file| file.write(YAML::dump(self))}
      puts "Game saved!"
    else
      Dir.mkdir("saves")
       File.open("saves/#{name}.sv", 'w') {|file| file.write(YAML::dump(self))}
      puts "Game saved!"
    end
    
  end
  
  #Takes a name of a saved game object as an argument and loads the object.
  def load_game
    puts 'Please type the name of your game:'
    name = gets.chomp
    if File.exists?("saves/#{name}.sv")
      YAML::load(File.open("saves/#{name}.sv")).play
    elsif Dir.glob('saves/*').empty?
      puts 'No saved games found!'
      start_game
    else
      puts 'Found the following saves:'
      puts Dir.glob('saves/*').join("\n")
      start_game
    end
  end
  
end

game = Game.new
