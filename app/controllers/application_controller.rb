class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :reset_session
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  include SessionsHelper
  include BookingsHelper

 def render_404
  render :file => "public/404.html",  :status => 404
 end

 private
 def authenticate
    deny_access unless signed_in?
 end

 def authenticate_admin
    deny_access_admin unless signed_in? and admin?
 end

 def deny_access_admin
   flash[:failure] = "You do not have access to that page."
   redirect_to '/login'
 end

 # we redirect user directly to default page (use case: booking already removed by other user)
 def record_not_found
   redirect_to '/calendar'
 end
end
