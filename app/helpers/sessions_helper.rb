module SessionsHelper

  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.session]
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def admin?
    current_user.admin
  end

  def deny_access
    redirect_to root_path, :notice => "Merci de vous identifier pour rejoindre cette page."
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def current_user=(user)
    @current_user = user
  end

  private

    def user_from_remember_token
      User.authenticate_with_session(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

end
