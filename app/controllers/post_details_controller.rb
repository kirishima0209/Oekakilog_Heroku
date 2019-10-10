class PostDetailsController < ApplicationController
  
  def new
    @post = Post.find_by(id: params[:post_id])
    if current_user.id == @post.user_id
      @post_detail = PostDetail.new
    else
      redirect_to posts_path, danger: '権限がありません'
    end  
  end
  
  def create
    @post = Post.find_by(id: params[:post_id])
    if current_user.id == @post.user_id
      @post_detail = PostDetail.new(post_detail_params)
      @post_detail.post_id = params[:post_id]
      if @post_detail.save
        redirect_to new_post_post_detail_path(post_id: @post.id)
      else
        render :new
      end
    else
      redirect_to posts_path, danger: '権限がありません'
    end 
  end
  
  def destroy
    @post = Post.find_by(id: params[:post_id])
    if current_user.id == @post.user_id
      @post_detail = PostDetail.find(params[:id])
      @post_detail.destroy
      redirect_to new_post_post_detail_path(post_id: @post.id)
    else
      redirect_to posts_path, danger: '権限がありません'
    end  
  end  
  
  private
  def post_detail_params
    params.require(:post_detail).permit(:image, :content)
  end  
end
