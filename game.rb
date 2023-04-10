
require_relative 'game_text'

class Board
  attr_accessor :a, :b, :c, :board
  def initialize
    @a = ['1', '2', '3']
    @b = ['4', '5', '6']
    @c = ['7', '8', '9']
    @board = a + b + c
  end

  def draw_board
    puts "#{a.join(' | ')} \n" +"--------- \n" + "" "#{b.join(' | ')} \n"  +"--------- \n" + "#{c.join(' | ')} \n"
  end

  def update_board(user_choice)
    board.any? { |x| x.replace('X') if x == user_choice }
    draw_board
  end

  def update_board2(user_choice2)
    board.any? { |x| x.replace('O') if x == user_choice2}
    draw_board
  end

end # End Board Class

class Player
  attr_accessor :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

end # End Player Class



class Game
  include Intro
  include Players
  attr_accessor :new_game, :player1, :player2
  attr_reader :user_choice

  def initialize
    splash
    @new_game = Board.new
    Player.new(player1, player2)
    welcome
    puts
    player1_name
    @player1 = gets.chomp.capitalize
    player2_name
    @player2 = gets.chomp.capitalize
    new_game.draw_board
  end

  def player1_turn
    player1_text
    user_choice = gets.chomp
    if new_game.board.include?(user_choice)
      new_game.update_board(user_choice)
    else
      player1_turn
    end
    puts
  end

  def player2_turn
    player2_text
    user_choice2 = gets.chomp.upcase
    if new_game.board.include?(user_choice2)
      new_game.update_board2(user_choice2)
    elsif !new_game.board.include?(user_choice2)
      player2_turn
    end
    puts
  end

  # Check for a winning move
  def winner?
    a = new_game.a
    b = new_game.b
    c = new_game.c
    vertical_1 = [a[0],b[0],c[0]]
    vertical_2 = [a[1],b[1],c[1]]
    vertical_3 = [a[2],b[2],c[2]]
    diagonal_1 = [a[0],b[1],c[2]]
    diagonal_2 = [a[2],b[1],c[0]]

      # horizontal win
    if a.all? { |row| row == 'X'} || a.all? { |row| row == 'O'}
      return true
    elsif b.all? { |row| row == 'X'} || b.all? { |row| row == 'O'}
      return true
    elsif c.all? { |row| row == 'X'} || c.all? { |row| row == 'O'}
      return true

      # vertical win
    elsif vertical_1.all? { |column| column == 'X'} || vertical_1.all? { |column| column == 'O'}
      return true
    elsif vertical_2.all? { |column| column == 'X'} || vertical_2.all? { |column| column == 'O'}
      return true
    elsif vertical_3.all? { |column| column == 'X'} || vertical_3.all? { |column| column == 'O'}
      return true

      # diagonal win
    elsif diagonal_1.all? { |line| line == 'X'} || diagonal_1.all? { |line| line == 'O'}
      return true
    elsif diagonal_2.all? { |line| line == 'X'} || diagonal_2.all? { |line| line == 'O'}
      return true
    end
  end

  def game_play
    counter = 0

    until counter == 9
      player1_turn
      counter += 1
      player1_win if winner?
      break if winner? || counter == 9
      player2_turn
      counter += 1
      player2_win if winner?
      break if winner?
    end
    tie if counter == 9 && !winner?
    play_again if winner?
   
  end

  def play_again
    puts "Would you like to play again? [Y/N]"
    answer = gets.chomp.upcase
    if answer == 'Y'
      Game.new.game_play
    elsif answer == 'N'
      exit
    else
      play_again
    end

  end

end # End Game Class



