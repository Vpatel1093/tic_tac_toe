#Build a tic-tac-toe game on the command line where two human #players can play against each other and the board is #displayed in between turns.

#Note: Game only functional when correct syntax used for user #input.



#Example game:
# > load 'tic_tac_toe.rb'
# => true
# > P1 = TicTacToe::Player.new({color: "O", name: "P1"})
# => #<TicTacToe::Player:0x0000000218ea50 @color="O", @name="P1">
# > P2 = TicTacToe::Player.new({color: "X", name: "P2"})
# => #<TicTacToe::Player:0x0000000217f870 @color="X", @name="P2">
# > players = [P1,P2]
# => [#<TicTacToe::Player:0x0000000218ea50 @color="O", @name="P1">, #<TicTacToe::Player:0x0000000217f870 @color="X", @name="P2">]
# > TicTacToe::Game.new(players).play
# => P1 has been randomly selected to be the first player!
#		 _ _ _
#		 _ _ _
#		 _ _ _
#		 P1: Enter a number between 1 and 9 to make your move.
#		 1
#		 O _ _
#		 _ _ _
#		 _ _ _
#
#		 P2: Enter a number between 1 and 9 to make your move.
#		 2
#		 O X _
#		 _ _ _
#		 _ _ _
#
#		 P1: Enter a number between 1 and 9 to make your move.
#		 3
#		 O X O
#		 _ _ _
#		 _ _ _
#
#		 P2: Enter a number between 1 and 9 to make your move.
#		 4
#		 O X O
#		 X _ _
#		 _ _ _
#
#		 P1: Enter a number between 1 and 9 to make your move.
#		 5
#		 O X O
#		 X O _
#		 _ _ _
#
#		 P2: Enter a number between 1 and 9 to make your move.
#		 6
#		 O X O
#		 X O X
#		 _ _ _
#
#		 P1: Enter a number between 1 and 9 to make your move.
#		 7
#		 P1 won!
#		 O X O
#		 X O X
#		 O _ _
# => nil
