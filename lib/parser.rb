require './lib/minesweeper'
require './lib/minesweeper_error'

class Parser
  attr_reader :board, :flags_remaining, :diff


  def initialize(board, flags_remaining, diff)
    @board = board
    @flags_remaining = flags_remaining
    @diff = diff
  end

  def parse_input(x, y)
    pos = [x.to_i, y.to_i]      
    if @board.is_valid?(pos)
      {:pos => pos }
    end 
  end
  
  def save
    game_yaml = [@board, @flags_remaining, @diff].to_yaml
    print "Enter a file name to save your game to."
    file_name = $stdin.gets.chomp
    File.open(file_name, "w") do |f|
      f.print game_yaml
    end 
    print "Your game has been saved"
  end
end