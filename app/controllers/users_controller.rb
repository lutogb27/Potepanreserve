class UsersController < ApplicationController

  def new
    @user = User.new
  end
 
  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password))
    if @user.save
      redirect_to users_show_path
    else
      render "new"
    end
  end
 
  def show
    @user = current_user
  end
 
  def edit
    @user = User.find(current_user.id)
  end
 
  def update
    @user = User.find(current_user.id)
    if current_user.update(params.require(:user).permit(:User_icon, :name, :profile))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to users_show_path
    else
      flash[:notice] = "ユーザー情報を登録できませんでした"
      render "edit"
    end
  end
 
  def destroy
  end
  
  def user_icon
    send_data(@user.user_icon, disposition: :inline)
  end
end