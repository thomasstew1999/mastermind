require_relative 'game'

class Computer

  def initialize
    @guess = first_guess()
  end

  def pick_color
    selector()
    puts "The computer guesses: #{@guess.join(" ")}"
    @guess
  end

  def first_guess()
    guess = [
      Game::COLORS[rand(0..6)],
      Game::COLORS[rand(0..6)],
      Game::COLORS[rand(0..6)],
      Game::COLORS[rand(0..6)]
    ]
  end

  def selector()
    
    Game.code.each_with_index do |color, index|
      if Game.code[index] != @guess[index]
        @guess[index] = Game::COLORS[rand(0..6)]
      end
    end
  end
end

