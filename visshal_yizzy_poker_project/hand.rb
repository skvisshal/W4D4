
class Hand

    @@HANDS_ORDER = [streight_flush?, four_of_a_kind?, :full_house, flush?, 
                   streight?, three_of_a_kind?, two_pair?, pair?]
   
    attr_reader :players_cards, :hand_value

    def initialize(cards)
       @players_cards = cards.sort{|a,b| a.value <=> b.value}
       @hand_value = []
    end
    
    def self.compare_hands(hand_1,hand_2)
       @@HANDS_ORDER.each {|m| m.call}
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

    #will need a high card method
    def two_pair?
      self.create_hash.values.count(2) == 2
    end

    def two_pair_high
      key_arr = self.create_hash.keys.reverse
      key_arr.each do |key| 
        return key if self.create_hash[key] == 2
      end
    end

    def two_pair_low
      self.create_hash.each do |key,value| 
        return key if value == 2
      end
    end

    def two_pair_kicker
      self.create_hash.each do |key,value| 
        return key if value == 1
      end
    end

    def pair?
      players_cards.each do |card_obj|
          return card_obj.value if players_cards.count {|card| card.value == card_obj.value} == 2
      end
      false  
    end

    #does not account for all kickers being tied
    def self.kicker(hand_1, hand_2)
      key_arr_1 = hand_1.create_hash.keys
      key_arr_1.select!{|key| hand1.create_hash[key] == 1}
      key_arr_2 = hand_2.create_hash.keys
      key_arr_2.select!{|key| hand1.create_hash[key] == 1}
      i = key_arr_1.length - 1
      until i == 0
        if key_arr_1[i] > key_arr_2[i]
          return hand_1
        elsif key_arr_1[i] < key_arr_2[i]
          return hand_2
        end
        i -= 1
      end
    end

    def create_hash
      card_hash = Hash.new {|h,k| h[k] = 0}
      @players_cards.each do |card|
        card_hash[card.value] += 1
      end
      card_hash
    end

end