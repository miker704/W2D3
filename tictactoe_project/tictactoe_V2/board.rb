

class Board

        def initialize(n)

            @grid=Array.new(n){Array.new(n).fill("_")}

        end


        def [](pos)
            row,col = pos
            return @grid[row][col]
        end

        def []=(pos,mark)
            row,col = pos
            @grid[row][col]=mark
        end


        def empty?(pos)
            row,col=pos
            return @grid[row][col]=="_"
        end

        def place_mark(pos,mark)
                raise "invalid input" if !valid?(pos) || !empty?(pos)
                row,col=pos
                @grid[row][col]=mark
        end


        def print
            @grid.each do |sArr|
                puts sArr.join(" ")
            end
        end

        def valid?(pos)
            return pos.all? do |i|
                0 <= i && i < @grid.length
            end
        end

        def win_row?(mark)
            return @grid.any?{|row| row.all?(mark)}
        end

        def win_col?(mark)
            return @grid.transpose.any?{|col| col.all?(mark)}
        end

        def win_diagonal?(mark)
                left_right = (0...@grid.length).all? do |i|
                    @grid[i][i]==mark
                end

                right_left = (0...@grid.length).all? do |i|
                        row=i
                        col=@grid.length-i-1
                        @grid[row][col]==mark
                end
            return left_right||right_left
        end

        def win?(mark)
            return win_col?(mark) || win_diagonal?(mark) || win_row?(mark)
        end

        def empty_positions?
             return @grid.any?{|subarr| subarr.include?("_")}
        end


end