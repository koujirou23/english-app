class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @posts = Post.all.order(id: 'DESC')
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to  user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:nickname, :email, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    unless user_signed_in? && current_user.id == @user.id
      redirect_to root_path
    end
  end

  
end
