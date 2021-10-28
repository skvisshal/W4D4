class Card

  attr_reader :suit, :symbol, :value

  def initialize(suit,symbol,value)
    @suit = suit
    @symbol = symbol
    @value = value
  end

end
