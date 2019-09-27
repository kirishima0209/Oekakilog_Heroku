class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    #binding.pry
    @user = User.new(user_params)
    @user.image_url = "人物アイコン.jpeg"
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end  
  end  
  
  def show
    @user = User.find_by(id: params[:id])
  end  
  
  def edit
    @user = User.find_by(id: params[:id])
  end  
  
  def update
  end  
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end  
end
