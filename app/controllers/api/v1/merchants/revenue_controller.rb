class Api::V1::Merchants::RevenueController < ApplicationController

  # def index
  #   json_response(Merchant.find(params[:id]).total_revenue_response)
  # end

  def show
    render json: Merchant, serializer: TotalRevenueSerializer, scope: { date: params["date"]}
  end
end
