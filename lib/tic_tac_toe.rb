require 'pry'

class TicTacToe

    def initialize(board = nil)
        @board = Array.new(9, " ")
    end 

    WIN_COMBINATIONS = [ 
        [0,1,2], # Top row
        [3,4,5],  # Middle row
        [6,7,8],
        [0,3,6], 
        [1,4,7], 
        [2,5,8],
        [0,4,8], 
        [2,4,6]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(input)
          input.to_i - 1
    end 
    
    
    def  move (index, token = "X")
      @board[index] = token
    end
    
    def position_taken?(index)
      @board[index] != " "
    end
    
    def valid_move?(index)
      !position_taken?(index) && index.between?(0,8)
    end
    
    def turn_count 
      @board.count { |position| position !=" " }
        
        
    end
    
    def current_player
      if turn_count % 2 == 0
        "X"
      else 
        "O"
      end 
          end 
    
    def turn 
      puts "Please input a number"
        
        
          input = gets.chomp
          index = input_to_index(input)
      
              if valid_move?(index)
                  move(index, current_player)
                      display_board
              else 
                      turn
              end
          end 
    
    def won? 
 
          WIN_COMBINATIONS.find do |combo| 
            if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
              return combo
              end   
          end        
    end
    
    def full?
        !@board.any? do |space| 
          
          space == " " 
          
          
        end 
        
         
        
        # What enumberable (other than each, map, or collect) might be helpful here?
      
    end 
    
    def draw?
      
    if full? && !won? 
         return true 
       elsif won? && !full? 
         return false 
       end 
    end 
    
    def over?
      
      won? || draw? 
      
    end 

  def winner
  
      if combo = won?
   
      @board[combo[0]]
    else
        nil 
      end 
    end 
    
    def play 
      until over?  
        turn
      end
         if won?
           puts "Congratulations #{winner}!"
        else draw?
           puts "Cat's Game!"
           
         end 
      end 
  end 
  