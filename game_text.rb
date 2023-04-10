
module Intro
  def welcome
    puts "Welcome to Tic-Tac-Toe"
  end

  def player_names
    puts "Players, please enter your name"
  end

end

module Players
  def player1_text
    puts "#{player1} please select a number on the board"
  end

  def player2_text
    puts "#{player2} please select a number on the board"
  end

  def player1_win
    puts "😎  #{player1} wins the game  😎"
  end

  def player2_win
    puts "😎  #{player2} wins the game  😎"
  end

  def tie
    puts "😺   The Cat Wins   😺"
  end

  def exit
    puts "Thanks for playing Tic-Tac-Toe"
  end

end
