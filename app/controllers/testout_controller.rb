class TestoutController < ApplicationController
   def hello
       @message = "OK, that's it. I can't figure out what's going on."
   end

   def index
   end

   def signup_path
      @values
   end

   def testajax
      @testdata = "ajaxy data"

      @person = ""

      respond_to do |format|
         format.html
         format.js
      end
   end
end
