class Api::V1::Merchants::CustomersController < ApplicationController
  def show
    json_response(Merchant.find(params["id"]).favorite_customer)
  end
end


