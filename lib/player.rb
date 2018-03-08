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
    attr_accessor :token, :strategy

    def initialize (token, strategy = Strategies::Defend.new)
      @token = token
      @strategy = strategy
    end

    def move(board)
      @strategy.decide_move(board)
    end
  end
end
