class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :ensure_current_user

  def index
    @users = User.all
  end

  def show
    @coins = User.get_user_coins(@user.id)
  end
  
  # def get_user_coins
  #   @coins = User.get_user_coins(params[:user_id])
  #   if @coins.present?
  #     user_id = params[:user_id]
  #     @user = User.find_by(id: user_id)
  #     @coins_info = Cryptocompare::CoinList.all["Data"]
  #   end
  #   respond_to :js
  # end

  def new
    @user = User.new
  end

  def edit_modal
    user_id = params[:user_id]
    @user = User.find_by(id: user_id)
    respond_to :js
  end

  def delete_user
    @user = User.find_by(id: params[:id])
    @deleted = @user.delete if @user
    respond_to :js
  end

  def create
    @users = User.all
    @can_create = !User.find_by(login: user_params[:login]).present?
    if @can_create
      @user = User.new(user_params)
      @saved = @user.save
    end
    redirect_to user_path(@user.id) if @saved
  end
  
  def update
    @user = User.find_by_id(params[:id])
    @updated = @user.update(user_params)
    redirect_to edit_user_path(@user.id) if @updated
  end

  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "User was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params.expect(:id))
    end

    def user_params
      params.expect(user: [ :firstname, :lastname, :role, :email, :login, :password, :balance ])
    end
end
