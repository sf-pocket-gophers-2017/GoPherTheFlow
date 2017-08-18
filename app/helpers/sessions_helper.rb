helpers do
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.delete([:user_id])
  end
end
