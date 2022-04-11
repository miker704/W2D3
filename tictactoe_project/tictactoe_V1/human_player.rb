class HumanPlayer
    attr_reader :mark
    
    def initialize(mark_value)
        @mark=mark_value
    end

    def get_position
        
        puts "Player #{mark.to_s}, enter two numbers representing a position in the format `row col`"
        player_input=gets.chomp.split(" ").map(&:to_i)
        raise "invalid input" if player_input.length !=2
        return player_input
    end


end