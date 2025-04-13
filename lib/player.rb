require_relative 'game'

class Player

  def pick_color
    guess = Array.new()
    puts "Enter a valid code #{Game::COLORS.join(', ')}"
    while guess.length < 4
      begin
      input = gets.chomp.upcase
      unless Game::COLORS.include?(input)
        raise ArgumentError, "Invalid code"
      end
      guess.push(input)
    rescue ArgumentError => e 
      puts "#{e.message}. Try again."
      retry  
    end
    end
    guess
  end
end