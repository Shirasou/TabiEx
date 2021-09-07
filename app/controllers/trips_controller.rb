class TripsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    if @trip.save
      flash[:success] = "作成しました"
      redirect_to trips_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if params[:trip][:image_ids]
      params[:trip][:image_ids].each do |image_id|
        image = @trip.images.find(image_id)
        image.purge
      end
    end
    if @trip.update_attributes(trip_params)
      flash[:success] = "編集しました"
      redirect_to trips_path
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    flash[:success] = "削除しました"
    redirect_to trips_path
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:date_time, :city, :title, :description, :evaluation, images: [])
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end