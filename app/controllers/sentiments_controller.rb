class SentimentsController < ApplicationController
  def index
    @brand = Brand.find(params[:id])
    # TODO: over a given time period?
    @sentiments = @brand.sentiments
  end

end
