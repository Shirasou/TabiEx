class TripLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @trip = Trip.find(params[:trip_id])
    trip_like = @trip.trip_likes.new(user_id: current_user.id)
    trip_like.save
    redirect_to request.referer
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    trip_like = @trip.trip_likes.find_by(user_id: current_user.id)
    trip_like.destroy
    redirect_to request.referer
  end
end
