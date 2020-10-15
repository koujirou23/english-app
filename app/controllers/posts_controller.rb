class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: 'DESC')
  end

  def new
    @post = PostsTag.new
  end

  def create
    @post = PostsTag.new(post_params)
    if @post.valid?
      @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:posts_tag).permit(:image, :title, :text, :name).merge(user_id: current_user.id)
  end
end
