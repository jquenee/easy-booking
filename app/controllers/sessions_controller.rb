class SessionsController < ApplicationController

 # we need to know if the session has been already authenticated
 def new
   cuser = User.find_by_session(session[:session_id])
   # not found => redirect to authentication page
   if cuser.nil?
     render 'auth'
   else
     puts "welcome: #{cuser.session}"
     sign_in(cuser)
     redirect_to '/calendar'
   end
 end

 def create
  # setting = Settings.where(key: "website_password").first
  setting = Settings.find_by_key('website_password')
  # logger.info("PASSWORD: #{setting.value}, KEY: #{setting.key}, ID: #{setting.id}")
  if setting.value == params[:session][:password]
    # session authenticated
    user = User.new(:session => session[:session_id])
    user.save
    sign_in(user)
    redirect_to '/calendar'
  else
    flash.now[:error] = "Mot de passe invalide."
    render 'auth'
  end
 end

 # DELETE /sessions/
 def destroyall
   User.delete_all
   logger.info("all sessions have been removed correctly")
   redirect_to '/admin'
 end

end
