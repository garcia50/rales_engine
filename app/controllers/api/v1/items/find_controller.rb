class Api::V1::Items::FindController < ApplicationController
  def index
    render json: delegate_multiple_finder(Item, params,valid_params)
  end

  def show
    render json: delegate_single_finder(Item, params, valid_params)
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