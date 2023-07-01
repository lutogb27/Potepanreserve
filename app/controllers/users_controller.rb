class UsersController < ApplicationController

  def new
    @user = User.new
  end
 
  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password))
    if @user.save
      redirect_to :users_show_path
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
    @user.image = "https://rails-02-sample.herokuapp.com/assets/common/default-avatar-7a6cbfd7993e89f24bfc888f4a035a83c6f1428b8bdc47eed9095f2799a40153.png"
    @user = User.find(current_user.id)
    if current_user.update(params.require(:user).permit(:User_icon, :name, :profile))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to :users_show_path
    else
      render "edit"
    end
  end
 
  def destroy
  end
  
  def user_icon
    send_data(@user.user_icon, disposition: :inline)
  end
end