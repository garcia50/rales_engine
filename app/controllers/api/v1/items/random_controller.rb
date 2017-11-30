class Api::V1::Items::RandomController < ApplicationController
  def show
    json_response(Item.random)
  end
end
