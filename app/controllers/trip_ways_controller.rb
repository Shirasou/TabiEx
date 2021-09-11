class TripWaysController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  before_action :set_trip_way, only: [:show, :edit, :update, :destroy]

  def index
    @trip_ways = TripWay.all
  end

  def new
    @trips = current_user.trips.all
    @trip_way = TripWay.new
    @trip_way.trip_way_relation.build
  end

  def create
    @trip_way = TripWay.new(trip_way_params)
    @trip_way.user_id = current_user.id
    if @trip_way.save
      flash[:success] = "作成しました"
      redirect_to trip_ways_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if trip_way.update(trip_way_params)
      redirect_to trip_way_path(@trip_way), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @trip_way.destroy
    flash[:success] = "削除しました"
    redirect_to trip_ways_path
  end

  private

  def set_trip_way
    @trip_way = Trip_way.find(params[:id])
  end

  def trip_way_params
    params.require(:trip_way).permit(:title, :evaluation, :description, :start_date, :finish_date, :number_of_people, trip_way_relation_attributes:[:trip_id, :trip_way_id, :number])
  end

  def ensure_correct_user
    @trip_way = Trip_way.find(params[:id])
    @user = @trip_way.user
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end