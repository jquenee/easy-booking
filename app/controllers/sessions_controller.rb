class SessionsController < ApplicationController

 # GET /
 # we need to know if the session has been already authenticated
 def new
   cuser = User.find_by_session(session[:session_id])
   # not found => redirect to authentication page
   if cuser.nil?
     render 'auth'
   else
     logger.info("welcome: #{cuser.session}")
     sign_in(cuser)
     redirect_to '/calendar'
   end
 end

 # force to relogin
 # GET /login
 def relogin
   render 'auth'
 end

 # POST /sessions
 def create
  # setting = Settings.where(key: "website_password").first
  website_password = Settings.find_by_key('website_password')
  admin_password = Settings.find_by_key('admin_password')
  # logger.info("PASSWORD: #{setting.value}, KEY: #{setting.key}, ID: #{setting.id}")
  if admin_password.value == params[:session][:password]
    # session authenticated
    # record in database (file)
    user = User.new(:session => session[:session_id])
    user.admin = true
    user.save
    # record in server session (memory). see sessions_helper.rb
    sign_in(user)
    redirect_to '/admin'
  elsif website_password.value == params[:session][:password]
    # session authenticated
    # record in database (file)
    user = User.new(:session => session[:session_id])
    user.admin = false
    user.save
    # record in server session (memory). see sessions_helper.rb
    sign_in(user)
    redirect_to '/calendar'
  else
    flash.now[:error] = "Mot de passe invalide."
    render 'auth'
  end
 end

 # DELETE /sessions
 def destroyall
   User.delete_all
   logger.info("all sessions have been removed correctly")
   redirect_to '/admin'
 end

end
