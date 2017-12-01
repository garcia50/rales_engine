class Api::V1::Merchants::RevenueByMerchantController < ApplicationController

  # def index
  #   json_response(Merchant.find(params[:id]).total_revenue_response)
  # end

  def show
    render json: Merchant.find(params[:id]), serializer: RevenueByMerchantSerializer, scope: { date: params["date"]}
  end
end
