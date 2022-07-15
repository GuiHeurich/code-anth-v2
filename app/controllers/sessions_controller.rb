class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.find_by(username: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to login_path
    end
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)
  end
end
