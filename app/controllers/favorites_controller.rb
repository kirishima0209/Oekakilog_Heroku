class FavoritesController < ApplicationController
  def index
    @favorite_posts = current_user.favorites_posts
  end
  
  def create
    favorite =Favorite.new
    favorite.user_id = current_user.id
    favorite.post_id = params[:post_id]
    @post = Post.find(params[:post_id])
    favorite.save
  end
  
  def destroy
    favorite = Favorite.find_by(
      user_id: current_user.id,
      post_id: params[:post_id]
      ) 
    @post = Post.find(params[:post_id])
    favorite.destroy
  end  
end
