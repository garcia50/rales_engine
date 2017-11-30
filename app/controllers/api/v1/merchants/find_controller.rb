class Api::V1::Merchants::FindController < ApplicationController

  def index
    json_response(Merchant.where(valid_params))
  end

  def show
    json_response(Merchant.find_by(valid_params))
  end

  private

  def valid_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

end
