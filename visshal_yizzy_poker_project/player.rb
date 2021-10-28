class Player

    attr_accessor :name, :hand, :chips

    def initialize(name, chips = 1000)
        @name = name
        @hand = []
        @chips = chips
    end

    def indices_to_discard
        puts @name
        puts @hand
        puts "Please enter all the indices that you would like to discard"
        response_indices = gets.chomp.split.map(&:to_i)
    end

    def get_choice
        puts @name
        puts "Enter 'f' to fold, 'r' to raise, 's' to see, 'c' to check"
        response = gets.chomp
        raise "Invalid Input" unless  %w(f r c s).include?(response)
        response
    end

    def bet
        puts "Enter the amount you would like to bet"
        response_bet = gets.chomp.to_i
        raise "Not Enough Chips" if response_bet > @chips
        response_bet
    end
end