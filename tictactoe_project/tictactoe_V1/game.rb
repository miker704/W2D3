require "./board.rb"
require "./human_player.rb"


class Game

    def initialize(player_1_mark,player_2_mark)
        @player1=HumanPlayer.new(player_1_mark)
        @player2=HumanPlayer.new(player_2_mark)
        @current=@player1
        @board=Board.new

    end

    def switch_player
        @current==@player1 ? @current=@player2 : @current=@player1
    end

    def play()
        while(@board.empty_positions?)
            @board.print
            current_pos=@current.get_position
            @board.place_mark(current_pos,@current.mark)
            if @board.win?(@current.mark)
                puts "victory"
                puts @current.mark.to_s + 'has won'
                return 
            else
                switch_player
            end
            
        end
        puts " game over its a draw"
    end


end