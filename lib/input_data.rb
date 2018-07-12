require './lib/minesweeper_error'
require './lib/utils'

class InputData
	attr_accessor  :dimension, :mines, :difficulty

  def initialize(dimension, difficulty)
     @dimension = validate_board_dimension(dimension)
     @difficulty = validate_difficulty(difficulty) 
      case @difficulty 
      when :easy 
        @mines = (@dimension ** 2) / 10
      when :medium
        @mines = (@dimension ** 2) / 7
      when :hard
        @mines = (@dimension ** 2) / 5
      end 

	end

	def validate_board_dimension(dimension)
	  	dimension = dimension.to_i # get board size

	    if Utils.is_valid_dimension?(dimension)
	    	raise InvalidInteger if Utils.is_i?(dimension)
	    	raise InvalidDimensionSize if Utils.is_valid_dimension?(dimension)
	    end
	    return dimension

    rescue InvalidInteger => e
	  	print e.message
	  rescue InvalidDimensionSize => e
	  	print e.message
	end

	def validate_difficulty(diff)

	    diff = diff.downcase.to_sym

	    until [:easy, :medium, :hard].include?(diff)
	      raise InvalidDifficultyOfGame
	    end 
	    return diff

	  rescue InvalidDifficultyOfGame => e
	  	print e.message
	  	retry
	end
end