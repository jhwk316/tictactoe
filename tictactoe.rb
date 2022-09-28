
puts "################################################################"
puts "###########          ####          #####        ################"
puts "##############   ###########    ########   #####################"
puts "##############   ###########    ########   #####################"
puts "##############   ###########    ########   #####################"
puts "##############   ########          #####        ################"
puts "################################################################"
puts "################################################################"
puts "###########         #######      #######        ################"
puts "##############   #########  ####  ######   #####################"
puts "##############   ########  ######  #####   #####################"
puts "##############   #######  #      #  ####   #####################"
puts "##############   ######  ##########  ###        ################"
puts "################################################################"
puts "################################################################"
puts "###########          ###              ##        ################"
puts "##############   #######   ########   ##   #####################"
puts "##############   #######   ########   ##        ################"
puts "##############   #######   ########   ##   #####################"
puts "##############   #######              ##        ################"
puts "################################################################"
puts "################################################################"
puts "#############     Created by Jeff Andrews     ##################"
puts "################################################################"



module Board 
  @row1 = " 1 ""|"" 2 ""|"" 3 "
  @separator = "---|---|---"
  @row2 =" 4 ""|"" 5 ""|"" 6 "
  @row3 = " 7 ""|"" 8 ""|"" 9 "

  @@board = [@row1, @separator, @row2, @separator, @row3]
  @@board2 = @@board
 
end



class Game 
 include Board

  def game_play(player1, player2)
    until player1.check_winner() == "win" do #||  player2.check_winner == "win"  do 
      
      player1.move
        break if player1.check_winner == "win"
        break if player1.check_tie == "tie" 
      player2.move2
        break if player2.check_winner == "win"
        break if player2.check_tie == "tie"
      
      end
      puts "How about another round? [Y/N]"
      @answer = gets.chomp.upcase
    
          #PLAY AGAIN LOGIC
      case
      when @answer == "Y"
        puts "Great! Let's play again!"
        puts ""
        game_play(player1, player2)
      when @answer == "N"
        puts "Thank you for playing Tic Tac Toe \u{1f60e}"
      end
    end
  
end#end class



