class Api::V1::Items::BestDayController < ApplicationController
  def show
    json_response(Item.find(params[:id]).best_day)
  end
end
