#!/usr/bin/env ruby

require './lib/minesweeper.rb'

game = Minesweeper.new(5, :easy) 
game.attempt(2, 3) 
game.display
game.attempt(10, 10) 
game.attempt(4, 4) 
