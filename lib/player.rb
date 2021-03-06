class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end
end

include Strategies

module Players
  class Human < Player
    def move(board)
      puts "Enter a number:"
      user_input = gets.chomp
      user_input
    end
  end
  class Computer < Player
    def move(board)
      WIN_COMBINATIONS.detect do |combination|
        if board.cells[combination[0]] == board.cells[combination[1]] && board.cells[combination[0]] != " " && board.valid_move?(combination[2]+1)
          return combination[2]+1
        elsif board.cells[combination[0]] == board.cells[combination[2]] && board.cells[combination[0]] != " " && board.valid_move?(combination[1]+1)
          return combination[1]+1
        elsif board.cells[combination[1]] == board.cells[combination[2]] && board.cells[combination[1]] != " " && board.valid_move?(combination[0]+1)
          return combination[0]+1
        end
       end

      board.cells.each_with_index do |cell, index|
        if cell == " "
          return (index + 1).to_s
        end
      end
    end
  end
end
