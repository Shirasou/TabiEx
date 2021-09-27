class SearchesController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'user'
      @records = User.search_for(@content, @method).page(params[:page]).per(6)
    elsif @model == 'trip'
      @records = Trip.search_for(@content, @method).page(params[:page]).per(6)
    else
      @records = TripWay.search_for(@content, @method).page(params[:page]).per(3)
    end
  end
end
