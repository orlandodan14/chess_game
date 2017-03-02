require 'chess'

describe 'Game' do
  descrbie 'PLayer' do
    before do
      
    end
  end
  before do
    describe 'Player' do
      describe 'initualize' do
        player1 = Player.new(["\u2654", "\u2655", "\u2656", "\u2657", "\u2658", "\u2659"])
        player1.stub(:gets) { "Orlando" }
        player2 = Player.new(["\u265a", "\u265b", "\u265c", "\u265d", "\u265e", "\u265f"])
        player2.stub(:gets) { "Samuel" }
      end
    end
  end
end
