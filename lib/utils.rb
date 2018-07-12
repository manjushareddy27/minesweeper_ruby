module Utils
  YES = "yes"
  NO = "no"
  YES_OR_NO = ["yes", "no"]
  DIMENSION_SIZE_MIN = 4

  def self.is_i?(str)
    /\A[-+]?\d+\z/ === str
  end

  def self.valid_yes_or_no?(input)
    YES_OR_NO.include?(input)
  end

  def self.is_valid_dimension?(n)
    DIMENSION_SIZE_MIN >= n
  end

  def self.print_welcome_message
    print "welcome to Minesweeper!\n"
  end

  def self.print_mine_message
    print "BOOM! You're dead!"
  end

  def self.print_game_over_message
    print "GAME OVER"
  end

  def self.clear_screen
    system("clear")
  end
  
  def self.print_win_message
    print "Congrats! You won the game!"
  end
end
