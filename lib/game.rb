class Game
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    def initialize(player1=Players::Human.new('X'),player2=Players::Human.new("O"),board=Board.new)
        @player_1 = player1
        @player_2 = player2
        @board = board
    end
    attr_accessor :board, :player_1, :player_2
    def current_player
        self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
    end
    def won?
        WIN_COMBINATIONS.detect do |combo|
            combo.all? {|index| self.board.cells[index] == "X"} || combo.all? {|index| self.board.cells[index] == "O"}
        end
    end
    def draw?
        self.board.full? && !self.won?
    end
    def over?
        self.won? || self.draw?
    end
    def winner
        won? ? self.board.cells[won?[0]] : nil
    end
    def turn
        input = ''
        until self.board.valid_move?(input)
            input = self.current_player.move(self.board)
            puts "Invalid move" if !self.board.valid_move?(input)
        end
        self.board.update(input,self.current_player)
    end
    def play 
        until self.over?
            self.turn
            self.board.display
        end
        if self.won?
            puts "Congratulations #{self.winner}!"
        else
            puts "Cat's Game!"
        end
    end
end


