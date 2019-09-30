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
    #binding.pry
  end  
  
  def edit
    @user = User.find(params[:id])
  end  
  
  def update
    @user = User.find(params[:id])
    #binding.pry
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:success] = 'ユーザー情報を編集しました。'
    else
      #binding.pry
      flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
      render :edit
    end  
  end  
  
  def destroy
    @user = User.find_by(id: params[:id])
    #binding.pry
    @user.destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to root_path
  end  
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end  
end
