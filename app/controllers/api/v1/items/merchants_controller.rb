class Api::V1::Items::MerchantsController < ApplicationController
  def show
    json_response(Item.find(params[:id]).merchant)
  end
end
