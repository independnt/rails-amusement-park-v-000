class SessionsController < ApplicationController
  skip_before_action :authentication_required, only:[:home, :new, :create]

  def home
    if logged_in?
      redirect_to user_path(@current_user)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end


end
