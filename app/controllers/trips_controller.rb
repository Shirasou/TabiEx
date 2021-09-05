class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      flash[:success] = "作成しました"
      redirect_to trips_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def updated
  end

  def destroy
  end

  private

  def trip_params
    pramas.require(:trip).permit(:turn, :datetime, :city, :title, :description, :evaluation, :image)
  end

end
