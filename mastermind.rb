require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/computer'

player = Player.new()
computer = Computer.new()

game = Game.new(player, computer)