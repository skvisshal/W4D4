require_relative "card.rb"

class Deck

    SUITS = [:spades,:clubs,:hearts,:diamonds].freeze
    SYMBOLS = ((2..10).to_a + [:j,:q,:k,:a]).freeze
  
    def initialize
        @deck = []
        populate
        shuffle
    end

    def populate
        SUITS.each do |suit|
          SYMBOLS.each.with_index do |symbol,num|
            @deck << Card.new(suit,symbol,num + 2)
          end
        end    
    end

    def shuffle
      @deck.shuffle!
    end
end


d = Deck.new
p d 
