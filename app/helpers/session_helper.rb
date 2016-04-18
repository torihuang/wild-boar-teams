module SessionHelper

  def log_in
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    if logged_in?
      @current_user = User.find(session[:user_id])
    end
  end

  def logged_in?
    session[:user_id]
  end

end
