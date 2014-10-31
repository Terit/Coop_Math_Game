require 'colorize'

@p1 = {name: "Player 1", lives: 3, color: :blue}
@p2 = {name: "Player 2", lives: 3, color: :yellow}


def repl
  while @p1[:lives] > 0 && @p2[:lives] > 0
    current_player = current_player == @p1 ? @p2 : @p1
    question(current_player)
  end
end

def question(player)
  num1 = rand(19) + 1
  num2 = rand(19) + 1
  # answer = num1 + num2

  puts "#{player[:name].capitalize}: What does #{num1} plus #{num2} equal?"
  # input = gets.chomp!.to_i
  # input = get_input
  right_answer(get_input, num1, num2, player)

  # unless answer == input
  #   puts "WRONG! #{num1} plus #{num2} equals #{answer}"
  #   lose_life(player)
  #   puts "#{player[:name]} lives remaining: #{player[:lives]}"
  # else
  #   puts "Correct! #{num1} plus #{num2} equals #{input}"
  # end

end

def lose_life(player)
  player[:lives] -= 1
end

def right_answer(input, num1, num2, player)
  answer = get_answer(num1, num2)
  unless answer == input
    print "Wrong!".red
    puts " #{num1} plus #{num2} equals #{answer}"#.red
    lose_life(player)
    print "#{player[:name]}".colorize(player[:color])
    puts ": #{player[:lives]} lives remaining."
  else
    print "Correct!".colorize(:green)
    puts " #{num1} plus #{num2} equals #{input}"
  end
  puts "***************************************************".colorize(:red)
end

def get_answer(num1, num2)
  num1 + num2
end 

def get_input
  gets.chomp!.to_i
end 

repl
