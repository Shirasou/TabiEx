class TripWaysController < ApplicationController
  before_action :authenticate_user!,except: [:index]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  before_action :set_trip_way, only: [:show, :edit, :update, :destroy]

  def index
    @trip_ways = TripWay.order(created_at: :desc).page(params[:page]).per(3)
    @tag_lists = Tag.all
  end

  def new
    @trips = current_user.trips.all
    @trip_way = TripWay.new
    @trip_way.trip_way_relations.build
  end

  def create
    @trip_way = TripWay.new(trip_way_params)
    @trip_way.user_id = current_user.id
    if @trip_way.save
      flash[:notice] = "作成しました"
      redirect_to trip_ways_path
    else
      render :new
    end
  end

  def show
    @user = @trip_way.user
    @trip_way_relations = @trip_way.trip_way_relations.all
    @old_trip_relation = @trip_way_relations.order(id: 'ASC').first
    @old_image = @old_trip_relation.trip.old_image
  end

  def edit
    @trips = current_user.trips.all
    @trip_way.trip_way_relations
  end

  def update
    @trip_way.trip_way_relations.delete_all
    if @trip_way.update(trip_way_params)
      flash[:notice] = "編集しました"
      redirect_to trip_way_path(@trip_way)
    else
      render "edit"
    end
  end

  def destroy
    @trip_way.destroy
    flash[:notice] = "削除しました"
    redirect_to trip_ways_path
  end

  private

  def set_trip_way
    @trip_way = TripWay.find(params[:id])
  end

  def trip_way_params
    params.require(:trip_way).permit(
      :title, :evaluation, :description, :start_date,:finish_date, :number_of_people,
      trip_way_relations_attributes: [:trip_id, :trip_way_id, :number, :_destroy])
  end

  def ensure_correct_user
    @trip_way = TripWay.find(params[:id])
    @user = @trip_way.user
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
