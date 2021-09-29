class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @users = User.page(params[:page]).per(6)
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @trips = @user.trips.page(params[:page]).per(6)
    @trip_ways = @user.trip_ways.page(params[:page]).per(3)
    @user_entry1 = Entry.where(user_id: current_user.id)
    @user_entry2 = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @user_entry1.each do |cu|
        @user_entry2.each do |u|
          if cu.room_id == u.room_id
            @is_room = true
            @room_id = cu.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "編集しました。"
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :sex, :birth_at, :image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
