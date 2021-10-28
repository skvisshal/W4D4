class Game

    def initialize(buy_in, num_players)
        @buy_in = buy_in
        @pot = 0
        @num_players = num_players
        @players = []
        @deck = Deck.new
    end

    def start_game
        (1..@num_players).each do |num|
            puts "Enter name of Player #{num}"
            name = gets.chomp
            @players << Player.new(name, @buy_in)
        end
    end

    def deal_hands
        players.each do |player|
            player.hand << deck.pop(5)
        end
    end

    def

    def find_winner
        
    end

    
end