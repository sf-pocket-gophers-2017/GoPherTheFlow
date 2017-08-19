helpers do
  def current_user
    # session[:user_id] ? User.find(session[:user_id]) : nil
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def logout
    session[:user_id] = nil
  end
end
