class Api::V1::Items::MostItemsController < ApplicationController
  def index
    json_response(Item.most_items(params["quantity"]))
  end
end
