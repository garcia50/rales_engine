class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
    json_response(Merchant.most_revenue(params["quantity"]))
  end
end
