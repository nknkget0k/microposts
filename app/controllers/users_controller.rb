class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
  def show 
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user 
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user , notice: 'メッセージを編集しました'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :area, :password, 
                                 :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end

