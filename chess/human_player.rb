class HumanPlayer
  attr_reader :color

  def initialize(name, display, color)
    @name = name
    @display = display
    @color = color
  end

  def play_turn
    start_pos, end_pos = nil, nil
    while start_pos.nil?
      system("clear")
      @display.render
      start_pos = @display.cursor.get_input
    end
    while end_pos.nil?
      system("clear")
      @display.render
      end_pos = @display.cursor.get_input
    end
    raise "only move your pieces, cheater!" if @display.board[start_pos].color != @color
    @display.board.move_piece(start_pos, end_pos)
  rescue => e
    puts e
    puts "Not a valid move"
    sleep(1)
    retry
  end

end
