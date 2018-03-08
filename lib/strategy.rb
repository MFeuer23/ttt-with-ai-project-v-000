module Strategies
  class Defend
    def decide_move(board)
      WIN_COMBINATIONS.detect do |combination|
        if board.cells[combination[0]] == board.cells[combination[1]] && board.cells[combination[0]] != " " && board.valid_move?(combination[2]+1)
          return (combination[2]+1).to_s
        elsif board.cells[combination[0]] == board.cells[combination[2]] && board.cells[combination[0]] != " " && board.valid_move?(combination[1]+1)
          return (combination[1]+1).to_s
        elsif board.cells[combination[1]] == board.cells[combination[2]] && board.cells[combination[1]] != " " && board.valid_move?(combination[0]+1)
          return (combination[0]+1).to_s
        end
        board.cells.each_with_index do |cell, index|
          if cell == " "
            return (index + 1).to_s
          end
        end
      end
    end
  end

  class Random
    def decide_move(board)
      rand(1..9).to_s
    end
  end
end
