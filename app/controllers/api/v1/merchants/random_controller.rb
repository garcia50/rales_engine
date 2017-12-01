class Api::V1::Merchants::RandomController < ApplicationController
  def show
    json_response(Merchant.random)
  end
end
