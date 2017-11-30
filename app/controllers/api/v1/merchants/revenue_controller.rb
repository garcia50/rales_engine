class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    json_response(Merchant.find(params[:id]).total_revenue_response)
  end

  def show
    json_response(Merchant.total_revenue(params["date"]))
  end
end
