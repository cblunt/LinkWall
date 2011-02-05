class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

protected
  def current_user
    @current_user ||= User.criteria.id(session[:user_id]).first if session[:user_id]
  end
end
