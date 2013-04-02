class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  def require_user
    unless logged_in?
      flash[:error] = "Must be logged in to do that."
      redirect_to root_path
    end
  end

  def current_user
  	return false if session[:user_id].nil?
  	@current_user ||= User.find(session[:user_id]) 
  	      #every request dont have to db everytime so add @current and ||
    end

    def logged_in?
    	!!current_user  #!! forces boolena return
    end
  def ctgry_all
   @cats = Category.all
   end

end
