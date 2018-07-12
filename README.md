# minesweeper_ruby


This is a game of Minesweeper built in Ruby. It is played in the terminal. To play, run the command ./bin/minesweeper.rb. This version of Minesweeper proggrammed for below requirement and also created  Minesweeper game logic in https://github.com/manjushareddy27/Minesweepers 

Requirement:

Minesweeper is a single-player puzzle video game. The objective of the game is to clear a rectangular board containing hidden "mines" or bombs without detonating any of them, with help from clues about the number of neighbouring mines in each field. (source Wikipedia*)

A constructor that will accept the size of the board and difficulty level.
• The board can be a square, so a single parameter to define the size is
fine
• The difficulty level can be one of: easy, medium, hard, and it will
determine the percentage of mines on the board
A method that will allow to place an attempt by accepting a coordinate
A method that will return the current game status:
• In progress
• Victory
• Loss
Implement a method to print the current board on the console

Example usage:
001 > game = Minesweeper.new(5, :easy)
002> game.attempt(2, 3) # coordinates are 1 based in my example 2 # returns the number of adiacent mines
003> game.display XXXXX
XXXXX
X2XXX
XXXXX XXXXX
004> game.attempt(10, 10) # coordinates outside from the board Invalid coordinate!
005> game.status Still playing
006> game.attempt(4, 4)
BOOOOM! # uh... I’ve found a mineL
007> game.status You loose!

