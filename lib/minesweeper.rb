require './lib/utils'
require './lib/minesweeper_error'
require './lib/game_board'
require './lib/tile'
require './lib/parser'
require './lib/input_data'
require 'yaml' 

class Minesweeper

	attr_reader :dimension, :difficulty, :board


	def initialize(dimension, difficulty)
    Utils.clear_screen
		@input = InputData.new(dimension, difficulty)
	  @flags_remaining = @input.mines
    @board = GameBoard.new(@input.dimension, @input.mines)
    @game_over = false
    @timer_set = false
    @score = 0
    @difficulty = @input.difficulty
	end

	def attempt(x, y)
		@parser = Parser.new(@board, @flags_remaining, @difficulty)
    input = @parser.parse_input(x, y)

    if input.nil?
    	print "Invalid Positions\n"
    else
	    cds = input[:pos]
	    open_tile_board(cds)
	    tile = @board.get_tile(cds)
	    adjct_mines = tile.adjacent_mine_count
	    status
	    print "#{adjct_mines} adjacent mines \n"
	  end 
	end

	def display
		@board.display      
	end


	def status
    if @board.won? 
    	Utils.print_win_message

      print "You win the game!"
      @board.end_display
      game_complete
    elsif @game_over
    	Utils.print_mine_message
      print "You loose !"
      @board.end_display
    else
    	print "Still Playing"
    end    
  end 

  private

  def change_flag(pos)
    flag = @board.get_tile(pos).flagged
    if flag && @board.remove_flag(pos)
      @flags_remaining += 1
    elsif @flags_remaining > 0 && @board.add_flag(pos)
      @flags_remaining -= 1
    else 
      print "You're out of flags"
      print ">"
    end 
  end 

  def open_tile_board(cds)
    states = @board.reveal_tile(cds) 
    if states[:game_over]
      @game_over = true
    elsif !states[:valid]
      print "Invalid move"
      print ">"
    end 
  end
  
end