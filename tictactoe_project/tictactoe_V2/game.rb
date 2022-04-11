require "./board.rb"
require "./human_player.rb"


class Game
    def initialize(boardSize,*marks)
        @board=Board.new(boardSize)
        # @play1=HumanPlayer.new(mark1)
        # @play2=HumanPlayer.new(mark2)
        @players=marks.map{|mk| HumanPlayer.new(mk)}
        @current=@players.first
        
    end

    def switch_player
        # return @current==@play1 ? @current=@play2 : @current=@play1
        @current=@players.rotate!.first
    end

    def play

        while(@board.empty_positions?)

            @board.print
            pos=@current.get_position
            @board.place_mark(pos,@current.mark)
            if(@board.win?(@current.mark))
                puts "victory"
                puts @current.mark.to_s + ' has won'
                return 
            else
                switch_player
            end


        end
        puts " game over its a draw"

    end


end