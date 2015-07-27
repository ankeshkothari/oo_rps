# Player and computer each select R P S. We compare who wins.

class Play_again
  def initialize
    puts "Press P to play again. Any other key to exit."
    play_key = gets.chomp.downcase
    if play_key == "p"
      Game.new.play
    end
  end
end

class Player
 def hand
  begin
    puts "Select R or P or S"
    ph = gets.chomp.downcase
  end until ph == "r" || ph == "p" || ph == "s"

  puts "Player chose #{ph}"
  ph
 end
end

class Computer
  def hand
    ch = ["r", "p", "s"].sample
    puts "computer chose #{ch}"
    ch
  end
end

class Compare_hands
  attr_accessor :player_hand, :computer_hand

  def initialize (ph, ch)
    @player_hand = ph
    @computer_hand = ch
  end

  def win?
    if player_hand == computer_hand
      puts "It's a tie!"
    elsif (player_hand == "r" && computer_hand == "s") || (player_hand == "p" && computer_hand == "r") || (player_hand == "s" && computer_hand == "p")
      if player_hand == "r"
        puts "Rock beats Scissors"
      elsif player_hand == "p"
        puts "Paper wraps Rock"
      elsif player_hand == "s"
        puts "Scissors cut Paper"
      end  
          
      puts "You win"

    else
      if player_hand == "r"
        puts "Paper wraps Rock"
      elsif player_hand == "p"
        puts "Scissors cut Paper"
      elsif player_hand == "s"
        puts "Rock beats Scissors"
      end  

      puts "You lost"
    end
          
  end

end

class Game
  attr_accessor :player, :computer

  def initialize
    @player = "Bob"
    @computer = "Computer"
  end

  def play
    player_hand = Player.new.hand
    computer_hand = Computer.new.hand
    compare = Compare_hands.new(player_hand, computer_hand)
    compare.win?
    Play_again.new
  end
end

Game.new.play