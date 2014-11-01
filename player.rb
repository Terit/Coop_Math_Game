class Player
  attr_accessor :name, :lives, :color, :score
  @@player_number = 1

  def initialize(name,color = :yellow)
    @name = name
    @lives = 3
    @score = 0
    @color = color.to_sym
    @@player_number += 1
  end

  def self.get_player_number
    @@player_number
  end

end