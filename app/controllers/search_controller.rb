class SearchController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model =='user'
      @records = User.search_for(@content, @method)
    elsif @model == 'trip'
      @records = Trip.search_for(@content, @method)
    else
      @records = TripWay.search_for(@content, @method)
    end
  end
end
