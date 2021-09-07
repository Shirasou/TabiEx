class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @trip = Trip.find(params[:trip_id])
		@comment = Comment.new(comment_params)
		@comment.trip_id = @trip.id
		@comment.user_id = current_user.id
		if @comment.save
  		redirect_to trip_path(@trip.id)
		else
		  render 'trips/show'
		end
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
  	comment = @trip.comments.find(params[:id])
		comment.destroy
		redirect_to request.referer
  end

  private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
