class Card
    def initialize
       @suit = ''
       @number = 0
    end

    def initialize(number, suit)
       @number = number
       @suit = suit
    end

    def to_s
       @result = @number

       if @number == 1
          @result = "A"
       elsif @number == 11
          @result = "J"
       elsif @number == 12
          @result = "Q"
       elsif @number == 13
          @result = "K"
       end

       "#{@result}#{@suit}"
    end
end

class DeckController < ApplicationController
    def initialize
       @deck = Array.new
 
       ['H', 'S', 'D', 'C'].each do |suit|
          1.upto(13).each do |num|
             @deck << Card.new(num, suit)
          end
       end
    end

    def start
       @message = "Deck initialized."

       @sizeof = @deck.size
    end 

    def deckOutput
       @message = ""
    end

    def shuffle
       5.times { @deck.sort! { rand } }
    end       
end
