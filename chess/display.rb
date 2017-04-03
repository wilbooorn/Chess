require 'colorize'
require_relative 'cursor'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], @board)
  end

  def render
    print "  "
    print (0..7).to_a.join(" ")
    print "\n"
    @board.grid.each_with_index do |row, i|
      print i
      row.each_with_index do |piece, j|
        if [i, j] == @cursor.cursor_pos
          print " #{piece.value}".colorize(:background => :cyan)
        elsif piece.color == :w
          print " #{piece.value}".colorize(:red)
        else
          print " #{piece.value}"
        end
      end
      print "\n"
    end
  end

end
