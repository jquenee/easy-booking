class User < ActiveRecord::Base

  def self.authenticate_with_session(id, session)
    user = find_by_id(id)
    (user && user.session == session) ? user : nil
  end

end
