class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    @users = User.all
  end  
  
  def new
    if logged_in?
      @post = Post.new
    else
      redirect_to root_path, danger: 'ログインが必要です'
    end  
  end
  
  def create
    if logged_in?
      @post = current_user.posts.new(post_params)
      if @post.save
        redirect_to posts_path, success: '投稿に成功しました'
      else
        flash.now[:danger] = '投稿に失敗しました'
        render :new
      end  
    else
      redirect_to root_path, danger: 'ログインが必要です'
    end  
  end

  private
  def post_params
    params.require(:post).permit(:title, :image)
  end
end  
