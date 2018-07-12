require './lib/game_board'

class Tile
  POS_DIFF = [[0,-1],[1,-1],[1,0],[1,1],[0,1],[-1,1], [-1,0],[-1,-1]]
  attr_accessor :bombed, :flagged, :revealed, :pos
  
  def initialize(pos, board)
    @pos = pos # array of two  elements
    @bombed = false
    @flagged = false
    @revealed = false
    @board = board
  
  end
  
  # Returns true if reveal occurs, false otherwise 
  def reveal
    @revealed = true 
    if @bombed
      return false
    elsif adjacent_mine_count == 0
      adjacents.each do |adjacent| 
        unless adjacent.revealed
          adjacent.reveal
        end  
      end    
      return true
    end      
  end
  
  def adjacents
    adjacent_pos = []
    
    POS_DIFF.each do |square_pos|
      x, y = square_pos
      my_x, my_y = @pos
      new_pos = [x + my_x, y + my_y]
      adjacent_pos << new_pos if @board.is_valid?(new_pos)
    end 
    
    adjacent_pos.map { |pos| @board.get_tile(pos) } 
  end 
  
  def adjacent_mine_count 
    adjacents.select { |adj| adj.bombed }.count
  end 
      
  def to_s
    if @flagged
      return "F"
    elsif @revealed
      count = adjacent_mine_count
      return count == 0 ? "_" : "#{count}" 
    else
      return "X"  
    end
  end
        
  end
  
  
    