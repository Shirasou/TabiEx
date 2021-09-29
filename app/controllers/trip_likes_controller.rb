class TripLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @trip = Trip.find(params[:trip_id])
    trip_like = @trip.trip_likes.new(user_id: current_user.id)
    trip_like.save
    # 通知の
    @trip.create_notification_by(current_user)
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    trip_like = @trip.trip_likes.find_by(user_id: current_user.id)
    trip_like.destroy
  end
end
