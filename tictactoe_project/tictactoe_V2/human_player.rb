
class HumanPlayer
    attr_reader :mark
    def initialize(marks)
        @mark=marks
    end

    def get_position
        puts "Player #{mark.to_s}, enter two numbers representing a position in the format `row col`"
        p_input=gets.chomp.split(" ").map(&:to_i)
        raise "invalid input" if p_input.length !=2
        return p_input
    end
    

end