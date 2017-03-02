require_relative 'tic_tac_toe'

describe TicTacToe do
	describe TicTacToe::Cell do
		context "#initialize" do
			it "is initialized with a value of '' by default" do
				expect(TicTacToe::Cell.new.value).to eq("")
			end
		end
	end
	
	describe TicTacToe::Player do
		context "initialize" do
			it "raises an error when initialized without two arguments" do
				expect{TicTacToe::Player.new}.to raise_error
			end
		
			it "does not raise an error when initialized with two arguments" do
				expect{TicTacToe::Player.new({color:"X",name:"Sam"})}.to_not raise_error
			end
		end
		
		context "#name" do
			it "displays the name of the player" do
				expect(TicTacToe::Player.new({color:"X",name:"Sam"}).name).to eq("Sam")
			end
		end
		
		context "#color" do
			it "displays the color of the player" do
				expect(TicTacToe::Player.new({color:"X",name:"Sam"}).color).to eq("X")
			end
		end
	end	
		
	describe TicTacToe::Board do
		let(:board) {TicTacToe::Board.new}
		
		context "#initialize" do
			it "initializes the board with a grid" do
				expect{board.grid}.to_not raise_error	
			end
		
			it "has three rows in the grid" do
				expect(board.grid.size).to eq(3)
			end
			
			it "has three columns in each row" do
				board.grid.each do |row|
					expect(row.size).to eq(3)
				end
			end
		end
		
		context "#set_cell" do
			it "updates the value of the cell at an (x,y) coordinate" do
				board.set_cell(0,0,"O")
				expect(board.grid[0][0].value).to eq("O")
			end
		end
		
		context "#get_cell" do
			it "displays the value of the cell at an (x,y) coordinate" do
				expect(board.get_cell(0,0).value).to eq("")
			end
		end
		
		
		context "#winner?" do			
			it "returns true if player fills top row" do
				board.set_cell(0,0,"O")
				board.set_cell(1,0,"O")
				board.set_cell(2,0,"O")
				expect(board.send(:winner?)).to be true
			end
			
			it "returns true if player fills middle row" do
				board.set_cell(0,1,"O")
				board.set_cell(1,1,"O")
				board.set_cell(2,1,"O")
				expect(board.send(:winner?)).to be true
			end
			
			it "returns true if player fills bottom row" do
				board.set_cell(0,2,"O")
				board.set_cell(1,2,"O")
				board.set_cell(2,2,"O")
				expect(board.send(:winner?)).to be true
			end
			
			it "returns true if player fills left column" do
				board.set_cell(0,0,"O")
				board.set_cell(0,1,"O")
				board.set_cell(0,2,"O")
				expect(board.send(:winner?)).to be true
			end
			
			it "returns true if player fills middle column" do
				board.set_cell(1,0,"O")
				board.set_cell(1,1,"O")
				board.set_cell(1,2,"O")
				expect(board.send(:winner?)).to be true
			end
			
			it "returns true if player fills right column" do
				board.set_cell(2,0,"O")
				board.set_cell(2,1,"O")
				board.set_cell(2,2,"O")
				expect(board.send(:winner?)).to be true
			end
			
			it "returns true if player fills downward diagonal" do
				board.set_cell(0,0,"O")
				board.set_cell(1,1,"O")
				board.set_cell(2,2,"O")
				expect(board.send(:winner?)).to be true
			end
			
			it "returns true if player fills upward diagonal" do
				board.set_cell(0,2,"O")
				board.set_cell(1,1,"O")
				board.set_cell(2,0,"O")
				expect(board.send(:winner?)).to be true
			end	
		
			it "returns false if there is not a winner yet" do
				board.set_cell(0,1,"O")
				board.set_cell(1,1,"O")
				board.set_cell(2,2,"O")
				expect(board.send(:winner?)).to be false
			end
		end
		
		context "#draw?" do
			it "returns true if all cells are filled and there is no winner" do
				board.set_cell(0,0,"O")
				board.set_cell(1,0,"X")
				board.set_cell(2,0,"O")
				board.set_cell(0,1,"X")
				board.set_cell(1,1,"O")
				board.set_cell(2,1,"O")
				board.set_cell(0,2,"X")
				board.set_cell(1,2,"O")
				board.set_cell(2,2,"X")
				expect(board.send(:draw?)).to be true
			end
		end
	end
	
	describe TicTacToe::Game do
		let(:p1) {TicTacToe::Player.new(color:"X",name:"P1")}
		let(:p2) {TicTacToe::Player.new(color:"O",name:"P2")}
		let(:game) {TicTacToe::Game.new([p1,p2])}
		
		context "#initialize" do
			it "randomly selects a current and other player" do
				expect(game.current_player).to eq(p1).or(eq(p2))
				expect(game.other_player).to eq(p1).or(eq(p2))
			end
		end
		
		context "#switch_players" do
			it "sets @current_player to @other_player" do
				other_player = game.other_player
				game.switch_players
				expect(game.current_player).to eq(other_player)
			end
			
			it "sets @other_player to @current_player" do
				current_player = game.current_player
				game.switch_players
				expect(game.other_player).to eq(current_player)
			end
		end
		
		context "#get_move" do
			it "converts human move of '1' to coordinate of [0,0]" do
				expect(game.get_move('1')).to eq([0,0])
			end
			
			it "converts human move of '5' to coordinate of [1,1]" do
				expect(game.get_move('5')).to eq([1,1])
			end
		end
	end
end
