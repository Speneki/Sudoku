require_relative "tile"

class Board
    def initialize
        @grid = []
        File.open("sudoku1.txt", "r") do |f|
            f.each_line do |line|
                row = []
                line.each_char do |char|
                    row << Tile.new(char) if char != "\n"
                end
                @grid << row
            end
        end
    end

    def visualize_grid
        # (1..9).each do |x|
        #     (1..9).each do |y|
        #         print @grid[x][y]
        #     end
        # end
        count = 0;
        @grid.flatten.each do |tile|
            count += 1
            if tile.val == "0"
                print " |"
            else
                print tile.val + "|"
            end
            if count == 9
                puts
                count = 0
            end
        end 
    end
end

b = Board.new
b.visualize_grid