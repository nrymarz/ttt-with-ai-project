class Board
    def initialize
        @cells = Array.new(9,' ')
    end
    attr_accessor :cells
    def reset!
        @cells = Array.new(9,' ')
    end
    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} " 
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end
    def position(index)
        @cells[index.to_i - 1]
    end
    def full?
        @cells.all? {|char| char == "X" || char == 'O' }
    end
    def turn_count
        @cells.count {|char| char == "X" || char == "O"}
    end
    def taken?(input)
        self.position(input) == "X" || self.position(input) == "O"
    end
    def valid_move?(input)
        input.to_i.between?(1,9) && !self.taken?(input)
    end
    def update(input,player)
        @cells[input.to_i-1] = player.token
    end
end