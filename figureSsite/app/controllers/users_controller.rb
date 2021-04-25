class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @figures = @user.figures.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def follower
    user = User.find(params[:user_id])
    @following_users = user.following_user
  end

  def followed
    user = User.find(params[:user_id])
    @follower_users = user.follower_user
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
