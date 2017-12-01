class Api::V1::Items::BestDayController < ApplicationController
  def show
    render json: Item.find(params[:id]), serializer: BestDaySerializer
  end
end
