require 'byebug'

class Hanoi

attr_reader :board, :win_board

  def initialize(disk_count)
    @board = initialize_board(disk_count)
    @win_board = (1..disk_count).to_a
    play_game
  end

  def get_move
    user_input = gets.chomp
    begin
    a = user_input.split(", ").to_a
    b = a.map { |el| el.to_i}
      if b.length != 2 || b[0].class != Fixnum || b[1].class != Fixnum || !b.all?{|x| x.between?(0, 2)}
        raise MoveInputError.new("Input two numbers between 0 and 2 in 'start, end' format")
      end
    rescue
      user_input = gets.chomp
      retry
    end
    move(b) if valid_move?(b)
  end


  def valid_move?(current_move)
    return true if board[current_move.last].first.nil?
    true unless board[current_move.first].first > board[current_move.last].first
  end

  def move(current_move)
    if valid_move?(current_move)
       board[current_move[1]].unshift(board[current_move[0]].shift)
     else
       get_move
    end
  end

  def win?
    return true if (board[1] == win_board ||  board[2] == win_board)
  end


  def play_game
    puts "Get ready to play!!! AND LOSE!!!"
    until win?
      p board
      get_move
    end
    puts "You win!"
  end

  private

  def initialize_board(disk_count)
    begin
      if ( disk_count.class != Fixnum || disk_count < 1 )
        raise DiskCountError.new("Input a number greater than 1!")
      end
    rescue
      disk_count = gets.chomp.to_i
      retry
    end
    array = (1..disk_count).to_a
    @board = [ array, [], [] ]
  end

end

class DiskCountError < ArgumentError
end

class MoveInputError < ArgumentError
end
