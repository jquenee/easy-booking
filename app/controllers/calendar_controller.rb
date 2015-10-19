class CalendarController < ApplicationController
 before_filter :authenticate, :only => [:show]

 def show
  redirect_to '/static-template/calendar.html'  
 end
 
 private
  def authenticate
    deny_access unless signed_in?
  end
end