class Players 
  include Board
  
  @@moves = 0 #counter variable so the game knows if it is a tie
  attr_accessor :name, :character
  #initialize method
  def initialize(name, character)
    @name = name
    @character = character 
  end
  def check_winner
    case 
    when @@board2[0] == (" X | X | X ") || @@board2[0] == (" O | O | O ")
      puts @@board2
      puts "#{name} Wins the game"
      @@moves = 0
      @@board2 = @@board
       return "win"

    when @@board2[2] == (" X | X | X ") || @@board2[2] == (" O | O | O ")
      puts @@board2
      puts ""
      puts "#{name} Wins the game"
      @@moves = 0
      @@board2 = @@board
      return "win"

    when @@board2[4].include?(" X | X | X ") || @@board2[4] == (" O | O | O ")
      puts @@board2
      puts ""
      puts "#{name} Wins the game"
      @@moves = 0
      @@board2 = @@board
      return "win"

    when @@board2[0][1]+@@board2[2][1]+@@board2[4][1] == "XXX" || @@board2[0][1]+@@board2[2][1]+@@board2[4][1] == "OOO"
      puts @@board2
      puts ""
      puts "#{name} Wins the game"
      @@moves = 0
      @@board2 = @@board
      return "win"

    when @@board2[0][5]+@@board2[2][5]+@@board2[4][5] == "XXX" || @@board2[0][5]+@@board2[2][5]+@@board2[4][5] == "OOO" 
      puts @@board2
      puts ""
      puts "#{name} Wins the game"
      @@moves = 0
      @@board2 = @@board
      return "win"

    when @@board2[0][9]+@@board2[2][9]+@@board2[4][9] == "XXX" || @@board2[0][9]+@@board2[2][9]+@@board2[4][9] == "OOO" 
      puts @@board2
      puts ""
      puts "#{name} Wins the game"
      @@moves = 0
      @@board2 = @@board
      return "win"

    when @@board2[0][1]+@@board2[2][5]+@@board2[4][9] == "XXX" || @@board2[0][1]+@@board2[2][5]+@@board2[4][9] == "OOO" 
      puts @@board2
      puts ""
      puts "#{name} Wins the game"
      @@moves = 0
      @@board2 = @@board
      return "win"

    when @@board2[0][9]+@@board2[2][5]+@@board2[4][1] == "XXX" || @@board2[0][9]+@@board2[2][5]+@@board2[4][1] == "OOO" 
      puts @@board2
      puts ""
      puts "#{name} Wins the game"
      @@moves = 0
      @@board2 = @@board
      return "win"
    end
  end
  def check_tie
    
    if @@moves == 9 
      @@board2 = @@board
     @@moves = 0
     puts "\u{1f431}" + " The Cat Wins the Game"
      return 'tie'
       
    end
  end
  
  #player 1 move method
  def move
    puts @@board2
      puts "#{@name}, Choose a number on the board to place your marker"
      player1_selection = gets.chomp 
     
      case
        when player1_selection == "1" && @@board2[0].chars.none?("#{player1_selection}") || player1_selection == "2" && @@board2[0].chars.none?("#{player1_selection}") || player1_selection == "3" && @@board2[0].chars.none?("#{player1_selection}")
          puts "That space has already been chosen, please select a new space"
          return move()
        when player1_selection == "4" && @@board2[2].chars.none?("#{player1_selection}") || player1_selection == "5" && @@board2[2].chars.none?("#{player1_selection}") || player1_selection == "6" && @@board2[2].chars.none?("#{player1_selection}")
          puts "That space has already been chosen, please select a new space"
          return move()
        when player1_selection == "7" && @@board2[4].chars.none?("#{player1_selection}") || player1_selection == "8" && @@board2[4].chars.none?("#{player1_selection}") || player1_selection == "9" && @@board2[4].chars.none?("#{player1_selection}")
          puts "That space has already been chosen, please select a new space"
          return move() 
        when player1_selection.match(/[a-z]/i)
          puts "Invalid choice! Please pick a number from 1-9"
          return move()
     end
    
      @@board2 = @@board2.join(',').gsub!("#{player1_selection}", "X").split(',')
      @@moves +=1
      puts ""
    
    end

  #player 2 move method
  def move2
   puts @@board2
      puts "#{@name}, Choose a number on the board to place your marker"
      player2_selection = gets.chomp
      case
        when player2_selection == "1" && @@board2[0].chars.none?("#{player2_selection}") || player2_selection == "2" && @@board2[0].chars.none?("#{player2_selection}") || player2_selection == "3" && @@board2[0].chars.none?("#{player2_selection}")
          puts "That space has already been chosen, please select a new space"
          return move2()
        when player2_selection == "4" && @@board2[2].chars.none?("#{player2_selection}") || player2_selection == "5" && @@board2[2].chars.none?("#{player2_selection}") || player2_selection == "6" && @@board2[2].chars.none?("#{player2_selection}")
          puts "That space has already been chosen, please select a new space"
          return move2()
        when player2_selection == "7" && @@board2[4].chars.none?("#{player2_selection}") || player2_selection == "8" && @@board2[4].chars.none?("#{player2_selection}") || player2_selection == "9" && @@board2[4].chars.none?("#{player2_selection}")
          puts "That space has already been chosen, please select a new space"
          return move2() 
        when player2_selection.match(/[a-z]/i)
          puts "Invalid choice! Please pick a number from 1-9"
          return move2()
      end
      @@board2 = @@board2.join(',').gsub!("#{player2_selection}", "O").split(',')
      @@moves +=1
     # puts "Move number: #{@@moves}"
     
     puts ""
    end
  end##End Class
 
## Input for Player 1 name
puts ""
puts "Type in the name for player 1"
player1 = Players.new(gets.chomp.capitalize, "X")
puts "Welcome #{player1.name}, you are playing as X"
puts ""

##  Input for Player 2 name
puts ""
puts "Type in the name for player 2"
player2 = Players.new(gets.chomp.capitalize, "O")
puts "Welcome #{player2.name}, you are playing as O"
puts ""

new_game = Game.new
 
new_game.game_play(player1, player2)


