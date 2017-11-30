class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    json_response(Merchant.find(params[:id]).total_revenue_response)
  end
end
