class Api::V1::Items::MostRevenueController < ApplicationController
  def index
    json_response(Item.most_revenue(params["quantity"]))
  end
end