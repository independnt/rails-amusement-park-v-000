class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :authentication_required, :logged_in?, :is_admin?
  before_action :authentication_required


  def authentication_required
    if !logged_in?
      redirect_to root_path, flash: {notice: "You need to be logged in to do that!"}
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def is_admin?
    if !current_user.admin
      redirect_to root_path, flash: {notice: "You don't have access to that"}
    end
  end


end
