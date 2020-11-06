class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]
  
  def index
    @posts = Post.all.order(id: 'DESC')
  end

  def new
    @post = PostsForm.new
  end

  def create
    @post = PostsForm.new(create_params)
    if @post.save
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
    load_post
    @form = PostsTag.new(post: @post)
  end

  def update
    load_post
    @form = PostsTag.new(post_params, post: @post)
    if @form.save
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
    params.require(:post).permit(:image, :title, :text, :name).merge(user_id: current_user.id)
  end

  def create_params
    params.require(:posts_form).permit(:image, :title, :text,:name).merge(user_id: current_user.id)
  end

  def load_post
    @post = current_user.posts.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
