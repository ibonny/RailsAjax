class CipherClass
   def generateSquare
      @newstr = ('a'..'z').to_a
      
      (@newstr.sort! { rand }).to_s
   end
      
   def wrap(str)
      @i = 0
      
      while true
         break if @i > str.length-1 
     
         str.insert(@i, " ") if ((@i+1) % 6 == 0)
      
         @i += 1
      end
      
      str
   end
      
   def address(char, square)
      @index = square.index(char)
      
      @x = @index % 5
      @y = @index / 5
      
      return @x, @y
   end
      
   def docipher(toencrypt)
#      @square = "phqgmeaylnofdxkrcvszwbuti"
       
      #@square = generateSquare()

      @square = self.generateSquare
   
      @rows = ""
      @cols = ""
      
      @period = 5
      
      toencrypt.gsub(/\s+/, "").each_char do |c|
         @x, @y = self.address(c, @square)
      
         @rows << @y.to_s
         @cols << @x.to_s
      end
      
      @outstr = ""
   
      while @rows.length > 0
         @outstr << @rows[0, @period]
         @outstr << @cols[0, @period]
   
         @rows[0, @period] = ""
         @cols[0, @period] = ""
      end
      
      #puts @outstr
      
      @newstr = @square
      
      (0..@outstr.length-1).step(2) do |i|
         @r = @outstr[i, 1].to_i
         @c = @outstr[i+1, 1].to_i
      
         @newstr << @square[(@r * 5)+@c, 1]
      end

      self.wrap(@newstr)
   end
end

class CipherController < ApplicationController
   def index
   end

   def initial
      @message = "Please enter your cipher."
   end

   def create
      @params = params[:toencrypt]

      @cipher = CipherClass.new 

      @result = CipherClass.new.docipher(@params)
   end

   def doit
   end
end
