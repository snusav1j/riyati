class SessionsController < ApplicationController
  # before_action :ensure_current_user
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by(login: user_params[:login].strip)
    if @user && @user.password.strip == user_params[:password]
      session[:user_id] = @user.id
      send_tg_message_to_dev("- Пользователь ##{@user.id} авторизовался -\n\nИмя: #{@user.fullname}\nЛогин: #{@user.login}\nРоль: #{t("role_name_#{@user.role}")}")

      if session[:prev_cur_url].present? && !session[:prev_cur_url].include?('/users')
        redirect_to session[:prev_cur_url]
      else
        redirect_to root_path
      end
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
