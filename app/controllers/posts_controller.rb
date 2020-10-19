class PostsController < ApplicationController
  before_action :set_post, only: [:show,:edit,:update,:destroy]
  
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

  def edit
  end

  def update
    if @post.update(update_params)
      redirect_to post_path
    else 
      render :edit
    end
  end

  def destroy
    if @post.destroy
    redirect_to root_path
    else
      render :show
    end
  end

  private

  def post_params
    params.require(:posts_tag).permit(:image, :title, :text, :name).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:post).permit(:image, :title, :text)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
