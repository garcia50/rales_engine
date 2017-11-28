class Api::V1::MerchantsController < ApplicationController

  def index
    json_response(Merchant.all)
  end

  def show
    json_response(Merchant.find(params[:id]))
  end  
end
