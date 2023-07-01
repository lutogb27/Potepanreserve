class RoomsController < ApplicationController
  def index
    @user = current_user
    @rooms = Room.all
  end

  def search
    @user = current_user
    @rooms = Room.search(params[:keyword])
    @keyword = params[:keyword]
  end
  
  def new
    @user = current_user
    @room = Room.new
  end
 
  def create
    @user = current_user
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "施設を登録しました"
      redirect_to :rooms
    else
      flash[:notice] = "施設を登録できませんでした"
      render "new"
    end
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end
 
  def update
     @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice] = "宿泊施設を更新しました"
      redirect_to rooms_path
    else
      render :edit
    end
  end
 
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to rooms_path
  end

  def room_params
    params.require(:room).permit(
      :room_name,
      :room_image,
      :introduction,
      :price,
      :address
    )
  end

end

