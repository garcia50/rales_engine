class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    json_response(Merchant.find(params[:id]).items)
  end
end