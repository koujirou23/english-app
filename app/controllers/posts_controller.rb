class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  
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

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  private

  def post_params
    params.require(:posts_tag).permit(:image, :title, :text, :name).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
