class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: 'DESC')
  end

  def new
    @post = PostsTag.new
  end

  def create
    @post = PostsTag.new(post_params)
    # 受け取った文字列をカンマ（,）区切りで配列にする
    tag_list = params[:posts_tag][:name].split(/[[:blank:]]+/).select(&:present?)
    if @post.valid?
      @post.save
      @post.save_tag(tag_list)
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
