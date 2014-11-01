require 'colorize'
require_relative 'player'

class MathGame
  OPERATORS = ['+','-','*']

  def get_player_name
    puts "Please enter a name for Player #{Player.get_player_number}"
    get_input
  end

  def create_players
    @player1 = Player.new(get_player_name, "blue")
    @player2 = Player.new(get_player_name)
  end

  def generate_numbers
    @num1 = rand(19) + 1
    @num2 = rand(19) + 2
    @operator = OPERATORS.sample
  end

  def ask_question(player)
    generate_numbers
    print "#{player.name}".colorize(player.color)
    puts ": What does #{@num1} #{@operator} #{@num2} equal?"
  end

  def verify_answer
    if get_input.to_i == get_answer
      print "Correct!".colorize(:green)
      puts " #{@num1} plus #{@num2} equals #{get_answer}"
    else
      print "Wrong!".red
      puts " #{@num1} plus #{@num2} equals #{get_answer}"
      lose_life
    end
  end

  def lose_life
    @current_player.lives -= 1
  end

  def get_answer
    if @operator == '+'
      @num1 + @num2
    elsif @operator == '-'
      @num1 - @num2
    else
      @num1 * @num2
    end
  end

  def get_input
    gets.chomp!
  end

  def print_spacer(color = :white)
    puts "****************************************".colorize(color.to_sym)
  end

  def find_winner
    if @player1.lives > @player2.lives
      @player1.score += 1

      print_spacer(:green)
      puts "Player: #{@player1.name} wins!"
      print_spacer(:green)

    else
      @player2.score += 1
      print_spacer(:green)
      puts "Player: #{@player1.name} wins!"
      print_spacer(:green)
    end
  end

  def update_score
    puts "Current Score"
    print_spacer(:red)
    puts "Player Name: #{@player1.name} Score: #{@player1.score}".colorize(@player1.color)
    puts "Player Name: #{@player2.name} Score: #{@player2.score}".colorize(@player2.color)
    print_spacer(:red)
  end

  def play_again?
    puts "Would you like to play again? (Yes or No)"
    get_input.downcase == "yes"
  end

  def reset_lives
    @player1.lives = 3
    @player2.lives = 3
  end

  def play
    create_players
    playing = true
    while playing
      while @player1.lives > 0 && @player2.lives > 0
        @current_player = @current_player == @player1 ? @player2 : @player1
        ask_question(@current_player)
        verify_answer
        print_spacer
      end
      find_winner
      print_spacer(:red)
      update_score
      reset_lives
      playing = play_again?
    end
  end

end
