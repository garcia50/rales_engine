class Api::V1::Items::FindController < ApplicationController
  def index
    json_response(Item.where(valid_params))
  end

  def show
    json_response(Item.find_by(valid_params))
  end

  private

  def valid_params
    params.permit(:id,
                  :name,
                  :description,
                  :unit_price,
                  :created_at,
                  :updated_at,
                  :merchant_id)
  end
end