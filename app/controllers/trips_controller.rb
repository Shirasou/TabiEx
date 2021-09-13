class TripsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @tag_lists = Tag.all
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
    @trip_tags = @trip.tags
  end

  def create
    @trip = Trip.new(trip_params)
    tag_list = params[:trip][:name].split(nil)
    @trip.user_id = current_user.id
    if @trip.save
      @trip.save_tag(tag_list)
      flash[:success] = "作成しました"
      redirect_to trips_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @trips = @tag.trips.all
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
      redirect_to trips_path, notice: "You have updated book successfully."
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
    @trip_tags = @trip.tags
  end

  def trip_params
    params.require(:trip).permit(:date_time, :city, :title, :description, :evaluation, images: [])
  end

  def ensure_correct_user
    @trip = Trip.find(params[:id])
    @user = @trip.user
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end