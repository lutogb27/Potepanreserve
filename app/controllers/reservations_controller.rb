class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @reservations = Reservation.all
    @rooms = Room.all
  end

  def new
    @user = current_user
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new

  end

  def search
    @rooms = Room.search(params[:keyword])
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.checkin_at. == nil
      redirect_to @room, alert:"開始日を入力してください" and return
    end
    if @reservation.checkout_at. == nil
      redirect_to @room, alert:"終了日を入力してください" and return
    end
    if @reservation.checkout_at < @reservation.checkin_at
      redirect_to @room, alert:"終了日は開始日以降の日付にしてください" and return
    end
    if @reservation.person_count == nil
      redirect_to @room, alert:"正しい人数を入力してください" and return
    end
    @total_day = (@reservation.checkout_at - @reservation.checkin_at).to_i 
    @total_price = (@total_day * @reservation.person_count * @room.price)
  end


  def create
    @user = current_user
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "予約に成功しました"
      redirect_to reservations_path (@reservation)
    else
      flash.now[:alert] = "予約に失敗しました"
      render "rooms/show"
    end
  end

  def show
    @user = current_user
    @reservations = Reservation.all
    @reservations = Reservation.where(room_id: @room.id)
  end

  def edit
    @rooms = Room.all
    @reservation = Reservation.find(params[:id])
  end

  def update
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "削除しました"
    redirect_to reservations_path
  end

  def reservation_params
    params.require(:reservation).permit(:checkin_at, :checkout_at, :person_count , :user_id, :room_id , :created_at , :updated_at)
  end
end