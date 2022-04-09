class SearchesController < ApplicationController
  def search
    @content = params[:content]
    @model = params[:model]
    @record = search_for(@model,@content)
  end
  private
  def search_for(model,content)
    if model == "User"
      User.where(name: content)
    elsif model == "Bike"
      PostBike.where(name: content)
    end
  end
end
