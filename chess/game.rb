require_relative 'display'
require_relative 'human_player'
class Game
  def initialize(player1, player2, board, display)
    @board = board
    @display = display
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def play
    until @board.checkmate?(:w) || @board.checkmate?(:b)
      puts "#{@current_player.color}'s turn"
      @current_player.play_turn
      switch_player
    end
    @display.render
    if @board.checkmate?(:w)
      puts "Black wins!"
    else
      puts "White wins"
    end
  end

end
b = Board.new
d = Display.new(b)
p1 = HumanPlayer.new("Robin", d, :w)
p2 = HumanPlayer.new("Mark", d, :b)
g = Game.new(p1, p2, b, d)
g.play
