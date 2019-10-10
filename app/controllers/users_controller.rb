class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    #binding.pry
    @user = User.new(user_params)
    @user.image = "人物アイコン.jpeg"
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end  
  
  def show
    @user = User.find(params[:id])
    @posts = Post.all
  end  
  
  def edit
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else 
      flash[:danger] = "権限がありません"
      redirect_to posts_path
    end    
  end  
  
  def update
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path(@user)
        flash[:success] = 'ユーザー情報を編集しました。'
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end  
    else 
      flash[:danger] = "権限がありません"
      redirect_to posts_path
    end   
  end  
  
  def destroy
    if current_user.id == params[:id].to_i
      @user = User.find_by(id: params[:id])
      @user.destroy
      flash[:success] = "ユーザーを削除しました"
      redirect_to root_path
    else 
      flash[:danger] = "権限がありません"
      redirect_to posts_path
    end    
  end  
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end  
end
