class Api::V1::Items::MostQuantityController < ApplicationController
  def index
    json_response(Item.most_quantity(params["quantity"]))
  end
end
