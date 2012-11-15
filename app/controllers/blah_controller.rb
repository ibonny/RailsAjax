class BlahController < ApplicationController
   def index
   end
 
   def test_method
      "This is a test"

      respond_to do |format|
         format.js do
            render :update do |page|
               page.replace_html ("test_div", { :partial => "something" } )
            end
         end
      end
   end

   def update
      "Testout"

      respond_to do |format|
         format.js do
            render :update do |page|
               page.replace_html ("test_div", { :partial => "something" } )
            end
         end
      end
   end
end
