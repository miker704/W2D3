require_relative "board"
require_relative "player"

class Battleship

# part 3

    attr_reader :player,:board

    def initialize(num)
        @player=Player.new()
        @board=Board.new(num)
        @remaining_misses=@board.size/2
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print

    end

    def lose?
            if @remaining_misses<=0
                puts "you lose"
                return true
            else
                return false
            end
    end

    def win?

        if @board.num_ships==0
            print "you win"
            return true
        else
            return false
        end

    end

    def game_over?
        
       if win? || lose?
            return true
       else 
           return false
       end

    end


    def turn 
        curr_Move=@player.get_move
        result=@board.attack(curr_Move)
        if !result
            @remaining_misses-=1
        end

        @board.print
        puts @remaining_misses


    end

end
