class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in? # Because we are gonna use them in our views

  def current_user
    # Memoization -- we will only make the network call the first time and future calls just return the value
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # !!something -- the double bang operator transforms everything to boolean
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action."
      redirect_to login_path
    end
  end

end
