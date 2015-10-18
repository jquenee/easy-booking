class SessionsController < ApplicationController

 # we need to know if the session has been already authenticated
 def new
   cuser = User.find_by_session(session[:session_id])
   # not found => redirect to authentication page
   if cuser.nil?
     render 'auth'
   else
     puts "welcome: #{cuser.session}"
     redirect_to '/static-template/calendar.html'
   end
 end

 def create
  if "password" == params[:session][:password]
    # session authenticated
    user = User.new(:session => session[:session_id])
    user.save
    redirect_to '/static-template/calendar.html'
  else
    flash.now[:error] = "Mot de passe invalide."
    render 'auth'
  end
 end

end
