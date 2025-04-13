require_relative 'player'
require_relative 'computer'

class Game
  COLORS = ["GREEN", "BLUE", "PURPLE", "PINK", "ORANGE", "YELLOW", "RED"]
  @@code = []
  def initialize(mastermind, guesser)
    @mastermind = mastermind
    @guesser = guesser
    @code = []
    @guess = Array.new(4)
    @round = 0
    game_start()

  end

  def self.code  # class-level getter
    @@code
  end
  
  def code_creation
    if @mastermind == Player
      player_color_picker()
    else
      computer_color_picker()
    end
    @@code = @code
  end

  def player_color_picker
    puts "Enter a valid code #{COLORS.join(', ')}"
    while @code.length < 4
      begin
      input = gets.chomp.upcase
      unless COLORS.include?(input)
        raise ArgumentError, "Invalid code"
      end
      @code.push(input)
    rescue ArgumentError => e 
      puts "#{e.message}. Try again."
      retry  
    end
    end
  end

  def computer_color_picker
    @code = [
      COLORS[rand(0..6)],
      COLORS[rand(0..6)],
      COLORS[rand(0..6)],
      COLORS[rand(0..6)]
    ]
  end

  def game_loop
    while won?() == false && @round < 12
      @guess = @guesser.pick_color
      @round += 1
      how_close?()
    end
  end

  def game_start
    code_creation()
    game_loop()
    if won?()
      puts "Congrats, you won!"
    else
      puts "Dang, you lost! The code was #{@code.join(" ")}."
    end
  end

  def how_close?
    red_pegs = matching_position()
    white_pegs = matching_color() < 1 ? red_pegs : matching_color()
    puts "\nGuess: #{@guess.join(" ")}\nWhite pegs: #{white_pegs - red_pegs}\nRed Pegs: #{red_pegs}\nRound: #{@round}\n "
  end

  def matching_color
    white_pegs = 0
    @guess.each_with_index do |color, index|
      if @code.include?(@guess[index])
        white_pegs += 1
      end
    end
    white_pegs
  end

  def matching_position
    red_pegs = 0
    @code.each_with_index do |color, index|
      if color == @guess[index]
        red_pegs +=1
      end
    end
    red_pegs
  end

  def won?
    if @code == @guess
      return true
    else
      return false
    end
  end
end