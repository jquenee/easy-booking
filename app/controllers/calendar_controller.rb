class CalendarController < ApplicationController
 before_filter :authenticate

 # GET /calendar/012015
 def show
  @date = params[:id]
  if @date == nil
   @date = Date.today.strftime("%m%Y")
  end
  puts "Show date " + @date
  redirect_to '/static-template/calendar.html'  
 end
 
end
