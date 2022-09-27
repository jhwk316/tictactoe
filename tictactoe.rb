
class Board 
  row1 = " 1 ""|"" 2 ""|"" 3 "
  separator = "---|---|---"
  row2 =" 4 ""|"" 5 ""|"" 6 "
  row3 = " 7 ""|"" 8 ""|"" 9 "

  @@board = [row1, separator, row2, separator, row3]
end
class Players < Board
  @@moves = 0 #counter variable so the game knows if it is a tie
  attr_accessor :name, :character
  #initialize method
  def initialize(name, character)
    @name = name
    @character = character 
  end
  def check_winner
    case 
    when @@board[0] == (" X | X | X ") || @@board[0] == (" O | O | O ")
      puts @@board
      puts "#{name} Wins the game"
       return "win"

    when @@board[2] == (" X | X | X ") || @@board[2] == (" O | O | O ")
      puts @@board
      puts ""
      puts "#{name} Wins the game"
      return "win"

    when @@board[4].include?(" X | X | X ") || @@board[4] == (" O | O | O ")
      puts @@board
      puts ""
      puts "#{name} Wins the game"
      return "win"

    when @@board[0][1]+@@board[2][1]+@@board[4][1] == "XXX" || @@board[0][1]+@@board[2][1]+@@board[4][1] == "OOO"
      puts @@board
      puts ""
      puts "#{name} Wins the game"
      return "win"

    when @@board[0][5]+@@board[2][5]+@@board[4][5] == "XXX" || @@board[0][5]+@@board[2][5]+@@board[4][5] == "OOO" 
      puts @@board
      puts ""
      puts "#{name} Wins the game"
      return "win"

    when @@board[0][9]+@@board[2][9]+@@board[4][9] == "XXX" || @@board[0][9]+@@board[2][9]+@@board[4][9] == "OOO" 
      puts @@board
      puts ""
      puts "#{name} Wins the game"
      return "win"

    when @@board[0][1]+@@board[2][5]+@@board[4][9] == "XXX" || @@board[0][1]+@@board[2][5]+@@board[4][9] == "OOO" 
      puts @@board
      puts ""
      puts "#{name} Wins the game"
      return "win"

    when @@board[0][9]+@@board[2][5]+@@board[4][1] == "XXX" || @@board[0][9]+@@board[2][5]+@@board[4][1] == "OOO" 
      puts @@board
      puts ""
      puts "#{name} Wins the game"
      return "win"

    when @@moves == 9
      return 'tie'
    end
  end
  
  #player 1 move method
  def move
    puts @@board
      puts "#{@name}, Choose a number on the board to place your marker"
      player1_selection = gets.chomp 
     
      case
        when player1_selection == "1" && @@board[0].chars.none?("#{player1_selection}") || player1_selection == "2" && @@board[0].chars.none?("#{player1_selection}") || player1_selection == "3" && @@board[0].chars.none?("#{player1_selection}")
          puts "That space has already been chosen, please select a new space"
          return move()
        when player1_selection == "4" && @@board[2].chars.none?("#{player1_selection}") || player1_selection == "5" && @@board[2].chars.none?("#{player1_selection}") || player1_selection == "6" && @@board[2].chars.none?("#{player1_selection}")
          puts "That space has already been chosen, please select a new space"
          return move()
        when player1_selection == "7" && @@board[4].chars.none?("#{player1_selection}") || player1_selection == "8" && @@board[4].chars.none?("#{player1_selection}") || player1_selection == "9" && @@board[4].chars.none?("#{player1_selection}")
          puts "That space has already been chosen, please select a new space"
          return move() 
        when player1_selection.match(/[a-z]/i)
          puts "Invalid choice! Please pick a number from 1-10"
          return move()
     end
    
      @@board = @@board.join(',').gsub!("#{player1_selection}", "X").split(',')
      @@moves +=1
      if @@moves == 9 && check_winner() != 'win'
        puts @@board
        puts ""
       puts "\u{1f431}" + " The Cat Wins the Game"
      end
      puts ""
    
    end

  #player 2 move method
  def move2
   puts @@board
      puts "#{@name}, Choose a number on the board to place your marker"
      player2_selection = gets.chomp
      case
        when player2_selection == "1" && @@board[0].chars.none?("#{player2_selection}") || player2_selection == "2" && @@board[0].chars.none?("#{player2_selection}") || player2_selection == "3" && @@board[0].chars.none?("#{player2_selection}")
          puts "That space has already been chosen, please select a new space"
          return move2()
        when player2_selection == "4" && @@board[2].chars.none?("#{player2_selection}") || player2_selection == "5" && @@board[2].chars.none?("#{player2_selection}") || player2_selection == "6" && @@board[2].chars.none?("#{player2_selection}")
          puts "That space has already been chosen, please select a new space"
          return move2()
        when player2_selection == "7" && @@board[4].chars.none?("#{player2_selection}") || player2_selection == "8" && @@board[4].chars.none?("#{player2_selection}") || player2_selection == "9" && @@board[4].chars.none?("#{player2_selection}")
          puts "That space has already been chosen, please select a new space"
          return move2() 
        when player2_selection.match(/[a-z]/i)
          puts "Invalid choice! Please pick a number from 1-10"
          return move2()
      end
      @@board = @@board.join(',').gsub!("#{player2_selection}", "O").split(',')
      @@moves +=1
     puts ""
    end
  end##End Class
class Game
  def game_play(player1, player2)
    until player1.check_winner() == "win" || player2.check_winner == "win"  do 
      player1.move
        break if player1.check_winner == "win"
        break if player1.check_winner == 'tie' 
      player2.move2
        break if player2.check_winner == "win"
      end
    end
end#end class





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