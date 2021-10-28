
class Hand

    @@HANDS_ORDER = [:streight_flush, :four_of_a_kind, :full_house, :flush, 
                   :streight, :three_of_a_kind, :two_pair, :pair, :high_card]
   
    attr_reader :players_cards, :hand_value

    def initialize(cards)
       @players_cards = cards.sort{|a,b| a.value <=> b.value}
       @hand_value = []
    end
    
    def self.compare_hands(hand_1,hand_2)
       
    end

    def find_hand_value
       
    end


    #returns value of kicker if true otherwise returns false
    def four_of_a_kind?
       players_cards.each do |card_obj|
         return card_obj.value if players_cards.count {|card| card.value == card_obj.value} == 4
       end
       false  
    end

    def flush?
        suit_to_check = players_cards[0].suit
        if players_cards.all? {|card| card.suit == suit_to_check}
          return players_cards[-1].value
        end
        false  
    end    

    def streight?
      (0...players_cards.length - 1).each do |i|
        return false if players_cards[i].value != players_cards[i + 1].value -1 
      end
      players_cards[-1].value
    end

    def streight_flush?
      return players_cards[-1].value if streight? && flush? 
      false
    end

    def three_of_a_kind?
        players_cards.each do |card_obj|
          return card_obj.value if players_cards.count {|card| card.value == card_obj.value} == 3
        end
        false  
    end

    def pair?
        players_cards.each do |card_obj|
            return card_obj.value if players_cards.count {|card| card.value == card_obj.value} == 2
        end
        false  
    end


    #will need a high card method
    def two_pair?
        players_cards.each do |card_obj|
            return card_obj.value if players_cards.count {|card| card.value == card_obj.value} == 2
        end
        false  
    end

end