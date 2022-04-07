# require "byebug"

class Board
    #part 1:
  attr_reader :size
    def initialize(num)
        @grid=Array.new(num){Array.new(num).fill(:N)}
        @size=@grid.length*@grid.length

    end

    def [](pos)
        row=pos[0]
        col=pos[1]
        return @grid[row][col]

    end
    def []=(pos,shipVal)
        row=pos[0]
        col=pos[1]
        @grid[row][col]=shipVal

    end

    def num_ships
        return @grid.flatten.count{|val| val==:S}
    end

    # part 2:

    def attack(pos)

        if self.[](pos) == :S
            self.[]=(pos,:H)
            puts 'you sunk my battleship!'
            return true
        else
            self.[]=(pos,:X)
            return false

        end


    end

     def place_random_ships

        randomFill=@size/4

        while self.num_ships<randomFill
            rand_Row=rand(0...@grid.length)
            rand_Col=rand(0...@grid.length)
            pos=[rand_Row,rand_Col]
            self.[]=(pos,:S) 
        end
     
    end

    

    def hidden_ships_grid

        hidden_grid=@grid.map do |subArr|
            subArr.map{|ele| ele==:S ? :N : ele}
        
        end
        return hidden_grid 
    end


    def self.print_grid(battleGrid)

        battleGrid.each do |subArr|
                puts subArr.join(" ")
        end

    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end


end
