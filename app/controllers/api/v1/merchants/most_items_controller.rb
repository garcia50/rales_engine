class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    json_response(Merchant.most_items_sold(params[:quantity]))
  end
end
