class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by(login: user_params[:login].strip)
    if @user && @user.password.strip == user_params[:password]
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to new_user_path
      session[:user_id].clear if session[:user_id].present? && !session[:user_id].is_a?(Integer)
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to new_user_path
  end

  private

  def user_params
    params.expect(user: [:login, :password])
  end
end
