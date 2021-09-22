class TripsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  before_action :set_trip, only: [ :show, :edit, :update, :destroy]

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
    @user = User.find(params[:id])
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
   @trip.images.detach #一旦、すべてのimageの紐つけを解除
    if @trip.update(trip_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    flash[:success] = "削除しました"
    redirect_to trips_path
  end

  def upload_image
      @image_blob = create_blob(params[:image])
      respond_to do |format|
        format.json { @image_blob }
      end
  end

  private

  def set_trip
    @trip = Trip.with_attached_images.find(params[:id])
    @trip_tags = @trip.tags
  end

  def trip_params
    params.require(:trip).permit(:date_time, :city, :title, :description, :evaluation, :category_id).merge(images: uploaded_images)
  end

  def uploaded_images
    params[:trip][:images].map{|id| ActiveStorage::Blob.find(id)} if params[:trip][:images]
  end

  def ensure_correct_user
    @trip = Trip.find(params[:id])
    @user = @trip.user
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def create_blob(uploading_file)
    ActiveStorage::Blob.create_after_upload! \
      io: uploading_file.open,
      filename: uploading_file.original_filename,
      content_type: uploading_file.content_type
  end
end