class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :move_to_show, expect: [:show]

  def show
    @posts = Post.all.order(id: 'DESC')
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = current_user
  end

  def move_to_show
    redirect_to action: :show unless user_signed_in?
  end
end
