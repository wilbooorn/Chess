require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_reader :cursor
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

b = Board.new
d = Display.new(b)

b.move_piece([1,6],[3,6])
b.move_piece([6,4],[5,4])
b.move_piece([7,3],[3,7])
d.render
b.move_piece([1,5],[2,5])

d.render
p b.checkmate?(:b)
p b.checkmate?(:w)
# p b.checkmate?(:w)

# while true
#   system("clear")
#   d.render
#   d.cursor.get_input
# end
