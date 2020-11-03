module Players
    class Computer < Player 
        def move(board)
            num = ''
            until board.valid_move?(num)
                num = rand(9).to_s
            end
            num
        end
    end
end
