class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  def show
    json_response(Customer.find(params[:id]).favorite_merchant)
  end
end
