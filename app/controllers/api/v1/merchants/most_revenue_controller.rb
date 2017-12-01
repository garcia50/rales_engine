class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
    json_response(Merchant.most_revenue(params["quantity"]))
  end

  def show
    json_response(Merchant.most_revenue(params["quantity"]))
  end
end
