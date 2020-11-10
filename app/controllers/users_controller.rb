class UsersController < ApplicationController
  before_action :move_to_show, expect: [:show]

  def show
    @posts = Post.all.order(id: 'DESC')
    @user = User.find(params[:id])
  end

  private

  def move_to_show
    redirect_to action: :show unless user_signed_in?
  end
end
