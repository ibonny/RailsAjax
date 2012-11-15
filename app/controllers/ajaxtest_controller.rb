class AjaxtestController < ApplicationController
   def index
      respond_to do |format|
         format.js do
            @mystr = "<p>The time is <b> " << Time.new.inspect << "</b>.</p>"

            render :js => "$('time_div').update('" << @mystr << "')"

#            render :text => "<p>The time is <b>" + DateTime.now.to_s + "</b></p>"

#            render :js => "alert('Test!')"
         end
      end
   end

   def say_when
      respond_to do |format|
         format.js do
            @mystr = "<p>The time is <b> " << Time.new.inspect << "</b>.</p>"

            render :js => "$('time_div').update('" << @mystr << "')"

#          render :text => "<p>The time is <b>" + DateTime.now.to_s + "</b></p>"

#            render :js => "alert('Test!')"
         end
      end
   end

   def do_button
      respond_to do |format|
         format.js do
            @mystr = "<p>OK, it worked.</p>"

            render :js => "$('button_div').update('" << @mystr << "')"
         end
      end
   end
end
