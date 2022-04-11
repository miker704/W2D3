
class Board

    def initialize
        @grid=Array.new(3){Array.new(3).fill("_")}
        @size=@grid.length*@grid.length
    end

    def valid?(pos)
        # if (pos[0]>@grid.length || pos[1]>@grid.length) || (pos[0]<0 || pos[1]<0)
        #     return false
        # end
        # return true
        return pos.all? do |i|
            0 <= i && i < @grid.length
        end
    end

    def empty?(pos)
        row=pos[0]
        col=pos[1]
        return @grid[row][col]=="_"
    end

    def place_mark(pos,mark)
        if !valid?(pos)|| !empty?(pos)
            raise "invalid input" 
        end

        row=pos[0]
        col=pos[1]
        @grid[row][col]=mark 

    end
    
    def print
        @grid.each do |ele|
            puts ele.join(" ")
        end
    end

    def win_row?(mark)
        # @grid.any?{|row| row.uniq.length==1 && row.include?(mark)}
        @grid.any?{|row| row.all?(mark)}

    end

    def win_col?(mark)
        # @grid.transpose.any?{|col| col.uniq.length==1 && col.include?(mark)}
        @grid.transpose.any?{|col| col.all?(mark)}
    end

    def win_diagonal?(mark)
            left_right = (0...@grid.length).all? do |i|
                @grid[i][i]==mark
            end
            right_left = (0...@grid.length).all? do |i|
                row=i
                col= @grid.length-i-1
                @grid[row][col]==mark
            end
        return left_right || right_left
    end

    def win?(mark)
            if win_col?(mark) || win_row?(mark) ||win_diagonal?(mark)
                return true
            end
            return false
    end

    def empty_positions?
           return @grid.any?{|subArr| subArr.include?("_")} 
    end

end