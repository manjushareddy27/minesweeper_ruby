class MinesweeperError < StandardError; end

class InvalidInteger < MinesweeperError
  def initialize(msg = 'Invalid integer.\n')
    super
  end
end

class InvalidDifficultyOfGame < MinesweeperError
  def initialize(msg = 'Invalid difficulty parameter.\n')
    super
  end
end

class OutOfRange < MinesweeperError
  def initialize(msg = 'The xy coordinates you are trying to reach is out of range.\n')
    super
  end
end

class InvalidFileName < MinesweeperError
  def initialize(msg = "No such file or directory please enter the existed file name")
    super
  end
end
class BadInputError < MinesweeperError
  def initialize(msg)
    super(msg)
  end
end

class InvalidArguments < MinesweeperError
  def initialize(msg = 'The command does not have the correct arguments.\n')
    super
  end
end

class InvalidDimensionSize < MinesweeperError
  def initialize(msg = 'Invalid dimension size.\n')
    super
  end
end

class InvalidCommand < MinesweeperError
  def initialize(cmd)
    super("The input '#{cmd}' does not valid.\n")
  end
end
