class Api::V1::Merchants::RevenueByMerchantController < ApplicationController

  def show
    render json: Merchant.find(params[:id]), serializer: RevenueByMerchantSerializer, scope: { date: params["date"]}
  end
end
